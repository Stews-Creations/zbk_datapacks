# Called when a pending spawn is ready (fire sale, box finished animating)
# @s = mystery_box_location marker

# Clear pending spawn flag
scoreboard players reset @s mystery_box_pending_spawn

# Play spawn animation
function zombies:map_elements/mystery_box/animation/triggers/spawn

# Update text display to fire sale price (in case it was reset)
execute at @s as @e[tag=mystery_box_10,type=text_display,distance=..2,limit=1,sort=nearest] run data merge entity @s {text:[{"text":"Buy: 10","color":"#FFAA00","bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":"minecraft:uniform"}]}
