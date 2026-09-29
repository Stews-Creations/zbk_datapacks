# Summon an invisible iron golem Panzer controller six blocks above this position.
# The Animated Java model is linked to the golem and follows it while it slowly falls.
# Runs as and at: marker tagged panzer_spawn_pending.

scoreboard players set #panzer_relocation_health relocation_health 0
execute if score @s relocation_health matches 1.. run scoreboard players operation #panzer_relocation_health relocation_health = @s relocation_health
summon minecraft:iron_golem ~ ~6 ~ {Tags:["panzer_ai","panzer_controller","wave_enemy","raycast_hit","new_panzer","panzer_landing_descent"],NoAI:1b,NoGravity:1b,Silent:1b,PersistenceRequired:1b,DeathLootTable:"minecraft:empty",Health:2400f,attributes:[{id:"minecraft:max_health",base:2400},{id:"minecraft:follow_range",base:2048},{id:"minecraft:scale",base:1.0},{id:"minecraft:movement_speed",base:0.3},{id:"minecraft:step_height",base:2},{id:"minecraft:safe_fall_distance",base:3},{id:"minecraft:attack_damage",base:0}],active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}]}
tag @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] add panzer_ai
tag @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] add panzer_controller
tag @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] add wave_enemy
tag @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] add raycast_hit
tag @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] add immunity_target
function zbk:combat/immunity/apply_from_marker
execute if score #panzer_relocation_health relocation_health matches 1.. as @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] store result entity @s Health float 1 run scoreboard players get #panzer_relocation_health relocation_health
scoreboard players set @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] panzer_attack_cooldown 45
scoreboard players set @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] panzer_attack_timer 0
execute as @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] at @s run function zbk:bosses/panzer/model/spawn/rig
execute as @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] at @s run function zbk:waves/events/enemy_spawned
tag @e[type=minecraft:iron_golem,tag=new_panzer,distance=..16,sort=nearest,limit=1] remove new_panzer
kill @s
