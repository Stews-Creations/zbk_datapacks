# Quest collectors share dropped-item state, so retain their ordering.
# Native killer information must be read before a later collector consumes the same item.

# ===================================
# QUEST ITEMS MODULE - TICK
# ===================================
# Runs every game tick for quest item systems

# ===== ELECTRIC BOW PROJECTILES =====
execute as @e[type=marker,tag=de_electric_storm] at @s run function zbk_der_eisendrache:quest/bows/electric/storm/animations/tick
function zbk_der_eisendrache:quest/bows/electric/storm/animations/tick_breezes
execute as @e[type=breeze,tag=giant_breeze] at @s run function zbk_der_eisendrache:quest/bows/electric/behavior
function zbk_der_eisendrache:quest/bows/electric/weather_vane/on_tick
function zbk_der_eisendrache:quest/bows/binding/on_tick

# Read actual native killer UUIDs before the dragon collector consumes the stone.
execute as @e[type=item,tag=!de_quest_drop_checked] if data entity @s Item.components."minecraft:custom_data".soul_killer at @s run function zbk_der_eisendrache:quest/souls/native_drop
function zbk_der_eisendrache:quest/bows/electric/soul_pots/on_tick

# ===== DRAGON HEAD QUEST SYSTEM =====
execute as @e[type=item] if items entity @s contents *[custom_data~{dragon_soul_marker:1b}] at @s run function zbk_der_eisendrache:quest/dragon_heads/souls/check_soul_stone
function zbk_der_eisendrache:quest/dragon_heads/on_tick

# ===== FIRE RING COURTYARD SYSTEM =====
# Check for arrows shot by jump pad riders
function zbk_der_eisendrache:quest/fire_ring/on_tick

# ===== DISCO EFFECTS SYSTEM =====
# Run disco effects and timer logic
function zbk_der_eisendrache:quest/disco/on_tick

# ===== WOLF PAINTING SYSTEM =====
# Run wolf painting tick logic
function zbk_der_eisendrache:quest/wolf/on_tick

function zbk_der_eisendrache:quest/bows/electric/fires/on_tick

function zbk_der_eisendrache:quest/bows/electric/wall_panels/on_tick

function zbk_der_eisendrache:quest/bows/electric/reforging/on_tick

function zbk_der_eisendrache:quest/bows/electric/ritual_box/on_tick

function zbk_der_eisendrache:quest/bows/electric/orb/on_tick
execute as @a at @s run function zbk_der_eisendrache:quest/bows/electric/storm/effects/ambient_sound
execute as @a at @s run function zbk_der_eisendrache:quest/bows/electric/reforging/effects/ambient_sound
