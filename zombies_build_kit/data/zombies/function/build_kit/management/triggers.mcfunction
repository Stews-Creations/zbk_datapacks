# ===================================
# DIALOG TRIGGER HANDLERS
# ===================================
# Processes /trigger scoreboard commands from dialog buttons
# Runs every tick from tick.mcfunction

# ===== BUILDABLES =====
execute as @a[scores={buildables_action=1..}] at @s run function zombies:build_kit/management/buildables/dispatch

# ===== PLAYER POINTS =====
# Reset player points to 0
execute as @a[scores={reset_points=1..}] run scoreboard players set @s player_points 0
scoreboard players enable @a[scores={reset_points=1..}] reset_points
scoreboard players set @a[scores={reset_points=1..}] reset_points 0

# Add 5000 points
execute as @a[scores={give_points=1..}] run scoreboard players add @s player_points 5000
scoreboard players enable @a[scores={give_points=1..}] give_points
scoreboard players set @a[scores={give_points=1..}] give_points 0

# Add 10000 points
execute as @a[scores={give_10k_points=1..}] run scoreboard players add @s player_points 10000
scoreboard players enable @a[scores={give_10k_points=1..}] give_10k_points
scoreboard players set @a[scores={give_10k_points=1..}] give_10k_points 0

# ===== PERK MANAGEMENT =====
# Clear all perks from player
execute as @a[scores={clear_perks=1..}] run function zombies:map_elements/perks/initialize
scoreboard players enable @a[scores={clear_perks=1..}] clear_perks
scoreboard players set @a[scores={clear_perks=1..}] clear_perks 0

# Reset perk bottle bonus claims
execute as @a[scores={reset_bonus=1..}] run function zombies:map_elements/perks/initialize
scoreboard players enable @a[scores={reset_bonus=1..}] reset_bonus
scoreboard players set @a[scores={reset_bonus=1..}] reset_bonus 0

# ----- Juggernog -----
# Grant Juggernog perk effect
execute as @a[scores={give_juggernog=1..}] run function zombies:map_elements/perks/juggernog/grant
scoreboard players enable @a[scores={give_juggernog=1..}] give_juggernog
scoreboard players set @a[scores={give_juggernog=1..}] give_juggernog 0

# Give Juggernog spawn egg
execute as @a[scores={give_juggernog_egg=1..}] run function zombies:map_elements/perks/juggernog/spawn_egg
scoreboard players enable @a[scores={give_juggernog_egg=1..}] give_juggernog_egg
scoreboard players set @a[scores={give_juggernog_egg=1..}] give_juggernog_egg 0

# ----- Stamina Up -----
# Grant Stamina Up perk effect
execute as @a[scores={give_stamina=1..}] run function zombies:map_elements/perks/stamina_up/grant
scoreboard players enable @a[scores={give_stamina=1..}] give_stamina
scoreboard players set @a[scores={give_stamina=1..}] give_stamina 0

# Give Stamina Up spawn egg
execute as @a[scores={give_stamina_egg=1..}] run function zombies:map_elements/perks/stamina_up/spawn_egg
scoreboard players enable @a[scores={give_stamina_egg=1..}] give_stamina_egg
scoreboard players set @a[scores={give_stamina_egg=1..}] give_stamina_egg 0

# ----- Speed Cola -----
# Grant Speed Cola perk effect
execute as @a[scores={give_speed=1..}] run function zombies:map_elements/perks/speed_cola/grant
scoreboard players enable @a[scores={give_speed=1..}] give_speed
scoreboard players set @a[scores={give_speed=1..}] give_speed 0

# Give Speed Cola spawn egg
execute as @a[scores={give_speed_egg=1..}] run function zombies:map_elements/perks/speed_cola/spawn_egg
scoreboard players enable @a[scores={give_speed_egg=1..}] give_speed_egg
scoreboard players set @a[scores={give_speed_egg=1..}] give_speed_egg 0

# ----- Double Tap -----
# Grant Double Tap perk effect
execute as @a[scores={give_double=1..}] run function zombies:map_elements/perks/double_tap/grant
scoreboard players enable @a[scores={give_double=1..}] give_double
scoreboard players set @a[scores={give_double=1..}] give_double 0

# Give Double Tap spawn egg
execute as @a[scores={give_double_egg=1..}] run function zombies:map_elements/perks/double_tap/spawn_egg
scoreboard players enable @a[scores={give_double_egg=1..}] give_double_egg
scoreboard players set @a[scores={give_double_egg=1..}] give_double_egg 0

# ----- Quick Revive -----
# Grant Quick Revive perk effect
execute as @a[scores={give_revive=1..}] run function zombies:map_elements/perks/quick_revive/grant
scoreboard players enable @a[scores={give_revive=1..}] give_revive
scoreboard players set @a[scores={give_revive=1..}] give_revive 0

# Give Quick Revive spawn egg
execute as @a[scores={give_revive_egg=1..}] run function zombies:map_elements/perks/quick_revive/spawn_egg
scoreboard players enable @a[scores={give_revive_egg=1..}] give_revive_egg
scoreboard players set @a[scores={give_revive_egg=1..}] give_revive_egg 0

