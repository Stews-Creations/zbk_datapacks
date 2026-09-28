# ===================================
# SMOKE EFFECT
# ===================================
# Spawns blue dust particles for 2 seconds
# Called positioned 1 block above entity
# $direction: north, east, south, or west
# ===================================

# Summon a marker to track position and run the effect
# The main tick function will handle running the effect each tick
$summon marker ~ ~ ~ {Tags:["mystery_box_smoke_effect"],data:{direction:"$(direction)"}}
