# Core calls this globally every tick. Dispatch only players who used the demo authoring trigger.
# Do not add tick-level tellraw here; place debug output in the triggered action instead.
execute if score #active zbk.template matches 1 as @a[scores={zbk_template_demo=1..}] run function zbk_template:authoring/trigger
