# ===================================
# BEAM EFFECT
# ===================================
# Spawns a vertical beam of light at mystery box locations
# Called every tick from main tick function
# Only runs for locations without the 'disabled' tag
# ===================================

# Vertical beam using blue dust particles
# Creates a highly visible blue beam to mark mystery box locations
# Spawns particles from ground level up to 250 blocks high

# Blue dust particles - create bright blue visible beam (every 5 blocks)
execute positioned ~ ~5 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.1 1 0.1 0 5 force
execute positioned ~ ~10 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.1 1 0.1 0 5 force
execute positioned ~ ~15 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.1 1 0.1 0 5 force
execute positioned ~ ~20 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.12 1 0.12 0 5 force
execute positioned ~ ~25 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.15 1 0.15 0 5 force
execute positioned ~ ~30 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.15 1 0.15 0 5 force
execute positioned ~ ~35 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.15 1 0.15 0 5 force
execute positioned ~ ~40 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.18 1 0.18 0 5 force
execute positioned ~ ~45 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.2 1 0.2 0 5 force
execute positioned ~ ~50 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.2 1 0.2 0 5 force
execute positioned ~ ~55 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.2 1 0.2 0 5 force
execute positioned ~ ~60 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.22 1 0.22 0 5 force
execute positioned ~ ~65 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.25 1 0.25 0 5 force
execute positioned ~ ~70 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.25 1 0.25 0 5 force
execute positioned ~ ~75 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.25 1 0.25 0 5 force
execute positioned ~ ~80 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.28 1 0.28 0 5 force
execute positioned ~ ~85 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.3 1 0.3 0 5 force
execute positioned ~ ~90 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.3 1 0.3 0 5 force
execute positioned ~ ~95 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.3 1 0.3 0 5 force
execute positioned ~ ~100 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.32 1 0.32 0 5 force
execute positioned ~ ~105 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.35 1 0.35 0 5 force
execute positioned ~ ~110 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.35 1 0.35 0 5 force
execute positioned ~ ~115 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.35 1 0.35 0 5 force
execute positioned ~ ~120 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.38 1 0.38 0 5 force
execute positioned ~ ~125 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.4 1 0.4 0 5 force
execute positioned ~ ~130 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.4 1 0.4 0 5 force
execute positioned ~ ~135 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.4 1 0.4 0 5 force
execute positioned ~ ~140 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.42 1 0.42 0 5 force
execute positioned ~ ~145 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.45 1 0.45 0 5 force
execute positioned ~ ~150 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.45 1 0.45 0 5 force
execute positioned ~ ~155 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.45 1 0.45 0 5 force
execute positioned ~ ~160 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.48 1 0.48 0 5 force
execute positioned ~ ~165 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.5 1 0.5 0 5 force
execute positioned ~ ~170 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.5 1 0.5 0 5 force
execute positioned ~ ~175 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.5 1 0.5 0 5 force
execute positioned ~ ~180 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.52 1 0.52 0 5 force
execute positioned ~ ~185 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.55 1 0.55 0 5 force
execute positioned ~ ~190 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.55 1 0.55 0 5 force
execute positioned ~ ~195 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.55 1 0.55 0 5 force
execute positioned ~ ~200 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.58 1 0.58 0 5 force
execute positioned ~ ~205 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.6 1 0.6 0 5 force
execute positioned ~ ~210 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.6 1 0.6 0 5 force
execute positioned ~ ~215 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.6 1 0.6 0 5 force
execute positioned ~ ~220 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.62 1 0.62 0 5 force
execute positioned ~ ~225 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.65 1 0.65 0 5 force
execute positioned ~ ~230 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.65 1 0.65 0 5 force
execute positioned ~ ~235 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.65 1 0.65 0 5 force
execute positioned ~ ~240 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.68 1 0.68 0 5 force
execute positioned ~ ~245 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.7 1 0.7 0 5 force
execute positioned ~ ~250 ~ run particle minecraft:dust{color:[0.2,0.4,1.0],scale:2.0} ~ ~ ~ 0.7 1 0.7 0 5 force
