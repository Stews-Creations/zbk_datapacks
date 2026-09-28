# Initialize wolf painting shuffle storage
# Called on datapack load/reload

# Initialize storage namespace with default arrays
data modify storage zombies:wolf_shuffle current set value [1,2,3,4]
data modify storage zombies:wolf_shuffle previous set value [1,2,3,4]
data modify storage zombies:wolf_shuffle temp set value 0

tellraw @a[tag=debug] [{"text":"[Wolf Shuffle] Storage initialized","color":"green"}]