# ----- Mule Kick -----
# Grant Mule Kick perk effect
execute as @a[scores={give_mule=1..}] run function zombies:map_elements/perks/mule_kick/grant
scoreboard players enable @a[scores={give_mule=1..}] give_mule
scoreboard players set @a[scores={give_mule=1..}] give_mule 0

# Give Mule Kick spawn egg
execute as @a[scores={give_mule_egg=1..}] run function zombies:map_elements/perks/mule_kick/spawn_egg
scoreboard players enable @a[scores={give_mule_egg=1..}] give_mule_egg
scoreboard players set @a[scores={give_mule_egg=1..}] give_mule_egg 0

# ----- Der Wunderfizz -----
# Give Wunderfizz spawn egg
execute as @a[scores={give_wunderfizz_egg=1..}] run function zombies:map_elements/perks/wunderfizz/spawning/spawn_egg
scoreboard players enable @a[scores={give_wunderfizz_egg=1..}] give_wunderfizz_egg
scoreboard players set @a[scores={give_wunderfizz_egg=1..}] give_wunderfizz_egg 0

# ===== POWER SYSTEM =====
# Force power ON
execute as @a[scores={turn_power_on=1..}] run function zombies:map_elements/power/management/on
execute as @a[scores={turn_power_on=1..},tag=debug] run tellraw @s {"text":"[POWER] Power forced ON","color":"green"}
scoreboard players enable @a[scores={turn_power_on=1..}] turn_power_on
scoreboard players set @a[scores={turn_power_on=1..}] turn_power_on 0

# Force power OFF (reset)
execute as @a[scores={turn_power_off=1..}] run function zombies:map_elements/power/initialize
scoreboard players enable @a[scores={turn_power_off=1..}] turn_power_off
scoreboard players set @a[scores={turn_power_off=1..}] turn_power_off 0

# Toggle power required setting
execute as @a[scores={toggle_power_required=1..}] run function zombies:map_elements/power/management/toggle_required
scoreboard players enable @a[scores={toggle_power_required=1..}] toggle_power_required
scoreboard players set @a[scores={toggle_power_required=1..}] toggle_power_required 0

# Give Power Switch spawn egg
execute as @a[scores={give_power_egg=1..}] run function zombies:map_elements/power/management/spawn_egg
scoreboard players enable @a[scores={give_power_egg=1..}] give_power_egg
scoreboard players set @a[scores={give_power_egg=1..}] give_power_egg 0

# ===== DOOR SYSTEM =====
# Give purchasable Door spawn egg
execute as @a[scores={give_door_egg=1..}] run function zombies:map_elements/door/purchasable/spawn_egg
scoreboard players enable @a[scores={give_door_egg=1..}] give_door_egg
scoreboard players set @a[scores={give_door_egg=1..}] give_door_egg 0

# Give Gate Door spawn egg
execute as @a[scores={give_gate_door_egg=1..}] run function zombies:map_elements/door/purchasable/spawn_egg_gate
scoreboard players enable @a[scores={give_gate_door_egg=1..}] give_gate_door_egg
scoreboard players set @a[scores={give_gate_door_egg=1..}] give_gate_door_egg 0

# Give Jump Spot spawn egg
execute as @a[scores={give_jump_spot_egg=1..}] run function zombies:map_elements/door/purchasable/spawn_egg_jump_spot
scoreboard players enable @a[scores={give_jump_spot_egg=1..}] give_jump_spot_egg
scoreboard players set @a[scores={give_jump_spot_egg=1..}] give_jump_spot_egg 0

# Give Powered Door spawn egg
execute as @a[scores={give_powered_door_egg=1..}] run function zombies:map_elements/door/powered/spawn_egg
scoreboard players enable @a[scores={give_powered_door_egg=1..}] give_powered_door_egg
scoreboard players set @a[scores={give_powered_door_egg=1..}] give_powered_door_egg 0

# Give Powered Stairs Door spawn egg
execute as @a[scores={give_powered_stairs_door_egg=1..}] run function zombies:map_elements/door/powered/spawn_egg_stairs
scoreboard players enable @a[scores={give_powered_stairs_door_egg=1..}] give_powered_stairs_door_egg
scoreboard players set @a[scores={give_powered_stairs_door_egg=1..}] give_powered_stairs_door_egg 0

# Give Powered Power Room Door spawn egg
execute as @a[scores={give_powered_power_room_door_egg=1..}] run function zombies:map_elements/door/powered/spawn_egg_power_room
scoreboard players enable @a[scores={give_powered_power_room_door_egg=1..}] give_powered_power_room_door_egg
scoreboard players set @a[scores={give_powered_power_room_door_egg=1..}] give_powered_power_room_door_egg 0

