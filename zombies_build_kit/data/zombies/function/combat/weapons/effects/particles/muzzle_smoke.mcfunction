# Player executor at their position; x is the positive lateral magnitude.
# Minecraft local +X is left. Preference 2 mirrors only cosmetic smoke.
$execute unless score @s gun_side matches 2 anchored eyes positioned ^ ^ ^ run particle minecraft:smoke ^$(x) ^$(y) ^$(z) 0 0 0 0 1 $(mode)
$execute if score @s gun_side matches 2 anchored eyes positioned ^ ^ ^ run particle minecraft:smoke ^-$(x) ^$(y) ^$(z) 0 0 0 0 1 $(mode)
