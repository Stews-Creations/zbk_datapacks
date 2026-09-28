# Partial custom-data matching accepts the gun flag alongside other weapon fields.
# A real F swap removes the gun from the offhand. Dragged copies must not cycle weapons.

# ===================================
# DETECT WEAPON SWAP (F KEY)
# ===================================
# Detects when player presses F to swap offhand with mainhand
# In adventure mode, F swaps items between hands
# Check ALL hotbar slots (0-8) in case player scrolled away from knife

# Consume at most one swap per player tick; inventory enforcement clears stray displays.
execute if items entity @s weapon.offhand *[custom_data~{gun:true}] run return 0
# Detect if gun appeared in ANY hotbar slot - means F was pressed
execute if items entity @s hotbar.0 *[minecraft:custom_data~{gun:true}] run return run function zombies:player/swap_weapon/cycle
execute if items entity @s hotbar.1 *[minecraft:custom_data~{gun:true}] run return run function zombies:player/swap_weapon/cycle
execute if items entity @s hotbar.2 *[minecraft:custom_data~{gun:true}] run return run function zombies:player/swap_weapon/cycle
execute if items entity @s hotbar.3 *[minecraft:custom_data~{gun:true}] run return run function zombies:player/swap_weapon/cycle
execute if items entity @s hotbar.4 *[minecraft:custom_data~{gun:true}] run return run function zombies:player/swap_weapon/cycle
execute if items entity @s hotbar.5 *[minecraft:custom_data~{gun:true}] run return run function zombies:player/swap_weapon/cycle
execute if items entity @s hotbar.6 *[minecraft:custom_data~{gun:true}] run return run function zombies:player/swap_weapon/cycle
execute if items entity @s hotbar.7 *[minecraft:custom_data~{gun:true}] run return run function zombies:player/swap_weapon/cycle
execute if items entity @s hotbar.8 *[minecraft:custom_data~{gun:true}] run return run function zombies:player/swap_weapon/cycle
