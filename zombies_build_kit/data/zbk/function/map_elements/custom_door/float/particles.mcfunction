# === CUSTOM DOOR FLOAT - PARTICLES (MACRO) ===
# Spawns floating effect particles with zone-sized spread for players within 22.4 blocks

$particle dust_color_transition{from_color:[0.290,0.455,1.000],to_color:[0.800,0.100,1.000],scale:0.75} ~ ~ ~ $(spread_x) $(spread_y) $(spread_z) 0.01 6 normal @a[distance=..22.4]
$execute if score #tick tick matches 0..5 run particle dust{color:[1.000,0.900,0.500],scale:1.4} ~ ~ ~ $(spread_x) $(spread_y) $(spread_z) 0 3 normal @a[distance=..22.4]
