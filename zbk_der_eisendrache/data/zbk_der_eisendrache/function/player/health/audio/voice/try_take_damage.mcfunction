# Initialize previous health tracker if needed
execute unless score @s vo_prev_health matches -2147483648..2147483647 run scoreboard players operation @s vo_prev_health = @s health

# Trigger callout when player takes damage while in redscreen range (health <= 30)
execute if entity @s[team=!downed,scores={health=1..30}] if score @s health < @s vo_prev_health run function zbk_der_eisendrache:player/health/audio/voice/trigger/take_damage

# Update previous health snapshot
scoreboard players operation @s vo_prev_health = @s health
