# Hide a spawn mannequin before removing it so the death animation is out of view.

tag @s remove wz_slot
tag @s remove wave_enemy
tag @s remove wz_converting
data merge entity @s {Invisible:1b,Silent:1b}
tp @s ~ -1000 ~
kill @s
