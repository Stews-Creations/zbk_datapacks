function zbk_der_eisendrache:quest/bows/electric/ritual_box/on_load
function zbk_der_eisendrache:quest/bows/electric/reforging/on_load
function zbk_der_eisendrache:quest/bows/electric/soul_pots/on_load
# ===================================
# QUEST ITEMS MODULE - LOAD
# ===================================
# Initializes quest item systems (dragon heads, bows, etc.)

# Transient charged-electric storm state, initialized even before Der Eisendrache selection.
scoreboard objectives add de_storm_owner dummy
scoreboard objectives add de_storm_life dummy
scoreboard objectives add de_storm_link dummy

# Call quest submodule scoreboard setup
function zbk_der_eisendrache:quest/bows/electric/fires/on_load
function zbk_der_eisendrache:quest/hud/on_load
function zbk_der_eisendrache:quest/bows/binding/on_load
function zbk_der_eisendrache:quest/bows/electric/weather_vane/on_load
function zbk_der_eisendrache:quest/wolf/on_load
function zbk_der_eisendrache:quest/disco/on_load
function zbk_der_eisendrache:quest/dragon_heads/on_load

function zbk_der_eisendrache:quest/bows/electric/wall_panels/on_load

function zbk_der_eisendrache:quest/bows/electric/orb/on_load
scoreboard objectives add de_storm_audio dummy

function zbk_der_eisendrache:quest/bows/electric/storm/on_load
