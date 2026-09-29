# The caller already bounded this marker to the current viewer.
# Test local tags here and retain every matching legend effect for multi-tagged markers.

# ===================================
# BUILD KIT - SHOW NEARBY MARKERS
# ===================================
# Shows particles at all marker entities within 15 blocks
# Runs as/at a marker; zbk_marker_viewer identifies the current synchronous viewer.
#
# ============ MARKER LEGEND ============
# All markers open a dialog when right-clicked with Build Manager
#
#   - Zombie Spawner    : Green (happy_villager)
#   - Dog Spawner       : Red dust
#   - Door              : Yellow dust
#   - Powered Door      : Orange/Gold dust
#   - Jump Pad          : White dust
#   - Wall Gun          : Blue dust
#   - Trap Corner       : Dark Red dust (smaller)
#   - Trap Control      : Dark Red dust
#   - Barrier           : Orange dust
#   - Boards Spawn      : Orange/Brown dust
#   - Mystery Box       : Purple dust
#   - Map PaP Location  : Pale Purple dust
#   - Wunderfizz        : Cyan dust
#   - Power Marker      : Gold dust (larger)
#   - Fire Floor        : Flame particles
#   - World Spawn       : Bright Green dust (larger)
#   - Perk Bonus        : Pink dust
#   - Perk Machine      : Light Purple dust
#   - Spawn Point       : Magenta dust (larger)
#   - Spawn Menu        : Yellow/Gold dust (larger)
#   - Player Block      : Lime dust
#   - Zombie Block      : Light Blue dust
#   - Custom Door C1    : Green dust
#   - Custom Door C2    : Aqua dust
#   - Custom Door Sign  : Gold/Orange dust
#   - Signal Game Start : Bright Green dust
#   - Signal Game End   : Dark Red dust
#   - Signal Round Start: Gold dust
#   - Signal Power On   : Electric Blue dust
#   - Signal Zone Unlock: Light Purple dust
#   - Radio             : Brown/Tan dust
#   - Cutscene End Start: Bright Cyan dust
#   - Cutscene End End  : Dark Cyan dust
#   - Cutscene SG Start : Bright Magenta dust
#   - Cutscene SG End   : Dark Magenta dust
#   - Cutscene EG Timed : Yellow/Cyan dust
#   - Cutscene SG Timed : Yellow/Magenta dust
#
#   - Teleporter Start  : Light Purple dust (larger)
#   - Teleporter End    : Dark Purple dust
#
# AUXILIARY (part of other systems, no separate dialog):
#   - JP Start/Peak/End : Light Blue dust (jump pad path markers)
# =======================================

# Ignore unrelated runtime markers before evaluating the editor legend.

# Zombie Spawner - Green
execute if entity @s[tag=zombie_spawner] run particle minecraft:happy_villager ~ ~1 ~ 0.1 0.3 0.1 0 2 normal @a[tag=zbk_marker_viewer]

