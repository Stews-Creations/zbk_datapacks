# Core runs this as the builder who opened Map Tools. Only the active map provider shows its dialog.
execute if score #active zbk.template matches 1 run tellraw @a[tag=debug] {"text":"[ZBK Template] authoring_open: showing Map Tools.","color":"gray"}
execute if score #active zbk.template matches 1 run dialog show @s zbk_template:map_tools
