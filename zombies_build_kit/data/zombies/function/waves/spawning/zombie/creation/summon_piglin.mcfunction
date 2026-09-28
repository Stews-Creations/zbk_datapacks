# Explicit summon NBT bypasses randomized mob initialization (babies and jockeys).
# Clear the scratch tag first so callers can select only this synchronous summon.
tag @e[type=zombified_piglin,tag=wz_new_piglin] remove wz_new_piglin
return run summon minecraft:zombified_piglin ~ ~ ~ {IsBaby:0b,Tags:["wz_new_piglin"]}