# Give Powered Church Door spawn egg
execute as @a[scores={give_powered_church_door_egg=1..}] run function zombies:map_elements/door/powered/spawn_egg_church
scoreboard players enable @a[scores={give_powered_church_door_egg=1..}] give_powered_church_door_egg
scoreboard players set @a[scores={give_powered_church_door_egg=1..}] give_powered_church_door_egg 0

# Give Custom Door spawn eggs
execute as @a[scores={give_custom_door_egg=1..}] run function zombies:map_elements/custom_door/spawning/spawn_egg
scoreboard players enable @a[scores={give_custom_door_egg=1..}] give_custom_door_egg
scoreboard players set @a[scores={give_custom_door_egg=1..}] give_custom_door_egg 0

# Give Custom Door Sign spawn egg
execute as @a[scores={give_cd_sign_egg=1..}] run function zombies:map_elements/custom_door/spawning/spawn_egg
scoreboard players enable @a[scores={give_cd_sign_egg=1..}] give_cd_sign_egg
scoreboard players set @a[scores={give_cd_sign_egg=1..}] give_cd_sign_egg 0

# Reset all doors (close and refund)
execute as @a[scores={reset_doors=1..}] run function zombies:map_elements/door/initialize
execute as @a[scores={reset_doors=1..}] run function zombies:map_elements/custom_door/initialize
scoreboard players enable @a[scores={reset_doors=1..}] reset_doors
scoreboard players set @a[scores={reset_doors=1..}] reset_doors 0

# Set door price for nearest door
execute if entity @a[scores={set_door_price=1..}] run function zombies:map_elements/door/purchasable/set_price
execute as @a[scores={prompt_door_price=1..}] run function zombies:map_elements/door/purchasable/prompt_price

# ===== TRAP SYSTEM =====
# Give Electric Trap spawn eggs
execute as @a[scores={give_electric_trap_egg=1..}] run function zombies:map_elements/traps/electric/spawning/spawn_egg
scoreboard players set @a[scores={give_electric_trap_egg=1..}] give_electric_trap_egg 0
scoreboard players enable @a give_electric_trap_egg

# Link placed trap corners
execute as @a[scores={link_traps=1..}] at @s run function zombies:map_elements/traps/electric/spawning/spawn
scoreboard players set @a[scores={link_traps=1..}] link_traps 0
scoreboard players enable @a link_traps

# Reset all traps
execute as @a[scores={reset_traps=1..}] run function zombies:map_elements/traps/electric/core/reset
scoreboard players set @a[scores={reset_traps=1..}] reset_traps 0
scoreboard players enable @a reset_traps

# Set trap price for nearest trap
execute if entity @a[scores={set_trap_price=1..}] run function zombies:map_elements/traps/electric/purchasing/set_price
execute as @a[scores={prompt_trap_price=1..}] run function zombies:map_elements/traps/electric/purchasing/prompt_price

# Delete nearest linked trap (corners + control + sign)
execute as @a[scores={delete_trap=1..}] run function zombies:build_kit/management/trap/delete_trap
scoreboard players enable @a[scores={delete_trap=1..}] delete_trap
scoreboard players set @a[scores={delete_trap=1..}] delete_trap 0

# ===== WEAPON TRIGGERS =====
# Give Pistol
execute as @a[scores={give_pistol=1..}] run function zombies:combat/weapons/guns/pistol/give/main
scoreboard players enable @a[scores={give_pistol=1..}] give_pistol
scoreboard players set @a[scores={give_pistol=1..}] give_pistol 0

# Give Rifle
execute as @a[scores={give_rifle=1..}] run function zombies:combat/weapons/guns/rifle/give/main
scoreboard players enable @a[scores={give_rifle=1..}] give_rifle
scoreboard players set @a[scores={give_rifle=1..}] give_rifle 0

# Give Shotgun
execute as @a[scores={give_shotgun=1..}] run function zombies:combat/weapons/guns/shotgun/give/main
scoreboard players enable @a[scores={give_shotgun=1..}] give_shotgun
scoreboard players set @a[scores={give_shotgun=1..}] give_shotgun 0

# Give Double Barrel Shotgun
execute as @a[scores={give_double_barrel=1..}] run function zombies:combat/weapons/guns/double_barrel_shotgun/give/main
scoreboard players enable @a[scores={give_double_barrel=1..}] give_double_barrel
scoreboard players set @a[scores={give_double_barrel=1..}] give_double_barrel 0

# Give Sniper
execute as @a[scores={give_sniper=1..}] run function zombies:combat/weapons/guns/sniper/give/main
scoreboard players enable @a[scores={give_sniper=1..}] give_sniper
scoreboard players set @a[scores={give_sniper=1..}] give_sniper 0

# Give Light Machine Gun
execute as @a[scores={give_lmg=1..}] run function zombies:combat/weapons/guns/light_machine_gun/give/main
scoreboard players enable @a[scores={give_lmg=1..}] give_lmg
scoreboard players set @a[scores={give_lmg=1..}] give_lmg 0

# Give Flame Thrower
execute as @a[scores={give_flamethrower=1..}] run function zombies:combat/weapons/guns/flame_thrower/give/main
scoreboard players enable @a[scores={give_flamethrower=1..}] give_flamethrower
scoreboard players set @a[scores={give_flamethrower=1..}] give_flamethrower 0

