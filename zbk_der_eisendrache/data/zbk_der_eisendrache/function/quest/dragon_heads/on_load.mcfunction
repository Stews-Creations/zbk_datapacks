# ===================================
# DRAGON HEADS QUEST - ON LOAD
# ===================================
# Called from maps/der_eisendrache/quest/on_load.mcfunction

# Quest state
scoreboard objectives add dragon_head_mode dummy "Dragon Head Mode"
scoreboard objectives add dragon_head_souls dummy "Dragon Head Souls"
scoreboard objectives add dragon_head_cooldown dummy "Dragon Head Cooldown"
scoreboard objectives add dragon_head_anim dummy "Dragon Head Animation"
scoreboard objectives add soul_anim_timer dummy "Soul Animation Timer"
scoreboard objectives add dragon_idle_sound dummy "Dragon Idle Sound Timer"
scoreboard objectives add dragon_heads_config dummy "Dragon Heads Config"
scoreboard objectives add dragon_heads_complete dummy "Dragon Heads Complete"
