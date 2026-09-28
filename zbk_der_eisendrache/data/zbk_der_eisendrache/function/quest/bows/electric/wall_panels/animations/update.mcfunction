scoreboard players set @s de_ep_want 0
execute if score @s de_ep_near matches 1 run scoreboard players set @s de_ep_want 1
execute if score @s de_ep_flash matches 1.. run scoreboard players remove @s de_ep_flash 1
execute unless score @s de_ep_present matches 1 run scoreboard players set @s de_ep_touch 0
execute if score @s de_ep_close matches 1 unless score @s de_ep_touch matches 1 run function zbk_der_eisendrache:quest/bows/electric/wall_panels/effects/flash
execute if score @s de_ep_close matches 1 run scoreboard players set @s de_ep_touch 1
execute if score @s de_ep_flash matches 1.. run scoreboard players set @s de_ep_want 2
# Model-only preview expires automatically; it never binds a quest or changes progress.
execute if score @s de_ep_test matches 1.. run scoreboard players operation @s de_ep_want = @s de_ep_preview
execute if score @s de_ep_test matches 1.. run scoreboard players remove @s de_ep_test 1
