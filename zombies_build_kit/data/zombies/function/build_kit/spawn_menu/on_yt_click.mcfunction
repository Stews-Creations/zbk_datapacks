# === SPAWN MENU - YT LOGO CLICK ===
# Reward function for advancement when player left-clicks the YT interaction
# @s = the interacting player

tellraw @s [{"text":"[ZBK] ","color":"aqua"},{"text":"Check out ","color":"white"},{"text":"@MiniStew on YouTube! ","color":"red","bold":true},{"text":"[Click Here]","color":"gold","bold":true,"underlined":true,"click_event":{"action":"open_url","url":"https://www.youtube.com/@MiniStew"},"hover_event":{"action":"show_text","value":"Click to open YouTube!"}}]

# Reset advancement so it can trigger again
advancement revoke @s only zombies:interaction_yt_logo
execute as @e[type=interaction,tag=yt_interaction] run data remove entity @s attack
