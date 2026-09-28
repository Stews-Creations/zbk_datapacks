scoreboard players set global insta_kill 0

effect clear @a strength

# Store expired slot before reset so only later powerups shift down.
scoreboard players operation #expired_powerup powerup_order = insta_kill powerup_order
scoreboard players set insta_kill powerup_order 0

# Shift down powerups that were displayed after this one.
execute if score #expired_powerup powerup_order matches 1.. if score active_powerups powerup_order matches 1.. run scoreboard players remove active_powerups powerup_order 1
execute if score #expired_powerup powerup_order matches 1.. if score double_points powerup_order > #expired_powerup powerup_order run scoreboard players remove double_points powerup_order 1
execute if score #expired_powerup powerup_order matches 1.. if score fire_sale powerup_order > #expired_powerup powerup_order run scoreboard players remove fire_sale powerup_order 1
