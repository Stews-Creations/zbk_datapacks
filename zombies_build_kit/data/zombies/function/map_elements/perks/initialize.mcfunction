# === INITIALIZE PERKS ===
# Purpose: Set perk system to default values
# Called from on_load.mcfunction and game reset

# Reset perk bonuses (make all bonuses claimable again)
tag @e[type=marker,tag=perk_bonus] add bonus_available

# Clear all player perks
execute as @a run scoreboard players set @s perk_jugg 0
execute as @a run scoreboard players set @s perk_stamina 0
execute as @a run scoreboard players set @s perk_speed 0
execute as @a run scoreboard players set @s perk_doubletap 0
execute as @a run scoreboard players set @s perk_revive 0
execute as @a run scoreboard players set @s perk_mule 0
execute as @a run scoreboard players set @s perk_count 0
execute as @a run scoreboard players set @s perk_order 0
execute as @a run scoreboard players set @s revive_buys 0
execute as @a run clear @s potion
execute as @a run function zombies:combat/weapons/management/remove_mule_gun

# Reset Quick Revive price display based on game mode
# Set default to co-op mode (2) if not set, then update display
execute unless score #game_mode game_mode matches 1..2 run scoreboard players set #game_mode game_mode 2
function zombies:map_elements/perks/quick_revive/update_price_display

# Reset Wunderfizz machines
execute as @e[type=marker,tag=wunderfizz] run scoreboard players set @s wunderfizz_timer 0
execute as @e[type=marker,tag=wunderfizz] run scoreboard players set @s wunderfizz_perk 0
execute as @e[type=marker,tag=wunderfizz] run scoreboard players set @s wunderfizz_uses 0
execute as @e[type=marker,tag=wunderfizz] run scoreboard players set @s wunderfizz_ready 1
tag @e[type=marker,tag=wunderfizz] remove wunderfizz_cycling
tag @e[type=marker,tag=wunderfizz] remove wunderfizz_claiming
tag @e[type=marker,tag=wunderfizz] remove wunderfizz_active_location
tag @a remove wunderfizz_buyer
kill @e[type=item_display,tag=wunderfizz_display]
kill @e[type=text_display,tag=wunderfizz_perk_name]
kill @e[type=text_display,tag=wunderfizz_ui]
kill @e[type=interaction,tag=wunderfizz_interaction]

# Initialize location system
# Assign sequential IDs to all wunderfizz location markers
scoreboard players set #wunderfizz_id_counter wunderfizz_id 0
execute as @e[type=marker,tag=wunderfizz] run function zombies:map_elements/perks/wunderfizz/location_manager/assign_sequential_id

# Set random max uses before location swap (3-7)
execute store result score #wunderfizz_max_uses wunderfizz_uses run random value 3..7

# Pick random starting location
function zombies:map_elements/perks/wunderfizz/location_manager/init_system

# Respawn UI for all existing wunderfizz markers
tag @e[type=marker,tag=wunderfizz] remove wunderfizz_ui_spawned
execute as @e[type=marker,tag=wunderfizz] at @s run function zombies:map_elements/perks/wunderfizz/spawning/spawn_ui

function zombies:debug/info {f:"PERK",m:"Perk system initialized"}
