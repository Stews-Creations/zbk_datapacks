# Advancement reward; runs as the player who clicked the Tram 1 reward model.
tag @e[type=interaction,tag=tram_reward_claim_target] remove tram_reward_claim_target
tag @e[type=interaction,tag=tram_reward_interaction,distance=..6,limit=1,sort=nearest] add tram_reward_claim_target
execute unless entity @e[type=interaction,tag=tram_reward_claim_target,limit=1] run advancement revoke @s only zbk_der_eisendrache:interaction_tram_reward
execute unless entity @e[type=interaction,tag=tram_reward_claim_target,limit=1] run return 0

scoreboard players operation #tram_reward_id global = @e[type=interaction,tag=tram_reward_claim_target,limit=1] tram_link_id
scoreboard players operation #tram_claim_roll temp = @e[type=interaction,tag=tram_reward_claim_target,limit=1] tram_reward_type
scoreboard players operation #tram_reward_owner global = @e[type=interaction,tag=tram_reward_claim_target,limit=1] tram_reward_own

# The rare Tram 2 Ray Gun belongs only to the player who purchased that call.
execute if score #tram_claim_roll temp matches 3 unless score @s id = #tram_reward_owner global run tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold"},{"text":"Only the player who called this tram can claim the Ray Gun.","color":"red"}]
execute if score #tram_claim_roll temp matches 3 unless score @s id = #tram_reward_owner global run tag @e[type=interaction,tag=tram_reward_claim_target] remove tram_reward_claim_target
execute if score #tram_claim_roll temp matches 3 unless score @s id = #tram_reward_owner global run advancement revoke @s only zbk_der_eisendrache:interaction_tram_reward
execute if score #tram_claim_roll temp matches 3 unless score @s id = #tram_reward_owner global run return 0

tag @e[type=marker,tag=tram_reward_target] remove tram_reward_target
execute as @e[type=marker,tag=tram_reward_spawn] if score @s tram_link_id = #tram_reward_id global run tag @s add tram_reward_target

# A claim is only valid while its linked reward marker still exists.
execute unless entity @e[type=marker,tag=tram_reward_target] run kill @e[type=interaction,tag=tram_reward_claim_target]
execute unless entity @e[type=marker,tag=tram_reward_target] run advancement revoke @s only zbk_der_eisendrache:interaction_tram_reward
execute unless entity @e[type=marker,tag=tram_reward_target] run return 0

execute as @e[type=marker,tag=tram_reward_target,limit=1] at @s run function zbk_der_eisendrache:tram/reward/cleanup_linked
scoreboard players set @e[type=marker,tag=tram_reward_target,limit=1] tram_r_state 2
tag @e[type=marker,tag=tram_reward_target] remove tram_reward_target
execute if score #tram_claim_roll temp matches 1 run function zbk_der_eisendrache:tram/reward/give/monkey_bombs
execute if score #tram_claim_roll temp matches 2 run function zbk_der_eisendrache:tram/reward/give/packed_shotgun
execute if score #tram_claim_roll temp matches 3 run function zbk_der_eisendrache:tram/reward/give/ray_gun
advancement revoke @s only zbk_der_eisendrache:interaction_tram_reward