# Give Grenade Launcher
execute as @a[scores={give_grenade_launcher=1..}] run function zombies:combat/weapons/guns/grenade_launcher/give/main
scoreboard players enable @a[scores={give_grenade_launcher=1..}] give_grenade_launcher
scoreboard players set @a[scores={give_grenade_launcher=1..}] give_grenade_launcher 0

# Give Rainbow Rifle
execute as @a[scores={give_rainbow_rifle=1..}] run function zombies:combat/weapons/guns/rainbow_rifle/give/main
scoreboard players enable @a[scores={give_rainbow_rifle=1..}] give_rainbow_rifle
scoreboard players set @a[scores={give_rainbow_rifle=1..}] give_rainbow_rifle 0

# Give Ray Gun
execute as @a[scores={give_ray_gun=1..}] run function zombies:combat/weapons/guns/ray_gun/give/main
scoreboard players enable @a[scores={give_ray_gun=1..}] give_ray_gun
scoreboard players set @a[scores={give_ray_gun=1..}] give_ray_gun 0

# Give Bow
function zbk:dispatch/extension/build_kit/management/triggers/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Give Electric Bow
function zbk:dispatch/extension/build_kit/management/triggers/2
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# ===== SPECIAL EQUIPMENT TRIGGERS =====
# Give Monkey Bombs
execute as @a[scores={give_monkey_bomb=1..}] run function zombies:combat/weapons/special_equipment/monkey_bomb/give_monkey_bomb
scoreboard players enable @a[scores={give_monkey_bomb=1..}] give_monkey_bomb
scoreboard players set @a[scores={give_monkey_bomb=1..}] give_monkey_bomb 0

# Give Trip Mines
execute as @a[scores={give_trip_mine=1..}] run function zombies:combat/weapons/special_equipment/trip_mine/give_trip_mine
scoreboard players enable @a[scores={give_trip_mine=1..}] give_trip_mine
scoreboard players set @a[scores={give_trip_mine=1..}] give_trip_mine 0

# ===== BARRIER SYSTEM =====
# Give Barrier Marker spawn egg
execute as @a[scores={give_barrier_marker=1..}] run function zombies:map_elements/barrier/spawning/give_barrier_marker
scoreboard players enable @a[scores={give_barrier_marker=1..}] give_barrier_marker
scoreboard players set @a[scores={give_barrier_marker=1..}] give_barrier_marker 0

# Give Wide Barrier Marker spawn egg
execute as @a[scores={give_barrier_w3=1..}] run function zombies:map_elements/barrier_w3/spawning/give_barrier_w3_marker
scoreboard players enable @a[scores={give_barrier_w3=1..}] give_barrier_w3
scoreboard players set @a[scores={give_barrier_w3=1..}] give_barrier_w3 0

# Give Light Level 5 blocks (player blocking)
execute as @a[scores={give_light_level_5=1..}] run function zombies:behavior/areas/light_blocks/give_light_level_5
scoreboard players enable @a[scores={give_light_level_5=1..}] give_light_level_5
scoreboard players set @a[scores={give_light_level_5=1..}] give_light_level_5 0

# Give Light Level 6 blocks (zombie + player blocking)
execute as @a[scores={give_light_level_6=1..}] run function zombies:behavior/areas/light_blocks/give_light_level_6
scoreboard players enable @a[scores={give_light_level_6=1..}] give_light_level_6
scoreboard players set @a[scores={give_light_level_6=1..}] give_light_level_6 0

# Give Zombie Block Marker spawn egg
execute as @a[scores={give_zombie_block_marker=1..}] run function zombies:behavior/areas/zombie_barrier_block/spawn_egg_zombie_block
scoreboard players enable @a[scores={give_zombie_block_marker=1..}] give_zombie_block_marker
scoreboard players set @a[scores={give_zombie_block_marker=1..}] give_zombie_block_marker 0

# Give Player Block Marker spawn egg
execute as @a[scores={give_player_block_marker=1..}] run function zombies:behavior/areas/player_block/spawn_egg_player_block
scoreboard players enable @a[scores={give_player_block_marker=1..}] give_player_block_marker
scoreboard players set @a[scores={give_player_block_marker=1..}] give_player_block_marker 0

# ===== BLOCKS =====
# Give Mob Blocker Pane (invisible magenta stained glass pane)
execute as @a[scores={give_mob_blocker=1..}] run give @s minecraft:magenta_stained_glass_pane 16
scoreboard players enable @a[scores={give_mob_blocker=1..}] give_mob_blocker
scoreboard players set @a[scores={give_mob_blocker=1..}] give_mob_blocker 0

# Give Power Lamp Marker frame
execute as @a[scores={give_power_lamp_marker=1..}] run function zombies:map_elements/blocks/spawning/spawn_egg
scoreboard players enable @a[scores={give_power_lamp_marker=1..}] give_power_lamp_marker
scoreboard players set @a[scores={give_power_lamp_marker=1..}] give_power_lamp_marker 0

