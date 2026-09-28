# ===================================
# EXPLOSIVE BARREL MODULE - LOAD
# ===================================
# Purpose: Initialize scoreboards and state for explosive barrel prop

scoreboard objectives add give_explosive_barrel_egg trigger
scoreboard objectives add barrel_health dummy


# Rebuild loaded runtime from persistent marker placement.
function zbk:map_elements/explosive_barrel/initialize
