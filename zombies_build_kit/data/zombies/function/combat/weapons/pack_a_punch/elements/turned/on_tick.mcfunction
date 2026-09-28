# Per-tick logic for a turned zombie — run as @s = turned zombified_piglin

# Prevent sunlight fire visual (Invulnerable blocks damage but not the fire effect)
data modify entity @s Fire set value 0s

# Green particle aura
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ~ ~0.5 ~ 0.4 0.4 0.4 0.05 4 force
particle minecraft:soul_fire_flame ~ ~1 ~ 0.2 0.3 0.2 0.02 1 normal

# Re-anger toward nearest non-turned wave enemy every tick with a 5s forward window
# (MC 1.21: angry_at + anger_end_time). Short window so the piglin can't drift back
# to neutral when targets are out of range.
function zombies:combat/weapons/pack_a_punch/elements/turned/set_anger {delta:100}

# Self-kill if no other wave enemies remain — round can't progress otherwise,
# and once anger expires the turned piglin would start attacking the player.
execute unless entity @e[type=zombified_piglin,tag=wave_zombie,tag=!turned_zombie,tag=!immune_elements] run kill @s

# Expiry — inline kill
execute store result score #cur_time temp run time query gametime
execute if score #cur_time temp >= @s turned_expire run kill @s
