# ===================================
# BUILD KIT - TICK AS PLAYER
# ===================================
# Runs every game tick for each player (called from execute as @a at @s)

# Show nearby markers to players holding the Build Manager stick
execute if items entity @s weapon.mainhand minecraft:stick[custom_data~{build_manager:true}] run function zbk:build_kit/markers/show_nearby

function zbk:dispatch/builder_tick