# ===== MYSTERY BOX SYSTEM =====
# Give Mystery Box Location spawn egg
execute as @a[scores={give_mystery_box_egg=1..}] run function zombies:map_elements/mystery_box/spawning/spawn_egg
scoreboard players enable @a[scores={give_mystery_box_egg=1..}] give_mystery_box_egg
scoreboard players set @a[scores={give_mystery_box_egg=1..}] give_mystery_box_egg 0

# ===== WALL GUN SYSTEM =====
# Give Wall Gun spawn egg
execute as @a[scores={give_wall_gun_egg=1..}] run function zombies:map_elements/wall_gun/spawning/spawn_egg
scoreboard players enable @a[scores={give_wall_gun_egg=1..}] give_wall_gun_egg
scoreboard players set @a[scores={give_wall_gun_egg=1..}] give_wall_gun_egg 0

# ===== PACK-A-PUNCH SYSTEM =====
# Give Pack-a-Punch spawn egg
execute as @a[scores={give_pack_a_punch_egg=1..}] run function zombies:map_elements/pack_a_punch/spawning/spawn_egg
scoreboard players enable @a[scores={give_pack_a_punch_egg=1..}] give_pack_a_punch_egg
scoreboard players set @a[scores={give_pack_a_punch_egg=1..}] give_pack_a_punch_egg 0
function zbk:dispatch/extension/build_kit/management/triggers/3
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Reset Mystery Box Location IDs
execute as @a[scores={reset_mystery_box_ids=1..}] run function zombies:map_elements/mystery_box/location_manager/reset_ids
scoreboard players enable @a[scores={reset_mystery_box_ids=1..}] reset_mystery_box_ids
scoreboard players set @a[scores={reset_mystery_box_ids=1..}] reset_mystery_box_ids 0

# Tag nearest mystery box as spawn location
execute as @a[scores={tag_spawn_location=1..}] at @s run function zombies:map_elements/mystery_box/location_manager/tag_spawn_location
scoreboard players enable @a[scores={tag_spawn_location=1..}] tag_spawn_location
scoreboard players set @a[scores={tag_spawn_location=1..}] tag_spawn_location 0

# ===== POWERUP ACTIVATION =====
# Activate Insta Kill powerup
execute as @a[scores={activate_insta_kill=1..}] run function zombies:combat/powerups/insta_kill/activate
scoreboard players enable @a[scores={activate_insta_kill=1..}] activate_insta_kill
scoreboard players set @a[scores={activate_insta_kill=1..}] activate_insta_kill 0

# Activate Double Points powerup
execute as @a[scores={activate_double_points=1..}] run function zombies:combat/powerups/double_points/activate
scoreboard players enable @a[scores={activate_double_points=1..}] activate_double_points
scoreboard players set @a[scores={activate_double_points=1..}] activate_double_points 0

# Activate Fire Sale powerup
execute as @a[scores={activate_fire_sale=1..}] run function zombies:combat/powerups/fire_sale/activate
scoreboard players enable @a[scores={activate_fire_sale=1..}] activate_fire_sale
scoreboard players set @a[scores={activate_fire_sale=1..}] activate_fire_sale 0

# Activate Max Ammo powerup
execute as @a[scores={activate_max_ammo=1..}] run function zombies:combat/powerups/max_ammo/activate
scoreboard players enable @a[scores={activate_max_ammo=1..}] activate_max_ammo
scoreboard players set @a[scores={activate_max_ammo=1..}] activate_max_ammo 0

# Activate Nuke powerup
execute as @a[scores={activate_nuke=1..}] run function zombies:combat/powerups/nuke/activate
scoreboard players enable @a[scores={activate_nuke=1..}] activate_nuke
scoreboard players set @a[scores={activate_nuke=1..}] activate_nuke 0

# Activate Carpenter powerup
execute as @a[scores={activate_carpenter=1..}] run function zombies:combat/powerups/carpenter/activate
execute as @a[scores={activate_carpenter=1..}] run function zombies:combat/powerups/carpenter/sound
scoreboard players enable @a[scores={activate_carpenter=1..}] activate_carpenter
scoreboard players set @a[scores={activate_carpenter=1..}] activate_carpenter 0

# Activate Death Machine powerup
execute as @a[scores={activate_death_machine=1..}] run function zombies:combat/powerups/death_machine/activate
scoreboard players enable @a[scores={activate_death_machine=1..}] activate_death_machine
scoreboard players set @a[scores={activate_death_machine=1..}] activate_death_machine 0

# ===== WAVE SYSTEM =====
# Give Zombie Spawn Marker
execute as @a[scores={give_zombie_marker=1..}] run function zombies:waves/markers/zombie/give
scoreboard players enable @a[scores={give_zombie_marker=1..}] give_zombie_marker
scoreboard players set @a[scores={give_zombie_marker=1..}] give_zombie_marker 0

