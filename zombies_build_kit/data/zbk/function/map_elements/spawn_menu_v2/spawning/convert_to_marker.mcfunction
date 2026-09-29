# Convert the placed bat into the authoritative v2 marker.
# @s = placed Spawn Menu V2 bat

# Only one current menu may exist. Retire any loaded deprecated menu first.
function zbk:map_elements/spawn_menu_v2/audio/music_menu_stop
function zbk:map_elements/spawn_menu_v2/migration/remove_legacy
function zbk:map_elements/spawn_menu_v2/management/delete

summon marker ~ ~ ~ {Tags:["spawn_menu_v2_marker"]}
scoreboard players set @e[type=marker,tag=spawn_menu_v2_marker,distance=..0.1,limit=1,sort=nearest] spawn_menu_v2_cutscene 1
scoreboard players set @e[type=marker,tag=spawn_menu_v2_marker,distance=..0.1,limit=1,sort=nearest] spawn_menu_v2_music 0
execute as @e[type=marker,tag=spawn_menu_v2_marker,distance=..0.1,limit=1,sort=nearest] at @s run function zbk:map_elements/spawn_menu_v2/spawning/create_runtime

kill @s
function zbk:debug/info {f:"SPAWN MENU",m:"Spawn Menu V2 placed"}
