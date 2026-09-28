function zombies:combat/weapons/guns/bo3/input/sync
scoreboard players add @s bo3_delay_1 0
scoreboard players add @s bo3_burst_1 0
execute if score @s bo3_delay_1 matches 1.. run scoreboard players remove @s bo3_delay_1 50
execute if score @s bo3_burst_1 matches 0 unless score @s bo3_hold matches 1.. if score @s bo3_delay_1 matches ..-1 run scoreboard players set @s bo3_delay_1 0
scoreboard players add @s bo3_delay_2 0
scoreboard players add @s bo3_burst_2 0
execute if score @s bo3_delay_2 matches 1.. run scoreboard players remove @s bo3_delay_2 50
execute if score @s bo3_burst_2 matches 0 unless score @s bo3_hold matches 1.. if score @s bo3_delay_2 matches ..-1 run scoreboard players set @s bo3_delay_2 0
scoreboard players add @s bo3_delay_3 0
scoreboard players add @s bo3_burst_3 0
execute if score @s bo3_delay_3 matches 1.. run scoreboard players remove @s bo3_delay_3 50
execute if score @s bo3_burst_3 matches 0 unless score @s bo3_hold matches 1.. if score @s bo3_delay_3 matches ..-1 run scoreboard players set @s bo3_delay_3 0
scoreboard players add @s bo3_delay_4 0
scoreboard players add @s bo3_burst_4 0
execute if score @s bo3_delay_4 matches 1.. run scoreboard players remove @s bo3_delay_4 50
execute if score @s bo3_burst_4 matches 0 unless score @s bo3_hold matches 1.. if score @s bo3_delay_4 matches ..-1 run scoreboard players set @s bo3_delay_4 0
scoreboard players remove @s[scores={bo3_hold=1..}] bo3_hold 1
function zombies:combat/weapons/guns/bo3/input/dispatch
execute if entity @s[team=downed] if score @s ammo_4 matches ..0 if score @s reserve_ammo_4 matches 1.. if score @s is_reloading_4 matches 0 run function zombies:combat/weapons/guns/bo3/reload/slot_4
scoreboard players remove @s[scores={reload_timer_4=1..}] reload_timer_4 1
execute if score @s reload_timer_4 matches 0 if score @s is_reloading_4 matches 1 run function zombies:combat/weapons/guns/bo3/reload/complete_4