# Give Dog Spawn Marker
execute as @a[scores={give_dog_marker=1..}] run function zombies:waves/markers/dog/give
scoreboard players enable @a[scores={give_dog_marker=1..}] give_dog_marker
scoreboard players set @a[scores={give_dog_marker=1..}] give_dog_marker 0
function zbk:dispatch/extension/build_kit/management/triggers/4
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Toggle Spawn Marker Particles
execute as @a[scores={toggle_spawn_markers=1..}] run function zombies:waves/markers/toggle_particles
scoreboard players enable @a[scores={toggle_spawn_markers=1..}] toggle_spawn_markers
scoreboard players set @a[scores={toggle_spawn_markers=1..}] toggle_spawn_markers 0

# ===== GAME MANAGEMENT =====
# Give Spawn Point marker egg
execute as @a[scores={give_spawn_point=1..}] run function zombies:game/management/spawn_point/spawn_egg
scoreboard players enable @a[scores={give_spawn_point=1..}] give_spawn_point
scoreboard players set @a[scores={give_spawn_point=1..}] give_spawn_point 0

# Give Worldspawn marker egg
execute as @a[scores={give_worldspawn=1..}] run function zombies:game/management/worldspawn/spawn_egg
scoreboard players enable @a[scores={give_worldspawn=1..}] give_worldspawn
scoreboard players set @a[scores={give_worldspawn=1..}] give_worldspawn 0

# Give Spawn Menu marker egg
execute as @a[scores={give_spawn_menu=1..}] run function zombies:game/management/spawn_menu/spawn_egg
scoreboard players enable @a[scores={give_spawn_menu=1..}] give_spawn_menu
scoreboard players set @a[scores={give_spawn_menu=1..}] give_spawn_menu 0

# Give Spawn Menu V2 marker egg
execute as @a[scores={give_spawn_menu_v2=1..}] run function zombies:build_kit/management/spawn_menu_v2/give_marker
scoreboard players enable @a[scores={give_spawn_menu_v2=1..}] give_spawn_menu_v2
scoreboard players set @a[scores={give_spawn_menu_v2=1..}] give_spawn_menu_v2 0

# Start game (uses Spawn Menu V2 cutscene setting when that menu exists)
execute as @a[scores={start_game=1..}] if score #global game_active matches 0 unless score #global cutscene_active matches 1.. run function zombies:game/management/custom_start/reset
execute as @a[scores={start_game=1..}] run function zombies:map_elements/spawn_menu_v2/management/start_from_setting
scoreboard players enable @a[scores={start_game=1..}] start_game
scoreboard players set @a[scores={start_game=1..}] start_game 0

# Start game (no cutscene - skips intro cutscene)
execute as @a[scores={start_no_cutscene=1..}] run function zombies:game/management/custom_start/reset
execute as @a[scores={start_no_cutscene=1..}] run function zombies:game/management/start
scoreboard players enable @a[scores={start_no_cutscene=1..}] start_no_cutscene
scoreboard players set @a[scores={start_no_cutscene=1..}] start_no_cutscene 0

# Reset / stop game (routes through cutscene if game active and lobby TP enabled)
execute as @a[scores={reset_game=1..}] run function zombies:game/management/stop_game
scoreboard players enable @a[scores={reset_game=1..}] reset_game
scoreboard players set @a[scores={reset_game=1..}] reset_game 0

# Stop game (no cutscene - skips end game cutscene)
execute as @a[scores={stop_no_cutscene=1..}] run function zombies:game/management/stop_game_no_cutscene
scoreboard players enable @a[scores={stop_no_cutscene=1..}] stop_no_cutscene
scoreboard players set @a[scores={stop_no_cutscene=1..}] stop_no_cutscene 0

# Teleport to worldspawn lobby
execute as @a[scores={tp_worldspawn=1..}] run function zombies:game/management/worldspawn/teleport
scoreboard players enable @a[scores={tp_worldspawn=1..}] tp_worldspawn
scoreboard players set @a[scores={tp_worldspawn=1..}] tp_worldspawn 0

# ===== BUILD MANAGER TOOL =====
# Give Build Manager stick
execute as @a[scores={give_build_manager=1..}] run function zombies:build_kit/management/build_manager/give_build_manager
scoreboard players enable @a[scores={give_build_manager=1..}] give_build_manager
scoreboard players set @a[scores={give_build_manager=1..}] give_build_manager 0

# Give Mob Immunity Tool
execute as @a[scores={give_mob_immunity_tool=1..}] run function zombies:build_kit/management/mob_immunity_tool/give
scoreboard players enable @a[scores={give_mob_immunity_tool=1..}] give_mob_immunity_tool
scoreboard players set @a[scores={give_mob_immunity_tool=1..}] give_mob_immunity_tool 0

# ===== EXPLOSIVE BARREL =====
# Give Explosive Barrel spawn egg
execute as @a[scores={give_explosive_barrel_egg=1..}] run function zombies:map_elements/explosive_barrel/spawning/spawn_egg
scoreboard players enable @a[scores={give_explosive_barrel_egg=1..}] give_explosive_barrel_egg
scoreboard players set @a[scores={give_explosive_barrel_egg=1..}] give_explosive_barrel_egg 0

