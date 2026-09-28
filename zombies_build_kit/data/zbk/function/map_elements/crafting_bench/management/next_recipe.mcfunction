# Return 1 for Shield, 2 for Ragnarok, or 0 for no ready recipe.
execute if score #shield cb_build matches 1 run return 1
execute if score #ragnarok cb_build matches 1 run return 2
return 0
