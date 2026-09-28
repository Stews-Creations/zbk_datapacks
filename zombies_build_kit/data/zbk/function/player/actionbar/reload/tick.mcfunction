# Presentation only: read the current combat timer after inventory enforcement.
execute unless entity @s[gamemode=adventure,team=!downed] run return run function zbk:player/actionbar/reload/clear
execute unless items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{gun:true}] run return run function zbk:player/actionbar/reload/clear
execute if entity @s[tag=death_machine_active] run return run function zbk:player/actionbar/reload/clear
execute if score @s hide_gun matches 1.. run return run function zbk:player/actionbar/reload/clear
scoreboard players set #rb_timer temp 0
scoreboard players set #rb_slot temp 0
scoreboard players set #rb_ammo temp 0
scoreboard players set #rb_gun temp 0
execute if score @s active_weapon matches 0 run scoreboard players set #rb_slot temp 1
execute if score @s active_weapon matches 0 run scoreboard players operation #rb_gun temp = @s gun_1
execute if score @s active_weapon matches 0 run scoreboard players operation #rb_ammo temp = @s ammo_1
execute if score @s active_weapon matches 0 if score @s is_reloading_1 matches 1 run scoreboard players operation #rb_timer temp = @s reload_timer_1
execute if score @s active_weapon matches 1 run scoreboard players set #rb_slot temp 2
execute if score @s active_weapon matches 1 run scoreboard players operation #rb_gun temp = @s gun_2
execute if score @s active_weapon matches 1 run scoreboard players operation #rb_ammo temp = @s ammo_2
execute if score @s active_weapon matches 1 if score @s is_reloading_2 matches 1 run scoreboard players operation #rb_timer temp = @s reload_timer_2
execute if score @s active_weapon matches 2 run scoreboard players set #rb_slot temp 3
execute if score @s active_weapon matches 2 run scoreboard players operation #rb_gun temp = @s gun_3
execute if score @s active_weapon matches 2 run scoreboard players operation #rb_ammo temp = @s ammo_3
execute if score @s active_weapon matches 2 if score @s is_reloading_3 matches 1 run scoreboard players operation #rb_timer temp = @s reload_timer_3
execute unless score @s rb_slot = #rb_slot temp run function zbk:player/actionbar/reload/clear
execute unless score @s rb_gun = #rb_gun temp run function zbk:player/actionbar/reload/clear
execute if score #rb_timer temp matches 1.. run return run function zbk:player/actionbar/reload/progress
# A completed reload transfers ammo; cancellation must not flash.
execute if score @s rb_prev matches 1.. if score #rb_ammo temp > @s rb_ammo run scoreboard players set @s rb_flash 6
scoreboard players set @s rb_prev 0
scoreboard players set @s rb_step 44
execute if score @s rb_flash matches 1.. run scoreboard players set @s rb_step 43
execute if score @s rb_flash matches 1.. run scoreboard players remove @s rb_flash 1
