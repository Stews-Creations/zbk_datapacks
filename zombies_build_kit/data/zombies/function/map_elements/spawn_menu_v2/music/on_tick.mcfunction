
execute unless score #menu_music_timer global matches 0.. run scoreboard players set #menu_music_timer global 0
scoreboard players add #menu_music_timer global 1
execute if score #menu_music_timer global matches 3600.. as @e[type=text_display,tag=spawn_menu_v2_title,limit=1] at @s run function zombies:sounds/play/music_menu
execute if score #menu_music_timer global matches 3600.. run scoreboard players set #menu_music_timer global 0
