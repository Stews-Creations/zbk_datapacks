# Runs as one matching platform-door marker.
execute unless score #active zbk.de matches 1 run return 0
execute unless score @s tram_door_state matches 1 run return 0
scoreboard players operation #tram_door_animation_id global = @s tram_door_id
tag @e[type=marker,tag=tram_door_animation_target] remove tram_door_animation_target
tag @s add tram_door_animation_target

# Restore the exact closed positions around the marker center.
execute if entity @s[tag=tram_platform_door_north] as @e[type=block_display,tag=tram_door_panel,tag=tram_door_north,tag=tram_door_left] if score @s tram_door_id = #tram_door_animation_id global at @e[type=marker,tag=tram_door_animation_target,limit=1] run tp @s ~-2 ~ ~
execute if entity @s[tag=tram_platform_door_north] as @e[type=block_display,tag=tram_door_panel,tag=tram_door_north,tag=tram_door_right] if score @s tram_door_id = #tram_door_animation_id global at @e[type=marker,tag=tram_door_animation_target,limit=1] run tp @s ~ ~ ~
execute if entity @s[tag=tram_platform_door_south] as @e[type=block_display,tag=tram_door_panel,tag=tram_door_south,tag=tram_door_left] if score @s tram_door_id = #tram_door_animation_id global at @e[type=marker,tag=tram_door_animation_target,limit=1] run tp @s ~2 ~ ~
execute if entity @s[tag=tram_platform_door_south] as @e[type=block_display,tag=tram_door_panel,tag=tram_door_south,tag=tram_door_right] if score @s tram_door_id = #tram_door_animation_id global at @e[type=marker,tag=tram_door_animation_target,limit=1] run tp @s ~ ~ ~
execute if entity @s[tag=tram_platform_door_east] as @e[type=block_display,tag=tram_door_panel,tag=tram_door_east,tag=tram_door_left] if score @s tram_door_id = #tram_door_animation_id global at @e[type=marker,tag=tram_door_animation_target,limit=1] run tp @s ~ ~ ~2
execute if entity @s[tag=tram_platform_door_east] as @e[type=block_display,tag=tram_door_panel,tag=tram_door_east,tag=tram_door_right] if score @s tram_door_id = #tram_door_animation_id global at @e[type=marker,tag=tram_door_animation_target,limit=1] run tp @s ~ ~ ~
execute if entity @s[tag=tram_platform_door_west] as @e[type=block_display,tag=tram_door_panel,tag=tram_door_west,tag=tram_door_left] if score @s tram_door_id = #tram_door_animation_id global at @e[type=marker,tag=tram_door_animation_target,limit=1] run tp @s ~ ~ ~-2
execute if entity @s[tag=tram_platform_door_west] as @e[type=block_display,tag=tram_door_panel,tag=tram_door_west,tag=tram_door_right] if score @s tram_door_id = #tram_door_animation_id global at @e[type=marker,tag=tram_door_animation_target,limit=1] run tp @s ~ ~ ~

scoreboard players set @s tram_door_state 0
playsound zbk_der_eisendrache:tram.tram_gate block @a[distance=..24] ~ ~ ~ 1 1
tag @s remove tram_door_animation_target
schedule function zbk_der_eisendrache:tram/doors/collision/finalize_close 10t replace
