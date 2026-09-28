"""Exercise event isolation and start requests in a disposable Minecraft 26.2 server."""
from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED
import argparse
import json
import os
import queue
import shutil
import socket
import subprocess
import tempfile
import threading
import time

ROOT = Path(__file__).resolve().parents[1]


def put(root, name, text):
    path = root / name
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text.strip() + "\n", encoding="utf-8")


def fixture(root):
    put(root, "pack.mcmeta", json.dumps({"pack": {"min_format": [107, 1], "max_format": [107, 1], "description": "ZBK API test fixture"}}))
    handlers = {
        "register": 'function zbk:api/map/register {id:"zbk_test",version:10000}',
        "before_game_start": 'execute if score #defer zbk.test matches 1 if data storage zbk:events stack[-1].context{resuming:0} run function zbk:api/request/defer {owner:"zbk_test"}',
        "game_start_deferred": 'data modify storage zbk_test:state ticket set from storage zbk:events stack[-1].context',
        "game_start": 'scoreboard players add #starts zbk.test 1',
        "game_end": 'scoreboard players add #ends zbk.test 1',
        "round_end": '''scoreboard players add #round_ends zbk.test 1
data modify storage zbk_test:state round set from storage zbk:events stack[-1].context
function zbk:api/game/reset''',
        "before_manual_reload": '''execute if score #depth zbk.test matches 1 run return run function zbk:api/request/block
scoreboard players set #depth zbk.test 1
function zbk:dispatch/before_manual_reload
execute unless data storage zbk:events stack[-1].context{blocked:0b,event:"before_manual_reload"} run scoreboard players set #nested_failed zbk.test 1
scoreboard players set #depth zbk.test 0''',
        "before_jump_pad_purchase": 'execute if data storage zbk:events stack[-1].context{jump_pad_id:4} run function zbk:api/request/block',
    }
    for name, commands in handlers.items():
        put(root, f"data/zbk_test/function/{name}.mcfunction", commands)
        put(root, f"data/zbk/tags/function/event/{name}.json", json.dumps({"replace": False, "values": [f"zbk_test:{name}"]}))


