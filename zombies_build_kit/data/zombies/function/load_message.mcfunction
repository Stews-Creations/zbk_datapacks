# ===================================
# ZOMBIES BUILD KIT - LOAD MESSAGE
# ===================================
# Sends reload/load messages to a player (called as @a from load.mcfunction)
stopsound @s

# ===== STARTUP MESSAGE =====
tellraw @s {"text":"[ZBK] Loaded Zombies Build Kit core for Minecraft 26.2","color":"aqua"}
tellraw @s [{"text":"[ZBK] ","color":"aqua"},{"text":"Press ESC and click ","color":"white"},{"text":"'Zombies'","color":"yellow","bold":true},{"text":" to access the game manager and build kit!","color":"white"}]
tellraw @s [{"text":"[ZBK] ","color":"aqua"},{"text":"Join my Discord! ","color":"white"},{"text":"[Click Here]","color":"green","bold":true,"click_event":{"action":"open_url","url":"https://discord.gg/bYe7TWhXwj"},"hover_event":{"action":"show_text","value":"Click to join the Discord!"}}]

# ===== DEBUG MODE STATUS =====
execute if entity @s[tag=debug] run tellraw @s [{"text":"[ZBK] ","color":"aqua"},{"text":"Debug mode: ","color":"white"},{"text":"ENABLED","color":"green"},{"text":" (level ","color":"white"},{"score":{"name":"@s","objective":"debug_level"},"color":"yellow"},{"text":")","color":"white"}]
execute if entity @s[tag=!debug] run tellraw @s [{"text":"[ZBK] ","color":"aqua"},{"text":"Debug mode: ","color":"white"},{"text":"disabled","color":"gray"}]
