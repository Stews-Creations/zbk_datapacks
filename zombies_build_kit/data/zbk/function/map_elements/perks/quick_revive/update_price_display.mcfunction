# === UPDATE QUICK REVIVE PRICE DISPLAY ===
# Purpose: Update the text_display price based on game mode
# Solo: 500 points
# Co-op: 1500 points

# Update to 500 for solo mode
execute if score #game_mode game_mode matches 1 as @e[type=text_display,tag=quick_revive_text] run data merge entity @s {text:{"bold":true,"color":"#6FC4F6","text":"Quick Revive\n","extra":[{"color":"yellow","text":"500"}]}}

# Update to 1500 for co-op mode (default)
execute if score #game_mode game_mode matches 2 as @e[type=text_display,tag=quick_revive_text] run data merge entity @s {text:{"bold":true,"color":"#6FC4F6","text":"Quick Revive\n","extra":[{"color":"yellow","text":"1500"}]}}
