"""Core Panzer marker/schedule integration test; requires a Minecraft 26.2 server JAR."""
from pathlib import Path
import hashlib,json,queue,shutil,socket,subprocess,threading,time,uuid

import argparse,tempfile

parser=argparse.ArgumentParser(description="Verify Core Panzer scheduling and cleanup in a disposable Minecraft 26.2 server.")
parser.add_argument('--server-jar',type=Path,required=True)
parser.add_argument('--java',default='java')
args=parser.parse_args()
root=Path(__file__).resolve().parents[2]
test=Path(tempfile.mkdtemp(prefix='zbk-panzer-26_2-'))
shutil.copy2(args.server_jar,test/'server.jar')
(test/'world/datapacks').mkdir(parents=True)
shutil.copy2(root/'datapacks/output/zombies_build_kit.zip',test/'world/datapacks/zombies_build_kit.zip')
(test/'eula.txt').write_text('eula=true\n')
with socket.socket() as sock:
    sock.bind(('127.0.0.1',0));port=sock.getsockname()[1]
(test/'server.properties').write_text(f'''server-ip=127.0.0.1
server-port={port}
online-mode=false
enable-status=false
enable-query=false
enable-rcon=false
view-distance=2
simulation-distance=2
spawn-protection=0
pause-when-empty-seconds=0
level-type=minecraft:flat
generate-structures=false
max-tick-time=120000
generator-settings={{"biome":"minecraft:plains","layers":[{{"block":"minecraft:bedrock","height":1}},{{"block":"minecraft:stone","height":2}}]}}
''')
proc=subprocess.Popen([args.java,'-Xms512M','-Xmx2G','-jar','server.jar','nogui'],cwd=test,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,encoding='utf-8',errors='replace',creationflags=getattr(subprocess,'CREATE_NO_WINDOW',0))
lines=[];incoming=queue.Queue()
def read():
    for line in proc.stdout:
        lines.append(line);incoming.put(line)
threading.Thread(target=read,daemon=True).start()
def wait_for(needle,timeout=120):
    end=time.monotonic()+timeout
    while time.monotonic()<end:
        try:line=incoming.get(timeout=1)
        except queue.Empty:
            if proc.poll() is not None:raise RuntimeError('Server exited before '+needle)
            continue
        if needle in line:return line
    raise TimeoutError(needle)
def send(cmd):
    proc.stdin.write(cmd+'\n');proc.stdin.flush()
try:
    wait_for('Done (');time.sleep(1);send('tick freeze');wait_for('frozen')
    send('forceload add 0 0');send('tick step 5');time.sleep(1)
    send('execute unless entity @e[tag=panzer_spawner] run say PANZER_EMPTY_WORLD')
    wait_for('PANZER_EMPTY_WORLD',10)
    send('scoreboard players set #global wave.round 12')
    send('function zombies:waves/special_rounds/panzer/check_round')
    send('execute unless entity @e[tag=panzer_spawn_pending] run say PANZER_NO_MARKERS_DISABLED')
    wait_for('PANZER_NO_MARKERS_DISABLED',10)
    send('summon marker 0 4 0 {Tags:["panzer_spawner"],data:{zone:0}}')
    send('scoreboard players set #global wave.round 11')
    send('function zombies:waves/special_rounds/panzer/check_round')
    send('execute unless entity @e[tag=panzer_spawn_pending] run say PANZER_BEFORE_FIRST')
    wait_for('PANZER_BEFORE_FIRST',10)
    send('scoreboard players set #global wave.round 12')
    send('function zombies:waves/special_rounds/panzer/check_round')
    send('execute if entity @e[tag=panzer_spawn_pending,tag=zbk.round_blocker] run say PANZER_ROUND_12')
    wait_for('PANZER_ROUND_12',10)
    send('execute as @e[tag=panzer_spawn_pending] at @s run function zombies:bosses/panzer/spawn/pending/summon_now')
    send('execute if entity @e[tag=panzer_ai] if entity @e[tag=aj.de_panzer.root] unless entity @e[tag=panzer_spawn_pending] run say PANZER_SPAWNED')
    wait_for('PANZER_SPAWNED',10)
    send('function zbk:api/game/reset')
    send('tick step 25');time.sleep(2)
    send('execute unless entity @e[tag=panzer_ai] unless entity @e[tag=aj.de_panzer.root] if entity @e[tag=panzer_spawner] run say PANZER_RESET')
    wait_for('PANZER_RESET',10)
    send('scoreboard players set #global wave.round 13')
    send('function zombies:waves/special_rounds/panzer/check_round')
    send('execute unless entity @e[tag=panzer_spawn_pending] run say PANZER_OFF_INTERVAL')
    wait_for('PANZER_OFF_INTERVAL',10)
    send('scoreboard players set #global wave.round 18')
    send('function zombies:waves/special_rounds/panzer/check_round')
    send('execute if entity @e[tag=panzer_spawn_pending] run say PANZER_INTERVAL')
    wait_for('PANZER_INTERVAL',10)

finally:
    if proc.poll() is None:
        send('stop')
        try:proc.wait(timeout=30)
        except subprocess.TimeoutExpired:proc.terminate();proc.wait(timeout=10)
    (test/'console.log').write_text(''.join(lines),encoding='utf-8')
errors=[l for l in lines if any(s in l for s in ['Failed to load function','Failed to parse','Unknown function','Unknown scoreboard','Couldn\'t load','Parsing error','Missing required','Invalid path in pack'])]
if errors:raise RuntimeError(''.join(errors))
print('Passed Core-only Panzer disabled-without-markers, first round, repeat interval, controller/model spawn, and reset checks. Log:',test/'console.log',flush=True)