# ===== FIRE FLOOR SYSTEM =====
# Give Fire Floor marker spawn eggs
execute as @a[scores={give_fire_floor_egg=1..}] run function zombies:map_elements/fire_floor/spawning/spawn_egg
scoreboard players enable @a[scores={give_fire_floor_egg=1..}] give_fire_floor_egg
scoreboard players set @a[scores={give_fire_floor_egg=1..}] give_fire_floor_egg 0

# Toggle Fire Floor effects on/off
execute as @a[scores={toggle_fire_floor=1..}] run function zombies:map_elements/fire_floor/management/toggle_fire_floor
scoreboard players enable @a[scores={toggle_fire_floor=1..}] toggle_fire_floor
scoreboard players set @a[scores={toggle_fire_floor=1..}] toggle_fire_floor 0

# ===== DEBUG MODE =====
# Toggle debug tag on player (use temp tags to determine action before modifying)
# First, mark what action to take
execute as @a[scores={toggle_dev_tag=1..},tag=!debug] run tag @s add debug_turn_on
execute as @a[scores={toggle_dev_tag=1..},tag=debug,tag=!debug_turn_on] run tag @s add debug_turn_off
# Now perform actions based on flags
execute as @a[tag=debug_turn_on] run tag @s add debug
execute as @a[tag=debug_turn_on] run tellraw @s [{"text":"[DEBUG] ","color":"gold"},{"text":"Debug mode enabled (level ","color":"green"},{"score":{"name":"@s","objective":"debug_level"},"color":"yellow"},{"text":")","color":"green"}]
execute as @a[tag=debug_turn_off] run tag @s remove debug
execute as @a[tag=debug_turn_off] run tellraw @s [{"text":"[DEBUG] ","color":"gold"},{"text":"Debug mode disabled","color":"gray"}]
# Clean up temp tags
tag @a remove debug_turn_on
tag @a remove debug_turn_off
scoreboard players enable @a[scores={toggle_dev_tag=1..}] toggle_dev_tag
scoreboard players set @a[scores={toggle_dev_tag=1..}] toggle_dev_tag 0

# ===== DEBUG LEVEL =====
# Set debug level (1=errors, 2=+warnings, 3=+events, 4=all)
execute as @a[scores={set_debug_level=1..}] run scoreboard players operation @s debug_level = @s set_debug_level
execute as @a[scores={set_debug_level=1}] run tellraw @s [{"text":"[DEBUG] ","color":"gold"},{"text":"Level set to 1 (Errors only)","color":"red"}]
execute as @a[scores={set_debug_level=2}] run tellraw @s [{"text":"[DEBUG] ","color":"gold"},{"text":"Level set to 2 (Errors + Warnings)","color":"yellow"}]
execute as @a[scores={set_debug_level=3}] run tellraw @s [{"text":"[DEBUG] ","color":"gold"},{"text":"Level set to 3 (Errors + Warnings + Events)","color":"white"}]
execute as @a[scores={set_debug_level=4}] run tellraw @s [{"text":"[DEBUG] ","color":"gold"},{"text":"Level set to 4 (All messages)","color":"green"}]
scoreboard players enable @a[scores={set_debug_level=1..}] set_debug_level
scoreboard players set @a[scores={set_debug_level=1..}] set_debug_level 0

# ===== GUN VISIBILITY TOGGLE =====
# Toggle gun display in offhand (for creative/building mode)
execute as @a[scores={toggle_gun=1..,hide_gun=..0}] run tag @s add gun_hiding
execute as @a[scores={toggle_gun=1..,hide_gun=1..},tag=!gun_hiding] run tag @s add gun_showing
# Apply toggle
execute as @a[tag=gun_hiding] run scoreboard players set @s hide_gun 1
execute as @a[tag=gun_hiding] run item replace entity @s weapon.offhand with minecraft:air
execute as @a[tag=gun_hiding] if items entity @s hotbar.3 *[custom_data~{knife:true}] run item replace entity @s hotbar.3 with minecraft:air
execute as @a[tag=gun_hiding] if items entity @s hotbar.0 *[custom_data~{knife:true}] run item replace entity @s hotbar.0 with minecraft:air
execute as @a[tag=gun_hiding] run tellraw @s [{"text":"[GUN] ","color":"gold"},{"text":"Gun hidden - offhand free for building","color":"gray"}]
execute as @a[tag=gun_showing] run scoreboard players set @s hide_gun 0
execute as @a[tag=gun_showing] run tellraw @s [{"text":"[GUN] ","color":"gold"},{"text":"Gun visible","color":"green"}]
# Clean up
tag @a remove gun_hiding
tag @a remove gun_showing
scoreboard players enable @a[scores={toggle_gun=1..}] toggle_gun
scoreboard players set @a[scores={toggle_gun=1..}] toggle_gun 0

