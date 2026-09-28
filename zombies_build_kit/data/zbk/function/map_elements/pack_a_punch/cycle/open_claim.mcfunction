# Context: owning machine at its position after tick 120.
# Unlock the gun and update its prompt together, after the emergence animation finishes.

tag @s remove pap_busy
tag @s add pap_claim_ready
execute as @e[type=text_display,distance=..3,tag=pack_a_punch_purchase_text,limit=1,sort=nearest] run data modify entity @s text set value [{"text":"Claim Gun","color":"gold","bold":true}]
function zbk:dispatch/extension/map_elements/pack_a_punch/cycle/open_claim/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
