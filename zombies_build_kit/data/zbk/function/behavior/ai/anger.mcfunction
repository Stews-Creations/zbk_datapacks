# The availability score is a synchronous batch hint, not a remembered target.
# Callers outside that batch must still discover a live decoy before changing anger.

# === Shared Anger Logic ===
# Skip turned zombies — they target other zombies via their own on_tick, not players
execute if entity @s[tag=turned_zombie] run return 0

# Pre-compute anger end time (current gametime + 100 ticks)
execute store result score #anger_end_time temp run time query gametime
scoreboard players add #anger_end_time temp 100

# Monkey bomb: force all normal enemies to target the active monkey decoy instead of players.
# on_tick supplies 0/1 only inside its piglin or wolf batch; other callers search freshly.
execute if score #monkey_available temp matches 1 run return run function zbk:behavior/ai/target_monkey
execute unless score #monkey_available temp matches 0..1 if entity @e[type=zombie,tag=monkey_bomb_decoy,limit=1] run return run function zbk:behavior/ai/target_monkey

# Retarget to nearest player if not already targeting them
execute if entity @a[gamemode=adventure,team=!downed] store result score #nearest_player_id temp run scoreboard players get @p[gamemode=adventure,team=!downed,sort=nearest,limit=1] id

# Get current target's ID (default -1 if no match)
scoreboard players set #current_target_id temp -1
execute on target if entity @s[type=player] run scoreboard players operation #current_target_id temp = @s id

# If current target doesn't match nearest player, retarget
execute if entity @a[gamemode=adventure,team=!downed] unless score #nearest_player_id temp = #current_target_id temp run data modify entity @s angry_at set from entity @p[gamemode=adventure,team=!downed,sort=nearest,limit=1] UUID
execute if entity @a[gamemode=adventure,team=!downed] unless score #nearest_player_id temp = #current_target_id temp store result entity @s anger_end_time long 1 run scoreboard players get #anger_end_time temp

# Fallback: if no target at all, set to nearest player
execute unless data entity @s angry_at run data modify entity @s angry_at set from entity @p[gamemode=adventure,team=!downed,sort=nearest,limit=1] UUID
execute unless data entity @s angry_at store result entity @s anger_end_time long 1 run scoreboard players get #anger_end_time temp

# Solo down: assign each enemy a random decoy (once) so they spread out
execute unless entity @a[gamemode=adventure,team=!downed] if entity @e[type=zombie,tag=solo_down_decoy] unless entity @s[tag=has_decoy_target] run data modify entity @s angry_at set from entity @e[type=zombie,tag=solo_down_decoy,sort=random,limit=1] UUID
execute unless entity @a[gamemode=adventure,team=!downed] if entity @e[type=zombie,tag=solo_down_decoy] unless entity @s[tag=has_decoy_target] store result entity @s anger_end_time long 1 run scoreboard players get #anger_end_time temp
execute unless entity @a[gamemode=adventure,team=!downed] if entity @e[type=zombie,tag=solo_down_decoy] unless entity @s[tag=has_decoy_target] run tag @s add has_decoy_target

# Clear decoy tag when players are alive again (so normal targeting resumes)
execute if entity @a[gamemode=adventure,team=!downed] run tag @s remove has_decoy_target
