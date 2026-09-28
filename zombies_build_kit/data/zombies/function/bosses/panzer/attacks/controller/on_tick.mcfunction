# Runs as and at: panzer_ai iron golem.

# A captured Panzer cannot relocate, tick an attack window, or start an attack.
execute if entity @s[tag=zbk.enemy_stunned] run return 0

# Cooldown is shared across all Panzer attacks.
execute if score @s panzer_attack_cooldown matches 1.. run scoreboard players remove @s panzer_attack_cooldown 1

# Active attack windows tick before picking a new attack.
execute if entity @s[tag=panzer_melee_attack] run function zombies:bosses/panzer/attacks/melee/tick
execute if entity @s[tag=panzer_flame_attack] run function zombies:bosses/panzer/attacks/flame_thrower/tick
execute if entity @s[tag=panzer_range_attack] run function zombies:bosses/panzer/attacks/range/tick
execute if entity @s[tag=panzer_attacking] run return 0

execute unless entity @a[gamemode=adventure,team=!downed] run return 0

# Ranges:
# - close: melee now
# - medium: flamethrower
# - long: electric throw
execute unless score @s panzer_attack_cooldown matches 1.. if entity @p[gamemode=adventure,team=!downed,distance=..3.6,sort=nearest,limit=1] run function zombies:bosses/panzer/attacks/melee/start
execute if entity @s[tag=panzer_attacking] run return 0
execute unless score @s panzer_attack_cooldown matches 1.. if entity @p[gamemode=adventure,team=!downed,distance=3.7..11,sort=nearest,limit=1] run function zombies:bosses/panzer/attacks/flame_thrower/start
execute if entity @s[tag=panzer_attacking] run return 0
execute unless score @s panzer_attack_cooldown matches 1.. if entity @p[gamemode=adventure,team=!downed,distance=11.1..28,sort=nearest,limit=1] run function zombies:bosses/panzer/attacks/range/start
