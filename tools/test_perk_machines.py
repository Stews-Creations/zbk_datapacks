"""Exercise perk cabinet placement, reconstruction and deletion on Minecraft 26.2.

Run with --server-jar PATH --java PATH. Uses a disposable, loopback-only server
under this repository's ignored .codex directory. No client/world is modified.
"""
from pathlib import Path
import argparse, json, math, queue, shutil, socket, subprocess, threading, time, uuid

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--server-jar', type=Path, required=True)
parser.add_argument('--java', default='java')
args = parser.parse_args()
root = Path(__file__).resolve().parents[1]
test = root/'.codex'/('perk-machines-'+uuid.uuid4().hex[:8])
test.mkdir(parents=True)
shutil.copy2(args.server_jar, test/'server.jar')
shutil.copytree(root/'zombies_build_kit', test/'world/datapacks/core',
                ignore=shutil.ignore_patterns('*.md', '.codex', '.git'))
(test/'eula.txt').write_text('eula=true\n')
with socket.socket() as sock:
    sock.bind(('127.0.0.1', 0))
    port = sock.getsockname()[1]
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
generator-settings={{"biome":"minecraft:plains","layers":[{{"block":"minecraft:bedrock","height":1}}]}}
''')
proc = subprocess.Popen([args.java, '-Xms512M', '-Xmx2G', '-jar', 'server.jar', 'nogui'],
    cwd=test, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
    text=True, encoding='utf-8', errors='replace',
    creationflags=getattr(subprocess, 'CREATE_NO_WINDOW', 0))
lines = []
incoming = queue.Queue()
def read():
    for line in proc.stdout:
        lines.append(line)
        incoming.put(line)
threading.Thread(target=read, daemon=True).start()
def wait(needle, timeout=120):
    end = time.monotonic()+timeout
    while time.monotonic() < end:
        try:
            line = incoming.get(timeout=1)
        except queue.Empty:
            if proc.poll() is not None:
                raise RuntimeError('Server exited while waiting for '+needle)
            continue
        if needle in line:
            return
    raise TimeoutError(needle)
def send(command):
    proc.stdin.write(command+'\n')
    proc.stdin.flush()
checks = []
def check(condition, label):
    # Wait for the server's actual say output, not the echoed function command.
    send(f'execute {condition} run say PASS_{label}')
    wait('[Server] PASS_'+label, 15)
    checks.append(label)
def count(selector, expected, label):
    send('scoreboard players set #count pm_v2_id 0')
    send(f'execute as {selector} run scoreboard players add #count pm_v2_id 1')
    check(f'if score #count pm_v2_id matches {expected}', label)

names = ['juggernog', 'stamina_up', 'speed_cola', 'double_tap', 'quick_revive', 'mule_kick', 'wunderfizz']
prefix = 'zbk:map_elements/perks/'
try:
    wait('Done (')
    print('Minecraft loaded the core pack.', flush=True)
    send('tick freeze'); wait('frozen')
    send('forceload add 0 0 128 64')
    send('tick step 100')
    time.sleep(6)
    check('if loaded 4 80 4 if loaded 110 80 40 if block 4 80 4 air', 'test_chunks_ready')
    send('scoreboard players set #game_mode game_mode 2')
    send('scoreboard players set #power power 1')
    # Placement at four orientations; rebuild uses persisted marker rotation.
    for row, yaw in enumerate([0, 90, 180, -90]):
        for col, name in enumerate(names):
            x, z = 4+col*5, 4+row*5
            y = 82 if name == 'wunderfizz' else 80
            tag = f'test_{row}_{name}'
            send(f'summon bat {x+.5} 80 {z+.5} {{Tags:["test_bat"],NoAI:true}}')
            send(f'execute as @e[tag=test_bat,limit=1] at @s run function {prefix}machines/placement/{name}')
            send(f'execute positioned {x+.5} {y} {z+.5} run tag @e[type=marker,tag=pm_v2,distance=..0.1] add {tag}')
            send(f'data merge entity @e[tag={tag},limit=1] {{Rotation:[{yaw}f,0f]}}')
            send(f'execute as @e[tag={tag}] at @s run function {prefix}machines/lifecycle/rebuild')
            check(f'if block {x} 80 {z} barrier if block {x} 81 {z} barrier if entity @e[tag={tag}]', tag)
            send(f'scoreboard players operation #owner pm_v2_id = @e[tag={tag},limit=1] pm_v2_id')
            send('execute as @e[tag=pm_v2_model] if score @s pm_v2_id = #owner pm_v2_id store result score #facing pm_v2_id run data get entity @s Rotation[0]')
            send('scoreboard players add #facing pm_v2_id 360')
            send('scoreboard players set #circle pm_v2_id 360')
            send('scoreboard players operation #facing pm_v2_id %= #circle pm_v2_id')
            check(f'if score #facing pm_v2_id matches {(yaw+180)%360}', 'front_'+tag)
            label_depth = .0875 if name == 'wunderfizz' else -.675
            label_x = x + .5 - label_depth * math.sin(math.radians(yaw))
            label_z = z + .5 + label_depth * math.cos(math.radians(yaw))
            label_y = 81.25 if name == 'wunderfizz' else 81
            send(f'execute positioned {label_x} {label_y} {label_z} if entity @e[type=text_display,tag=pm_v2_label,distance=..0.01,nbt={{billboard:"fixed",view_range:0.0390625f,shadow:1b,transformation:{{scale:[0.65f,0.65f,0.65f]}}}}] run say PASS_label_{tag}')
            wait('[Server] PASS_label_'+tag,15)
            checks.append('label_'+tag)
            send('execute as @e[tag=pm_v2_label] if score @s pm_v2_id = #owner pm_v2_id store result score #label_facing pm_v2_id run data get entity @s Rotation[0]')
            send('scoreboard players add #label_facing pm_v2_id 360')
            send('scoreboard players operation #label_facing pm_v2_id %= #circle pm_v2_id')
            check(f'if score #label_facing pm_v2_id matches {(yaw+180)%360}', 'fixed_label_'+tag)
            send(f'execute positioned {x+.5} 80 {z+.5} if entity @e[type=interaction,distance=..0.01,nbt={{width:1.25f,height:2.4f}}] run say PASS_hitbox_{tag}')
            wait('[Server] PASS_hitbox_'+tag,15)
            checks.append('hitbox_'+tag)
            # Wider cabinets reserve two oriented side columns, not a larger click box.
            side_x, side_z = (1, 0) if row % 2 == 0 else (0, 1)
            side_block = 'air' if name == 'juggernog' else 'magenta_stained_glass_pane'
            for sign in [-1, 1]:
                check(f'if block {x+sign*side_x} 80 {z+sign*side_z} {side_block} if block {x+sign*side_x} 81 {z+sign*side_z} {side_block}', f'sides_{row}_{name}_{sign}')
            if name != 'juggernog':
                state = 'north=true,south=true' if row % 2 == 0 else 'east=true,west=true'
                check(f'if block {x+side_x} 80 {z+side_z} magenta_stained_glass_pane[{state}]', f'side_shape_{row}_{name}')
    count('@e[tag=pm_v2]', 28, 'placements')
    count('@e[tag=pm_v2_runtime]', 84, 'owned_runtime')
    # Every bottle selection keeps the cabinet facing in all four orientations.
    for row, yaw in enumerate([0, 90, 180, 270]):
        marker = f'@e[tag=test_{row}_wunderfizz,limit=1]'
        for perk in range(6):
            send(f'scoreboard players set {marker} wunderfizz_perk {perk-1}')
            send(f'execute as {marker} at @s run function {prefix}wunderfizz/animation/show_perk')
            check('if entity @e[type=item_display,tag=wunderfizz_display,nbt={billboard:"fixed"}]', f'bottle_fixed_{row}_{perk}')
            send('execute store result score #bottle_facing pm_v2_id run data get entity @e[type=item_display,tag=wunderfizz_display,limit=1] Rotation[0]')
            send('scoreboard players add #bottle_facing pm_v2_id 360')
            send('scoreboard players operation #bottle_facing pm_v2_id %= #circle pm_v2_id')
            check(f'if score #bottle_facing pm_v2_id matches {(yaw+180)%360}', f'bottle_facing_{row}_{perk}')
            send('kill @e[type=item_display,tag=wunderfizz_display]')
    # Exercise the new click router with a scored actor; this verifies purchase
    # contracts without pretending to simulate a real player's network click.
    send('summon marker 4 80 2 {Tags:["purchase_actor"]}')
    for name, objective, price in zip(names[:6], ['perk_jugg','perk_stamina','perk_speed','perk_doubletap','perk_revive','perk_mule'], [2500,2000,3000,2000,1500,4000]):
        for score in ['perk_count','perk_order',objective]:
            send(f'scoreboard players set @e[tag=purchase_actor] {score} 0')
        send('scoreboard players set @e[tag=purchase_actor] player_points 10000')
        send(f'tag @e[tag=test_0_{name}] add pm_v2_selected')
        send(f'execute as @e[tag=purchase_actor] at @s run function {prefix}machines/interaction/click')
        check(f'if entity @e[tag=purchase_actor,scores={{player_points={10000-price},perk_count=1,{objective}=1}}]', 'purchase_'+name)
        send(f'execute as @e[tag=purchase_actor] at @s run function {prefix}machines/interaction/click')
        check(f'if entity @e[tag=purchase_actor,scores={{player_points={10000-price},perk_count=1}}]', 'duplicate_'+name)
        send(f'tag @e[tag=test_0_{name}] remove pm_v2_selected')
    send('tag @e[tag=test_0_quick_revive] add pm_v2_selected')
    for score in ['perk_count','perk_order','perk_revive','revive_buys']:
        send(f'scoreboard players set @e[tag=purchase_actor] {score} 0')
    send('scoreboard players set #game_mode game_mode 1')
    send('scoreboard players set #power power 0')
    send('scoreboard players set @e[tag=purchase_actor] player_points 1000')
    send(f'execute as @e[tag=purchase_actor] at @s run function {prefix}machines/interaction/click')
    check('if entity @e[tag=purchase_actor,scores={player_points=500,perk_revive=1,revive_buys=1}]','solo_revive_without_power')
    send('tag @e[tag=pm_v2_selected] remove pm_v2_selected')
    send('kill @e[tag=purchase_actor]')
    send('scoreboard players set #game_mode game_mode 2')
    send('scoreboard players set #power power 1')
    send(f'function {prefix}wunderfizz/location_manager/swap_location')
    count('@e[tag=wunderfizz_active_location]',1,'wunderfizz_swap')
    send(f'execute as @e[tag=wunderfizz_active_location] at @s run function {prefix}wunderfizz/display/lamp')
    count('@e[tag=pm_v2_model,nbt={brightness:{block:15,sky:15}}]',1,'wunderfizz_power')
    send('execute as @e[tag=pm_v2_model] run data merge entity @s {view_range:0f}')
    # Label and interaction ownership are retained after repeated reset/reload.
    send(f'function {prefix}initialize')
    send(f'function {prefix}initialize')
    count('@e[tag=pm_v2_runtime]', 84, 'repeat_init')
    count('@e[tag=pm_v2_model,nbt={view_range:0.35f}]', 28, 'reset_cabinet_range')
    check('if entity @e[tag=quick_revive_text,nbt={text:{extra:[{text:"1500"}]}}]', 'revive_label')
    send('reload'); wait('Reloading!')
    time.sleep(3)
    count('@e[tag=pm_v2]', 28, 'reload_markers')
    count('@e[tag=pm_v2_runtime]', 84, 'reload_runtime')
    count('@e[tag=pm_v2_model,nbt={view_range:0.35f}]', 28, 'reload_cabinet_range')
    # Blocked placement cannot overwrite a builder's block or leave a marker.
    send('setblock 40 80 4 diamond_block')
    send('summon bat 40.5 80 4.5 {Tags:["test_bat"],NoAI:true}')
    send(f'execute as @e[tag=test_bat] at @s run function {prefix}machines/placement/juggernog')
    check('if block 40 80 4 diamond_block unless entity @e[tag=test_bat]', 'blocked')
    count('@e[tag=pm_v2]', 28, 'blocked_no_marker')
    # Replacement blocks survive both reconstruction and deletion.
    send('setblock 4 80 4 diamond_block')
    send('setblock 4 81 4 air')
    send(f'execute as @e[tag=test_0_juggernog] at @s run function {prefix}machines/lifecycle/rebuild')
    check('if block 4 80 4 diamond_block if block 4 81 4 barrier', 'repair_and_preserve')
    send('summon text_display 4.5 83 4.5 {Tags:["unrelated_label"],text:"Keep"}')
    send(f'execute as @e[tag=test_0_juggernog] at @s run function {prefix}build_kit/machines/markers/delete_entities')
    check('if block 4 80 4 diamond_block if block 4 81 4 air if entity @e[tag=unrelated_label]', 'delete_preserves_unrelated')
    count('@e[tag=pm_v2_runtime]', 81, 'delete_owned_only')
    # All remaining v2 machine kinds delete their collision and runtime.
    send(f'execute as @e[tag=pm_v2,tag=perk_machine] at @s run function {prefix}build_kit/machines/markers/delete_entities')
    send(f'execute as @e[tag=pm_v2,tag=wunderfizz] at @s run function {prefix}wunderfizz/build_kit/markers/delete_entities')
    count('@e[tag=pm_v2_runtime]', 0, 'delete_all_runtime')
    count('@e[tag=pm_v2]', 0, 'delete_all_markers')
    for row in range(4):
        for col, name in enumerate(names):
            x,z=4+col*5,4+row*5
            block='diamond_block' if row==0 and col==0 else 'air'
            check(f'if block {x} 80 {z} {block} if block {x} 81 {z} air', f'clear_{row}_{name}')
            for dx,dz in [(1,0),(-1,0),(0,1),(0,-1)]:
                check(f'if block {x+dx} 80 {z+dz} air if block {x+dx} 81 {z+dz} air', f'clear_sides_{row}_{name}_{dx}_{dz}')
    print('All seven v2 machines passed placement, reload/reset and deletion.', flush=True)
    # Keep a v2 machine beside a legacy machine during old-template cleanup.
    for row, (yaw, dx, dz, rotation) in enumerate([(0,-1,0,'counterclockwise_90'),(90,0,-1,'none'),(180,1,0,'clockwise_90'),(-90,0,1,'180')]):
        for col,name in enumerate(names):
            x,z=64+col*7,4+row*12
            send(f'place template zbk:perks/{name} {x+dx} 80 {z+dz} {rotation}')
            wait('Loaded template',15)
            if name!='wunderfizz':
                send(f'summon marker {x+.5} 80 {z+.5} {{Tags:["perk_machine","perk_{name}","legacy_test"]}}')
            else:
                send(f'tag @e[type=marker,tag=wunderfizz,tag=!pm_v2,x={x-2},y=79,z={z-2},dx=4,dy=6,dz=4] add legacy_test')
            send(f'scoreboard players set @e[tag=legacy_test] playerYaw {yaw}')
            send(f'execute as @e[tag=legacy_test] at @s run function {prefix}'+('wunderfizz/build_kit' if name=='wunderfizz' else 'build_kit/machines')+'/markers/delete_entities')
            check(f'unless entity @e[tag=legacy_test] if block {x} 80 {z} air',f'legacy_{row}_{name}')
    # Test a loaded old/new pair inside the former broad deletion radius.
    send('place template zbk:perks/juggernog 49 80 4 counterclockwise_90');wait('Loaded template',15)
    send('summon marker 50.5 80 4.5 {Tags:["perk_machine","perk_juggernog","legacy_test"]}')
    send('scoreboard players set @e[tag=legacy_test] playerYaw 0')
    send('summon bat 53.5 80 4.5 {Tags:["test_bat"],NoAI:true}')
    send(f'execute as @e[tag=test_bat] at @s run function {prefix}machines/placement/quick_revive')
    send(f'execute as @e[tag=legacy_test] at @s run function {prefix}build_kit/machines/markers/delete_entities')
    count('@e[tag=pm_v2_runtime]',3,'legacy_preserves_new')
    check('if block 53 80 4 barrier if block 53 81 4 barrier','legacy_preserves_barriers')
    # A saved dialog target wins over the nearer marker; a stale target never
    # deletes that nearer machine as a fallback.
    send('summon bat 56.5 80 4.5 {Tags:["test_bat"],NoAI:true}')
    send(f'execute as @e[tag=test_bat] at @s run function {prefix}machines/placement/juggernog')
    send('summon marker 52.5 80 4.5 {Tags:["delete_actor"]}')
    send('scoreboard players operation @e[tag=delete_actor] pm_v2_select = @e[tag=perk_juggernog,tag=pm_v2,limit=1] pm_v2_id')
    send(f'execute as @e[tag=delete_actor] at @s run function {prefix}build_kit/machines/markers/delete')
    check('if entity @e[tag=perk_quick_revive,tag=pm_v2] unless entity @e[tag=perk_juggernog,tag=pm_v2]','exact_dialog_target')
    send('scoreboard players set @e[tag=delete_actor] pm_v2_select 99999')
    send(f'execute as @e[tag=delete_actor] at @s run function {prefix}build_kit/machines/markers/delete')
    count('@e[tag=pm_v2_runtime]',3,'stale_dialog_preserves_neighbor')
    # Existing map panes and replacement blocks are not owned by a new cabinet.
    send('setblock 3 80 40 magenta_stained_glass_pane')
    send('setblock 5 81 40 diamond_block')
    send('summon bat 4.5 80 40.5 {Tags:["test_bat"],NoAI:true}')
    send(f'execute as @e[tag=test_bat] at @s run function {prefix}machines/placement/mule_kick')
    send(f'execute positioned 4.5 80 40.5 as @e[tag=pm_v2,distance=..0.1] at @s run function {prefix}build_kit/machines/markers/delete_entities')
    check('if block 3 80 40 magenta_stained_glass_pane if block 5 81 40 diamond_block if block 3 81 40 air if block 5 80 40 air','side_ownership_preserves_map')
    # Shared side cells transfer to a surviving nearby cabinet on deletion.
    for x in [10,12]:
        send(f'summon bat {x+.5} 80 40.5 {{Tags:["test_bat"],NoAI:true}}')
        send(f'execute as @e[tag=test_bat] at @s run function {prefix}machines/placement/mule_kick')
    send(f'execute positioned 10.5 80 40.5 as @e[tag=pm_v2,distance=..0.1] at @s run function {prefix}build_kit/machines/markers/delete_entities')
    check('if block 11 80 40 magenta_stained_glass_pane if block 11 81 40 magenta_stained_glass_pane','shared_side_survives_delete')
    send(f'execute positioned 12.5 80 40.5 as @e[tag=pm_v2,distance=..0.1] at @s run function {prefix}build_kit/machines/markers/delete_entities')
    check('if block 11 80 40 air if block 11 81 40 air if block 13 80 40 air if block 13 81 40 air','shared_side_final_cleanup')
    print('Legacy deletion passed for all seven templates in four orientations.',flush=True)
finally:
    if proc.poll() is None:
        send('stop')
        try:proc.wait(timeout=45)
        except subprocess.TimeoutExpired:proc.terminate();proc.wait(timeout=10)
    (test/'console.log').write_text(''.join(lines),encoding='utf-8')
    print('Log:',test/'console.log',flush=True)
errors=[line for line in lines if any(s in line for s in ['Failed to load function','Failed to parse','Unknown function','Parsing error','Missing required'])]
if errors:raise RuntimeError(''.join(errors))
(test/'results.json').write_text(json.dumps({'checks':checks},indent=2))
print(f'Passed {len(checks)} server checks. Client rendering and physical player movement require a client test.',flush=True)
