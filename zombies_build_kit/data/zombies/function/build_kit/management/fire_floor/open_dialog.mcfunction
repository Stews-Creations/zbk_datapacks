# === OPEN FIRE FLOOR DIALOG ===
# Opens the fire floor info dialog

tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

# Show info message
tellraw @s [{"text":"[Fire Floor] ","color":"red"},{"text":"Fire floor marker - damages players in this area","color":"white"}]