# Dog Spawner - Red
execute if entity @s[tag=dog_spawner] run particle minecraft:dust{color:[1.0,0.2,0.2],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

function zbk:build_kit/events/extension/markers/display_nearby/after_spawner_particles
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Door - Yellow
execute if entity @s[tag=door] run particle minecraft:dust{color:[1.0,1.0,0.2],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Powered Door - Orange/Gold
execute if entity @s[tag=door_powered] run particle minecraft:dust{color:[1.0,0.8,0.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Jump Pad - White
execute if entity @s[tag=jump_pad] run particle minecraft:dust{color:[1.0,1.0,1.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Wall Gun - Blue
execute if entity @s[tag=wall_gun] run particle minecraft:dust{color:[0.2,0.4,1.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Trap Corner - Dark Red (smaller)
execute if entity @s[tag=trap_corner] run particle minecraft:dust{color:[0.5,0.0,0.0],scale:0.8} ~ ~0.5 ~ 0.1 0.2 0.1 0 2 normal @a[tag=zbk_marker_viewer]

# Trap Control - Dark Red
execute if entity @s[tag=trap_control] run particle minecraft:dust{color:[0.6,0.0,0.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Barrier - Orange
execute if entity @s[tag=barrier] run particle minecraft:dust{color:[1.0,0.5,0.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Boards Spawn - Orange/Brown
execute if entity @s[tag=boards_spawn] run particle minecraft:dust{color:[1.0,0.6,0.1],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Mystery Box - Purple
execute if entity @s[tag=mystery_box_location] run particle minecraft:dust{color:[0.8,0.2,1.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Map Pack-a-Punch Location - Pale Purple
function zbk:build_kit/events/extension/markers/display_nearby/before_wunderfizz
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Wunderfizz - Cyan
execute if entity @s[tag=wunderfizz] run particle minecraft:dust{color:[0.2,1.0,1.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Power Marker - Gold (larger)
execute if entity @s[tag=power_marker] run particle minecraft:dust{color:[1.0,0.85,0.0],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Fire Floor - Flame
execute if entity @s[tag=fire_floor_marker] run particle minecraft:flame ~ ~0.5 ~ 0.1 0.2 0.1 0.01 2 normal @a[tag=zbk_marker_viewer]

# World Spawn - Bright Green (larger)
execute if entity @s[tag=worldspawn] run particle minecraft:dust{color:[0.0,1.0,0.3],scale:1.5} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Perk Bonus - Pink
execute if entity @s[tag=perk_bonus] run particle minecraft:dust{color:[1.0,0.4,0.7],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Perk Machine - Light Purple
execute if entity @s[tag=perk_machine] run particle minecraft:dust{color:[0.7,0.3,1.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Spawn Point - Magenta (larger)
execute if entity @s[tag=spawn_point_marker] run particle minecraft:dust{color:[1.0,0.0,1.0],scale:1.5} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Spawn Menu - Yellow/Gold (larger)

# Spawn Menu V2 - Green/Gold (larger)
execute if entity @s[tag=spawn_menu_v2_marker] run particle minecraft:dust{color:[0.6,1.0,0.2],scale:1.5} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Player Block - Lime
execute if entity @s[tag=player_block] run particle minecraft:dust{color:[0.5,1.0,0.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Zombie Block - Light Blue
execute if entity @s[tag=barrier_zombie_block] run particle minecraft:dust{color:[0.3,0.7,1.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Custom Door Corner 1 - Yellow
execute if entity @s[tag=custom_door_1] run particle minecraft:dust{color:[1.0,1.0,0.2],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Custom Door Corner 2 - Aqua
execute if entity @s[tag=custom_door_2] run particle minecraft:dust{color:[0.2,1.0,1.0],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Custom Door Sign - Gold/Orange
execute if entity @s[tag=custom_door_sign] run particle minecraft:dust{color:[1.0,0.65,0.0],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Explosive Barrel - Red (matches the barrel's red concrete color)
execute if entity @s[tag=explosive_barrel] run particle minecraft:dust{color:[1.0,0.2,0.1],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Signal: Game Start - Bright Green
execute if entity @s[tag=signal_game_start] run particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Signal: Game End - Dark Red
execute if entity @s[tag=signal_game_end] run particle minecraft:dust{color:[0.8,0.0,0.0],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Signal: Round Start - Gold
execute if entity @s[tag=signal_round_start] run particle minecraft:dust{color:[1.0,0.9,0.5],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Signal: Power On - Electric Blue
execute if entity @s[tag=signal_power_on] run particle minecraft:dust{color:[0.0,0.7,1.0],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Signal: Zone Unlocked - Light Purple
execute if entity @s[tag=signal_zone_unlocked] run particle minecraft:dust{color:[0.7,0.4,1.0],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Radio - Brown/Tan
execute if entity @s[tag=radio_marker] run particle minecraft:dust{color:[0.6,0.4,0.2],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Cutscene End Start - Bright Cyan
execute if entity @s[tag=cutscene_end_start] run particle minecraft:dust{color:[0.0,1.0,0.8],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Cutscene End End - Dark Cyan
execute if entity @s[tag=cutscene_end_finish] run particle minecraft:dust{color:[0.0,0.6,0.5],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Start Game Cutscene Start - Bright Magenta
execute if entity @s[tag=cutscene_start_start] run particle minecraft:dust{color:[1.0,0.0,0.8],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Start Game Cutscene End - Dark Magenta
execute if entity @s[tag=cutscene_start_finish] run particle minecraft:dust{color:[0.6,0.0,0.5],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# End Game Cutscene Timed - Yellow/Cyan
execute if entity @s[tag=cutscene_end_timed] run particle minecraft:dust{color:[0.0,0.8,0.8],scale:1.5} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Start Game Cutscene Timed - Yellow/Magenta
execute if entity @s[tag=cutscene_start_timed] run particle minecraft:dust{color:[0.8,0.0,0.8],scale:1.5} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Jump Pad Path Markers - Light Blue (smaller, auxiliary)
execute if entity @s[tag=jp_start] run particle minecraft:dust{color:[0.9,0.9,1.0],scale:0.8} ~ ~0.5 ~ 0.1 0.2 0.1 0 2 normal @a[tag=zbk_marker_viewer]
execute if entity @s[tag=jp_peak] run particle minecraft:dust{color:[0.8,0.8,1.0],scale:0.8} ~ ~0.5 ~ 0.1 0.2 0.1 0 2 normal @a[tag=zbk_marker_viewer]
execute if entity @s[tag=jp_end] run particle minecraft:dust{color:[0.7,0.7,1.0],scale:0.8} ~ ~0.5 ~ 0.1 0.2 0.1 0 2 normal @a[tag=zbk_marker_viewer]

# Teleporter Start - Light Purple
execute if entity @s[tag=tp_start] run particle minecraft:dust{color:[0.8,0.4,1.0],scale:1.2} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Teleporter End - Dark Purple
execute if entity @s[tag=tp_end] run particle minecraft:dust{color:[0.5,0.2,0.8],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]

# Teleporter Auto Return - Magenta
execute if entity @s[tag=tp_auto_return] run particle minecraft:dust{color:[1.0,0.2,0.8],scale:1.0} ~ ~1 ~ 0.1 0.3 0.1 0 3 normal @a[tag=zbk_marker_viewer]
execute if entity @s[tag=rs_part_candidate] run particle minecraft:dust{color:[0.3,0.9,0.65],scale:1.2} ~ ~0.5 ~ 0.25 0.25 0.25 0 3 normal @a[tag=zbk_marker_viewer]
