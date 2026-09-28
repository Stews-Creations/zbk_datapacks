# ===================================
# BLOCKS SUBMODULE - RELOAD STATE
# ===================================
# On datapack reload, reflect map power requirement.

execute if score #power_required power matches 1 run function zombies:map_elements/blocks/management/set_unlit
execute if score #power_required power matches 0 run function zombies:map_elements/blocks/management/set_lit
