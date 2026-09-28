# Fallback perk grant - tries each perk until one is granted
# Called when the randomly selected perk was already owned
# Uses return to stop after granting one perk

# Try Juggernog
execute if score @s perk_jugg matches 0 run tag @s add perk_granted
execute if score @s perk_jugg matches 0 run return run function zombies:map_elements/perks/juggernog/grant

# Try Speed Cola
execute if score @s perk_speed matches 0 run tag @s add perk_granted
execute if score @s perk_speed matches 0 run return run function zombies:map_elements/perks/speed_cola/grant

# Try Double Tap
execute if score @s perk_doubletap matches 0 run tag @s add perk_granted
execute if score @s perk_doubletap matches 0 run return run function zombies:map_elements/perks/double_tap/grant

# Try Stamina Up
execute if score @s perk_stamina matches 0 run tag @s add perk_granted
execute if score @s perk_stamina matches 0 run return run function zombies:map_elements/perks/stamina_up/grant

# Try Quick Revive
execute if score @s perk_revive matches 0 run tag @s add perk_granted
execute if score @s perk_revive matches 0 run return run function zombies:map_elements/perks/quick_revive/grant

# Try Mule Kick
execute if score @s perk_mule matches 0 run tag @s add perk_granted
execute if score @s perk_mule matches 0 run return run function zombies:map_elements/perks/mule_kick/grant
