# Spawn a soul mannequin targeting the correct Dragon Head
# Run as the dragon head, at the stone marker location

# Spawn mannequin with base tags (new_soul for temp identification)
summon minecraft:mannequin ~ ~ ~ {Tags:["quest_dragon_soul_mannequin","combat_ignore","immune_guns","immune_explosives","immune_elements","immune_nuke","immune_melee","new_soul"],profile:{texture:"entity/zombie/zombie",model:"wide"},pose:"swimming",NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b}

# Add the correct soul_target tag based on which head @s is
execute if entity @s[tag=quest_dragon_head_1] run tag @e[tag=new_soul,limit=1,sort=nearest] add soul_target_1
execute if entity @s[tag=quest_dragon_head_2] run tag @e[tag=new_soul,limit=1,sort=nearest] add soul_target_2
execute if entity @s[tag=quest_dragon_head_3] run tag @e[tag=new_soul,limit=1,sort=nearest] add soul_target_3

# Initialize animation timer
execute as @e[tag=new_soul,limit=1,sort=nearest] run scoreboard players set @s soul_anim_timer 0

# Apply ghostly visual effects
particle minecraft:soul ~ ~0.5 ~ 0.3 0.3 0.3 0.05 20 force

# Play soul spawn sound
playsound zbk_der_eisendrache:dragon.soul_suck master @a ~ ~ ~ 0.25 1

# Remove new tag
tag @e[tag=new_soul] remove new_soul