def run(args):
    test = Path(tempfile.mkdtemp(prefix="zbk-api-26_2-"))
    (test / "world/datapacks").mkdir(parents=True)
    source = ROOT / "output/zombies_build_kit.zip"
    if not source.is_file():
        raise FileNotFoundError("Run python tools/package_pack.py first")
    shutil.copy2(source, test / "world/datapacks/core.zip")
    fixture(test / "world/datapacks/api_test")
    shutil.copy2(args.server_jar, test / "server.jar")
    put(test, "eula.txt", "eula=true")
    with socket.socket() as sock:
        sock.bind(("127.0.0.1", 0))
        port = sock.getsockname()[1]
    put(test, "server.properties", f"""server-ip=127.0.0.1
server-port={port}
online-mode=false
enable-status=false
enable-query=false
enable-rcon=false
view-distance=2
simulation-distance=2
max-tick-time=120000
pause-when-empty-seconds=0
level-type=minecraft:flat
generate-structures=false
generator-settings={{"biome":"minecraft:plains","layers":[{{"block":"minecraft:bedrock","height":1}},{{"block":"minecraft:stone","height":2}}]}}""")
    proc = subprocess.Popen([args.java, "-Xms512M", "-Xmx2G", "-jar", "server.jar", "nogui"], cwd=test,
                            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                            text=True, encoding="utf-8", errors="replace",
                            creationflags=subprocess.CREATE_NO_WINDOW if os.name == "nt" else 0)
    lines, incoming = [], queue.Queue()

    def reader():
        for line in proc.stdout:
            lines.append(line)
            incoming.put(line)
    threading.Thread(target=reader, daemon=True).start()

    def wait(text, timeout=120):
        until = time.monotonic() + timeout
        while time.monotonic() < until:
            try:
                if text in incoming.get(timeout=0.2):
                    return
            except queue.Empty:
                if proc.poll() is not None:
                    break
        raise AssertionError(f"Missing server result: {text}. Log: {test / 'console.log'}")

    def send(command):
        proc.stdin.write(command + "\n")
        proc.stdin.flush()

    def check(condition, label):
        send(f"execute {condition} run say ZBK_TEST_{label}")
        wait("ZBK_TEST_" + label, 10)

    try:
        wait("Done (")
        time.sleep(1)
        send("tick freeze")
        send("scoreboard objectives add zbk.test dummy")
        check('if score #ready zbk.api matches 1 if data storage zbk:registry active{id:"zbk_test"}', "BOOTSTRAP")
        send("scoreboard players set #global game_active 1")
        send("scoreboard players set #global drop_req_kills 1")
        send("scoreboard players set #global drop_round_drops 0")
        check('unless function zbk:api/powerups/can_spawn', "DROP_KILL_GATE")
        send("scoreboard players set #global drop_req_kills 0")
        send("scoreboard players set #global drop_round_drops 3")
        check('if function zbk:api/powerups/can_spawn', "DROP_ALLOWED")
        send("scoreboard players set #global drop_round_drops 4")
        check('unless function zbk:api/powerups/can_spawn', "DROP_CAP")
        send("scoreboard players set #global game_active 0")
        send("scoreboard players set #depth zbk.test 0")
        send("scoreboard players set #nested_failed zbk.test 0")
        send("function zbk:dispatch/before_manual_reload")
        check('if score #nested_failed zbk.test matches 0 if data storage zbk:events result{blocked:0b} unless data storage zbk:events stack[0]', "NESTED_CONTEXT")
        send("scoreboard players set #check_jp_id jump_pad_id 4")
        send("function zbk:dispatch/before_jump_pad_purchase")
        check('if data storage zbk:events result{blocked:1b}', "DENY")
        send("scoreboard players set #check_jp_id jump_pad_id 3")
        send("function zbk:dispatch/before_jump_pad_purchase")
        check('if data storage zbk:events result{blocked:0b}', "FRESH_REQUEST")
        send("scoreboard players set #starts zbk.test 0")
        send("scoreboard players set #defer zbk.test 1")
        send("function zbk:api/game/start")
        check('if data storage zbk:state pending if score #global game_active matches 0', "DEFERRED")
        send("function zbk:api/game/resume with storage zbk_test:state ticket")
        check('unless data storage zbk:state pending if score #global game_active matches 1 if score #starts zbk.test matches 1', "RESUMED")
        send("function zbk:api/game/resume with storage zbk_test:state ticket")
        check('if score #starts zbk.test matches 1', "ONE_SHOT")
        send("function zbk:api/game/reset")
        send("function zbk:api/game/resume with storage zbk_test:state ticket")
        check('if score #global game_active matches 0 if score #starts zbk.test matches 1', "STALE_TOKEN")
        send("function zbk:api/game/start")
        send("function zbk:api/game/reset")
        send("function zbk:api/game/resume with storage zbk_test:state ticket")
        check('unless data storage zbk:state pending if score #global game_active matches 0', "CANCELLED_TOKEN")
        send("function zbk:api/game/start_immediate")
        check('unless data storage zbk:state pending if score #global game_active matches 1 if score #starts zbk.test matches 2', "IMMEDIATE_SKIPS_DEFERRAL")
        send("function zbk:api/game/reset")
        send("scoreboard players set #round_ends zbk.test 0")
        send("scoreboard players set #global wave.round 6")
        send("scoreboard players set #global wave.is_dog_round 1")
        send("scoreboard players set #global wave.is_active 3")
        send("function zombies:waves/management/rounds/end_round")
        send("function zombies:waves/management/rounds/end_round")
        check('if score #round_ends zbk.test matches 1 if data storage zbk_test:state round{round:6,round_type:1} if score #global wave.round matches 6', "ROUND_SNAPSHOT_AND_REENTRANCY")
        send("say ZBK_TEST_COMPLETE")
        wait("ZBK_TEST_COMPLETE", 10)
    finally:
        if proc.poll() is None:
            send("stop")
            try:
                proc.wait(timeout=30)
            except subprocess.TimeoutExpired:
                proc.kill()
                proc.wait()
        (test / "console.log").write_text("".join(lines), encoding="utf-8")
        print(f"Server log: {test / 'console.log'}")
    errors = [line for line in lines if any(term in line for term in ("Failed to load function", "Couldn't parse", "Unknown function", "Missing required", "Failed to parse"))]
    if errors:
        raise AssertionError("".join(errors))
    print("Passed: bootstrap, nested events, blocking, deferral/resume/cancellation, round snapshot, and lifecycle reentrancy.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--server-jar", type=Path, required=True)
    parser.add_argument("--java", default="java")
    run(parser.parse_args())
