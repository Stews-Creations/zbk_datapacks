# Core calls this once per builder per tick, as that player. Keep frequent work cheap and chat silent.
# Re-enable the demo trigger so the dialog button can place a marker again.
execute if score #active zbk.template matches 1 run scoreboard players enable @s zbk_template_demo
