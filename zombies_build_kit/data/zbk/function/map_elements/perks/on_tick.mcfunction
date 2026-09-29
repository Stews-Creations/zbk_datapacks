# Claim countdown and lamp updates may reuse their selected machine.
# Keep cycling, claims, and global location transitions in their established phases.

# ===================================
# PERKS SUBMODULE - TICK
# ===================================
# Runs every game tick for perk system

# ===== SPAWN EGG DETECTION =====
execute as @e[type=marker,tag=pm_v2_upgrade] at @s run function zbk:map_elements/perks/machines/legacy/upgrade
# Detect and process placement of perk spawn egg entities (bat markers)
function zbk:map_elements/perks/juggernog/spawn
function zbk:map_elements/perks/stamina_up/spawn
function zbk:map_elements/perks/speed_cola/spawn
function zbk:map_elements/perks/double_tap/spawn
function zbk:map_elements/perks/quick_revive/spawn
function zbk:map_elements/perks/mule_kick/spawn
function zbk:map_elements/perks/wunderfizz/spawning/spawn

# ===== WUNDERFIZZ UI SPAWNING =====
# Spawn UI for any wunderfizz markers that don't have it yet
execute as @e[type=marker,tag=wunderfizz,tag=!wunderfizz_ui_spawned] at @s run function zbk:map_elements/perks/wunderfizz/spawning/spawn_ui

# v2 interactions are consumed once; legacy sign purchases remain available.
execute as @e[type=marker,tag=pm_v2,tag=!pm_v2_ready] at @s run function zbk:map_elements/perks/machines/lifecycle/rebuild
execute as @e[type=interaction,tag=pm_v2_interaction] if data entity @s interaction run function zbk:map_elements/perks/machines/interaction/read

# ===== PERK SYSTEMS =====
# Apply active perk effects to players
function zbk:map_elements/perks/management/apply_perks

# ===== WUNDERFIZZ ANIMATION =====
# Run cycling animation for active wunderfizz machines
execute as @e[type=marker,tag=wunderfizz,tag=wunderfizz_cycling] at @s run function zbk:map_elements/perks/wunderfizz/animation/cycle

# ===== WUNDERFIZZ CLAIMING PHASE =====
# Handle claim window countdown and timeout (return to idle if not claimed)
execute as @e[type=marker,tag=wunderfizz,tag=wunderfizz_claiming] at @s run function zbk:map_elements/perks/wunderfizz/gameplay/tick_claim

# ===== WUNDERFIZZ VISIBILITY =====
# Hide text during cycling and claiming animation
execute as @e[type=marker,tag=wunderfizz,tag=wunderfizz_cycling] at @s run data modify entity @e[type=text_display,tag=wunderfizz_text_display,distance=..2,limit=1] text set value [{"text":""}]
execute as @e[type=marker,tag=wunderfizz,tag=wunderfizz_claiming] at @s run data modify entity @e[type=text_display,tag=wunderfizz_text_display,distance=..2,limit=1] text set value [{"text":""}]
# Show text when power is on and not cycling or claiming (only at active location)
execute if score #power power matches 1 as @e[type=marker,tag=wunderfizz,tag=wunderfizz_active_location,tag=!wunderfizz_cycling,tag=!wunderfizz_claiming] at @s run data modify entity @e[type=text_display,tag=wunderfizz_text_display,distance=..2,limit=1] text set value [{"text":"1500","color":"yellow","bold":true}]
# Hide text when power is off or not at active location
execute if score #power power matches 0 as @e[type=text_display,tag=wunderfizz_text_display] unless data entity @s {text:[{"text":""}]} run data modify entity @s text set value [{"text":""}]
execute as @e[type=marker,tag=wunderfizz,tag=!wunderfizz_active_location] at @s run data modify entity @e[type=text_display,tag=wunderfizz_text_display,distance=..2,limit=1] text set value [{"text":""}]

# ===== WUNDERFIZZ LAMP CONTROL =====
# Turn lamp on when power is on at active location (visible from far away)
execute as @e[type=marker,tag=wunderfizz] at @s run function zbk:map_elements/perks/wunderfizz/display/lamp
# Turn lamp off when power is off or not at active location

execute as @e[type=marker,tag=wunderfizz,tag=!pm_v2,tag=!wunderfizz_active_location] at @s run setblock ~ ~1 ~ redstone_lamp[lit=false]
