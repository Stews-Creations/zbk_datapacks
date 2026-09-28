# === Give Build Manager Stick ===
# Gives the player a special stick for managing map settings

give @s minecraft:stick[custom_name={"text":"Build Manager","color":"gold","italic":false},custom_data={build_manager:true},enchantment_glint_override=true,consumable={consume_seconds:1000000,animation:"none",has_consume_particles:false}] 1

# Reset trigger
scoreboard players reset @s give_build_manager
scoreboard players enable @a give_build_manager
