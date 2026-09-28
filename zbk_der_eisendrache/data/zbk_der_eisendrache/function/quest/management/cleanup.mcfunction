# Remove transient Der Eisendrache quest runtime after another map is selected.

# Wolf paintings are rebuilt from persistent wolf_spawn_location markers.
function zbk_der_eisendrache:quest/wolf/spawning/remove_structures
kill @e[type=marker,tag=wolf_painting]

# Remove transient dragon-quest rewards, souls, and electric-bow projectiles.
kill @e[tag=quest_dragon_soul_mannequin]
kill @e[tag=quest_dragon_bow]
kill @e[tag=quest_dragon_bow_interaction]
kill @e[type=breeze,tag=giant_breeze]
function zbk_der_eisendrache:quest/bows/electric/weather_vane/management/cleanup
function zbk_der_eisendrache:quest/bows/binding/initialize

# Stop active disco state and remove runtime rebuilt from de_disco_marker.
scoreboard players set #disco disco_active 0
scoreboard players set #disco disco_timer 0
scoreboard players reset @a disco_start
tag @e[tag=disco_active] remove disco_active
stopsound @a master zbk:game.disco
execute as @e[type=item_display,tag=disco_ball] on passengers run kill @s
kill @e[type=item_display,tag=disco_ball]
kill @e[type=interaction,tag=disco_interaction]

# Hide fire-ring displays until the selected map is initialized again.
function zbk_der_eisendrache:quest/fire_ring/initialize

function zbk_der_eisendrache:quest/bows/electric/storm/management/cleanup

function zbk_der_eisendrache:quest/hud/initialize

function zbk_der_eisendrache:quest/bows/electric/wall_panels/initialize

function zbk_der_eisendrache:quest/bows/electric/soul_pots/initialize

function zbk_der_eisendrache:quest/bows/electric/reforging/management/clear_runtime

function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/clear_runtime

function zbk_der_eisendrache:quest/bows/electric/orb/initialize
