# === CREATE ELECTRIC TRAP FROM SIGN ===
# Runs when a sign with Electric Trap text is detected
# Links the two nearest corner markers and creates the trap control marker

# Find nearest corner 1 and corner 2
execute as @e[type=marker,tag=trap_corner1,sort=nearest,limit=1] at @s run tag @s add temp_c1
execute as @e[type=marker,tag=trap_corner2,sort=nearest,limit=1] at @s run tag @s add temp_c2

# Store corner 1 position
execute as @e[type=marker,tag=temp_c1,limit=1] at @s store result score #trap_x1 trap_timer run data get entity @s Pos[0] 1
execute as @e[type=marker,tag=temp_c1,limit=1] at @s store result score #trap_y1 trap_timer run data get entity @s Pos[1] 1
execute as @e[type=marker,tag=temp_c1,limit=1] at @s store result score #trap_z1 trap_timer run data get entity @s Pos[2] 1

# Store corner 2 position
execute as @e[type=marker,tag=temp_c2,limit=1] at @s store result score #trap_x2 trap_timer run data get entity @s Pos[0] 1
execute as @e[type=marker,tag=temp_c2,limit=1] at @s store result score #trap_y2 trap_timer run data get entity @s Pos[1] 1
execute as @e[type=marker,tag=temp_c2,limit=1] at @s store result score #trap_z2 trap_timer run data get entity @s Pos[2] 1

# Create trap control marker at corner 1 location with references to both corners
execute as @e[type=marker,tag=temp_c1,limit=1] at @s run summon marker ~ ~ ~ {Tags:["electric_trap","trap_ready","trap_control"],data:{cost:1000,duration:30,cooldown:45}}

# Link corners + sign + control marker with one unique ID
scoreboard players add #trap_id_counter trap_id 1
execute as @e[type=marker,tag=trap_control,tag=!trap_initialized] run scoreboard players operation @s trap_id = #trap_id_counter trap_id
execute as @e[type=marker,tag=temp_c1] run scoreboard players operation @s trap_id = #trap_id_counter trap_id
execute as @e[type=marker,tag=temp_c2] run scoreboard players operation @s trap_id = #trap_id_counter trap_id
execute as @e[type=marker,tag=temp_c1] at @s run scoreboard players operation @e[type=marker,tag=trap_sign,distance=..100,limit=1,sort=nearest] trap_id = #trap_id_counter trap_id

# Mirror default cost into corners
execute as @e[type=marker,tag=temp_c1] run data modify entity @s data.cost set value 1000
execute as @e[type=marker,tag=temp_c2] run data modify entity @s data.cost set value 1000

# Tag control marker as initialized
execute as @e[type=marker,tag=trap_control,tag=!trap_initialized] run tag @s add trap_initialized

# Remove temp tags
tag @e[tag=temp_c1] remove temp_c1
tag @e[tag=temp_c2] remove temp_c2

# Visual effect
particle minecraft:end_rod ~ ~1 ~ 1 1 1 0.05 30 force
playsound minecraft:block.beacon.power_select master @a ~ ~ ~ 0.8 1.2

# Message
execute as @a[distance=..15,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Electric Trap created!","color":"gold"}]
