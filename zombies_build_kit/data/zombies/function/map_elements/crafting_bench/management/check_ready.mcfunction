# Event-driven: only missing -> ready. Never unlock an already-built recipe.
execute if score #shield cb_build matches 0 if score #plate rs_collected matches 1 if score #mechanism rs_collected matches 1 if score #rocket rs_collected matches 1 run scoreboard players set #shield cb_build 1
execute if score #ragnarok cb_build matches 0 if score #core rag_collected matches 1 if score #prongs rag_collected matches 1 if score #grip rag_collected matches 1 run scoreboard players set #ragnarok cb_build 1