# ===== STATS DIALOG =====
# Open combat record dialog (from Quick Actions menu)
execute as @a[scores={show_stats=1..}] run function zombies:player/stats/dialog/show
scoreboard players enable @a[scores={show_stats=1..}] show_stats
scoreboard players set @a[scores={show_stats=1..}] show_stats 0

# ===== GAME SIGNAL SPAWN EGGS =====
execute as @a[scores={give_signal_game_start_egg=1..}] run function zombies:map_elements/game_signals/spawning/spawn_egg_game_start
scoreboard players enable @a[scores={give_signal_game_start_egg=1..}] give_signal_game_start_egg
scoreboard players set @a[scores={give_signal_game_start_egg=1..}] give_signal_game_start_egg 0

execute as @a[scores={give_signal_game_end_egg=1..}] run function zombies:map_elements/game_signals/spawning/spawn_egg_game_end
scoreboard players enable @a[scores={give_signal_game_end_egg=1..}] give_signal_game_end_egg
scoreboard players set @a[scores={give_signal_game_end_egg=1..}] give_signal_game_end_egg 0

execute as @a[scores={give_signal_round_start_egg=1..}] run function zombies:map_elements/game_signals/spawning/spawn_egg_round_start
scoreboard players enable @a[scores={give_signal_round_start_egg=1..}] give_signal_round_start_egg
scoreboard players set @a[scores={give_signal_round_start_egg=1..}] give_signal_round_start_egg 0

execute as @a[scores={give_signal_power_on_egg=1..}] run function zombies:map_elements/game_signals/spawning/spawn_egg_power_on
scoreboard players enable @a[scores={give_signal_power_on_egg=1..}] give_signal_power_on_egg
scoreboard players set @a[scores={give_signal_power_on_egg=1..}] give_signal_power_on_egg 0

execute as @a[scores={give_signal_zone_unlocked_egg=1..}] run function zombies:map_elements/game_signals/spawning/spawn_egg_zone_unlocked
scoreboard players enable @a[scores={give_signal_zone_unlocked_egg=1..}] give_signal_zone_unlocked_egg
scoreboard players set @a[scores={give_signal_zone_unlocked_egg=1..}] give_signal_zone_unlocked_egg 0

execute as @a[scores={give_signal_cutscene_start_egg=1..}] run function zombies:map_elements/game_signals/spawning/spawn_egg_cutscene_start
scoreboard players enable @a[scores={give_signal_cutscene_start_egg=1..}] give_signal_cutscene_start_egg
scoreboard players set @a[scores={give_signal_cutscene_start_egg=1..}] give_signal_cutscene_start_egg 0

execute as @a[scores={give_signal_cutscene_end_egg=1..}] run function zombies:map_elements/game_signals/spawning/spawn_egg_cutscene_end
scoreboard players enable @a[scores={give_signal_cutscene_end_egg=1..}] give_signal_cutscene_end_egg
scoreboard players set @a[scores={give_signal_cutscene_end_egg=1..}] give_signal_cutscene_end_egg 0

# ===== RADIO =====
# Give Radio spawn egg
execute as @a[scores={give_radio_egg=1..}] run function zombies:map_elements/radio/spawning/spawn_egg
scoreboard players enable @a[scores={give_radio_egg=1..}] give_radio_egg
scoreboard players set @a[scores={give_radio_egg=1..}] give_radio_egg 0

# ===== TELEPORTER =====
# Give Teleporter Start spawn egg
execute as @a[scores={give_tp_start_egg=1..}] run function zombies:map_elements/teleporter/spawning/spawn_start_egg
scoreboard players enable @a[scores={give_tp_start_egg=1..}] give_tp_start_egg
scoreboard players set @a[scores={give_tp_start_egg=1..}] give_tp_start_egg 0

# Give Teleporter End spawn egg
execute as @a[scores={give_tp_end_egg=1..}] run function zombies:map_elements/teleporter/spawning/spawn_end_egg
scoreboard players enable @a[scores={give_tp_end_egg=1..}] give_tp_end_egg
scoreboard players set @a[scores={give_tp_end_egg=1..}] give_tp_end_egg 0

# Give Teleporter Auto Return spawn egg
execute as @a[scores={give_tp_auto_return_egg=1..}] run function zombies:map_elements/teleporter/spawning/spawn_auto_return_egg
scoreboard players enable @a[scores={give_tp_auto_return_egg=1..}] give_tp_auto_return_egg
scoreboard players set @a[scores={give_tp_auto_return_egg=1..}] give_tp_auto_return_egg 0

function zbk:dispatch/extension/build_kit/management/triggers/5
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
# BO3 integration
execute as @a[scores={give_bo3=20..46}] at @s run function zombies:combat/weapons/guns/bo3/inventory/trigger
scoreboard players set @a[scores={give_bo3=1..}] give_bo3 0
scoreboard players enable @a give_bo3

scoreboard players enable @a[scores={give_panzer_marker=1..}] give_panzer_marker
scoreboard players set @a[scores={give_panzer_marker=1..}] give_panzer_marker 0
