# If active_weapon is currently on an empty or locked slot, advance to the next slot.
# Wraps past 3 back to 0. Called by cycle.mcfunction (3x) to walk past unusable slots.
#
# A slot is "unusable" if:
#   - active_weapon=0 and gun_1 score is 0 (empty / pending PaP)
#   - active_weapon=1 and gun_2 score is 0
#   - active_weapon=2 and gun_3 score is 0 OR player lacks Mule Kick

execute if score @s active_weapon matches 0 if score @s gun_1 matches 0 run scoreboard players add @s active_weapon 1
execute if score @s active_weapon matches 1 if score @s gun_2 matches 0 run scoreboard players add @s active_weapon 1
execute if score @s active_weapon matches 2 if score @s gun_3 matches 0 run scoreboard players add @s active_weapon 1
execute if score @s active_weapon matches 2 unless score @s perk_mule matches 1.. run scoreboard players add @s active_weapon 1

# Wrap past max
execute if score @s active_weapon matches 3.. run scoreboard players set @s active_weapon 0
