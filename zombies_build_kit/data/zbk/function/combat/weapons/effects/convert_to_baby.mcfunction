# Crawler replacement keeps the same 256-block follow range as standard and animated spawns.
# Keep kill credit, health transfer, and wave accounting with their existing owners.

# Convert adult zombie to baby zombie
# Called on zombie entity that should be converted
# Requires: #shooter_id stats (ID of player who caused conversion)

# If already baby: ignore (shouldn't happen, but safety check)
execute if entity @s[nbt={IsBaby:1b}] run return 0

# Only survivors convert; damage and all points belong to the calling hit.
execute if score global insta_kill matches 1 run return 0
execute store result score #crawler_remaining stats run data get entity @s Health 100
execute if score #crawler_remaining stats matches ..0 run return 0
# The cap never applies a second hit.
execute store result score #crawler_count stats if entity @e[type=zombified_piglin,tag=crawler_ai]
execute if score #crawler_count stats matches 15.. run return 0

# Summon invisible baby version with crawler_ai tag (raycast_hit prevents piercing raycast from hitting it)
tag @e[type=zombified_piglin,tag=new_crawler] remove new_crawler
scoreboard players set #crawler_created wz_state 0
execute store success score #crawler_created wz_state if entity @s[nbt={IsBaby:0b}] run summon minecraft:zombified_piglin ~ ~ ~ {IsBaby:1b,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b}],Tags:["wave_zombie","wave_enemy","raycast_hit","crawler_ai","new_crawler"],AngerTime:40,Silent:1b,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,attributes:[{id:"minecraft:follow_range",base:256},{id:"minecraft:scale",base:1.6}]}
execute unless score #crawler_created wz_state matches 1 run return 0
function zbk:waves/spawning/zombie/accounting/transfer_crawler
execute if entity @s[tag=immune_guns] run tag @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] add immune_guns
execute if entity @s[tag=immune_explosives] run tag @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] add immune_explosives
execute if entity @s[tag=immune_elements] run tag @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] add immune_elements
execute if entity @s[tag=immune_nuke] run tag @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] add immune_nuke
execute if entity @s[tag=immune_melee] run tag @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] add immune_melee

# Preserve remaining health, maximum health, facing and anger from the adult.
data modify entity @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] attributes append from entity @s attributes[{id:"minecraft:max_health"}]
data modify entity @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] Health set from entity @s Health
data modify entity @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] Rotation set from entity @s Rotation
execute if data entity @s AngryAt run data modify entity @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] AngryAt set from entity @s AngryAt

# Assign unique crawler_id to link AI mob and display
scoreboard players add #crawler_id_counter crawler_id 1
scoreboard players operation @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] crawler_id = #crawler_id_counter crawler_id

# Summon animated java display at crawler location
execute at @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] run function animated_java:block_bench_crawler/summon {args:0}

# Assign matching crawler_id to display root
execute at @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] run scoreboard players operation @e[type=item_display,tag=crawler_display,distance=..1,sort=nearest,limit=1] crawler_id = #crawler_id_counter crawler_id

# Start crawl animation
execute at @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] as @e[type=item_display,tag=aj.block_bench_crawler.root,distance=..1,sort=nearest,limit=1] run function animated_java:block_bench_crawler/animations/animation_model_crawl/play

# Remove temp tag
tag @e[type=zombified_piglin,tag=new_crawler] remove new_crawler

# Blood effect
particle minecraft:block{block_state:{Name:"minecraft:redstone_block"}} ~ ~ ~ 0.5 0.5 0.5 2 30

# Conversion is not a kill for map soul quests; suppress native death fallback.
tag @s add map_kill_reported
# Kill the adult zombie without loot
execute if entity @s[nbt={IsBaby:0b}] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[nbt={IsBaby:0b}] run kill @s
