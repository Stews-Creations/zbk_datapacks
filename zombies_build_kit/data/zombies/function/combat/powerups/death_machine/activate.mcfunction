function zombies:debug/event {f:"POWERUP",m:"Death Machine!"}

# Per-player only: sound to @s, no global flag, timer lives on @s.
playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1000 1

tag @s add death_machine_active
scoreboard players set @s dm_timer 600
scoreboard players set @s dm_fire_cooldown 0
scoreboard players set @s dm_sound_cooldown 0
scoreboard players set @s dm_firing 0
scoreboard players set @s dm_sound_alt 0
