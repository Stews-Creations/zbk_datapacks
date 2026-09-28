# === SPAWN BOX FOR FIRE SALE ===
# @s = mystery_box_location marker
# Spawns the mystery box and sets the fire sale price

# Play spawn animation
function zbk:map_elements/mystery_box/animation/triggers/spawn

# Update text display to fire sale price
execute at @s as @e[tag=mystery_box_10,type=text_display,distance=..2,limit=1,sort=nearest] run data merge entity @s {text:[{"text":"Buy: 10","color":"#FFAA00","bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":"minecraft:uniform"}]}
