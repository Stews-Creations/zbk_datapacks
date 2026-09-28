# Minecraft load entry point. Set up demo objectives and clear runtime displays before Core registration.
# Core's core_ready event later selects the provider and calls initialize to rebuild from saved markers.
kill @e[type=minecraft:block_display,tag=zbk_template_demo_display]
scoreboard objectives add zbk.template dummy
scoreboard objectives add zbk_template_demo trigger
scoreboard players set #active zbk.template 0
execute unless score #block_start zbk.template matches 0.. run scoreboard players set #block_start zbk.template 0
execute unless score #defer_start zbk.template matches 0.. run scoreboard players set #defer_start zbk.template 0
execute unless score #block_jump_pad zbk.template matches 0.. run scoreboard players set #block_jump_pad zbk.template 0
tellraw @a[tag=debug] {"text":"[ZBK Template] on_load: demo objectives ready; awaiting Core registration.","color":"gray"}
