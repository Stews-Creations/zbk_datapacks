# If half health show hurt screen
execute if score @s health matches ..30 at @s run function zombies:player/health/hurt_screen
