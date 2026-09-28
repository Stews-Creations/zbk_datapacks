# Pops the Panzer electric projectile when it hits terrain.
# Runs as and at: panzer_electric_projectile item_display.

particle minecraft:electric_spark ~ ~ ~ 0.3 0.3 0.3 0.5 24 force
particle minecraft:dust{color:[0.2,0.85,1.0],scale:0.8} ~ ~ ~ 0.2 0.2 0.2 0 12 force
playsound minecraft:block.conduit.attack.target hostile @a[distance=..24] ~ ~ ~ 0.65 1.9
function zbk:bosses/panzer/attacks/range/projectile/remove
