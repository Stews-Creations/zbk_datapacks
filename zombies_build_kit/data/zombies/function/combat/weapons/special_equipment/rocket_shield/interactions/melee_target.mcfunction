# Context: candidate mob. Confirm its recorded attacker is the current shield user.
scoreboard players set #matched rs_melee_match 0
execute on attacker if entity @s[tag=rs_melee_actor] run scoreboard players set #matched rs_melee_match 1
execute if score #matched rs_melee_match matches 1 run damage @s 100000 minecraft:player_attack by @a[tag=rs_melee_actor,limit=1]
