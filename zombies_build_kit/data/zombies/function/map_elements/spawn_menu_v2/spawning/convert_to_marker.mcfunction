# Convert the placed bat into the authoritative v2 marker.
# @s = placed Spawn Menu V2 bat

# Only one spawn menu may exist. Explicit placement replaces either version.
function zombies:sounds/play/music_menu_stop
kill @e[tag=spawn_menu]
kill @e[type=marker,tag=spawn_menu_marker]
function zombies:map_elements/spawn_menu_v2/management/delete

summon marker ~ ~ ~ {Tags:["spawn_menu_v2_marker"]}
scoreboard players set @e[type=marker,tag=spawn_menu_v2_marker,distance=..0.1,limit=1,sort=nearest] spawn_menu_v2_cutscene 1
scoreboard players set @e[type=marker,tag=spawn_menu_v2_marker,distance=..0.1,limit=1,sort=nearest] spawn_menu_v2_music 0
execute as @e[type=marker,tag=spawn_menu_v2_marker,distance=..0.1,limit=1,sort=nearest] at @s run function zombies:map_elements/spawn_menu_v2/spawning/create_runtime

kill @s
function zombies:debug/info {f:"SPAWN MENU",m:"Spawn Menu V2 placed"}
