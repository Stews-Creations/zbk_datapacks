# Baked visual source: blockbench/static_props/source/tram.json.
# Preserve the original invisible route-controller origin and its gameplay selectors.
# Cancel the item renderer's Y half-turn so geometry extends from the original block-display anchor.
# The model floor extends slightly below that origin; leave visual culling disabled.
summon minecraft:block_display ~ ~ ~ {view_range:0.5f,Tags:["tram"],block_state:{Name:"minecraft:air"},Passengers:[{id:"minecraft:item_display",view_range:0.5f,Tags:["tram_body"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:props/tram/tram"}},item_display:"none",width:0f,height:0f,transformation:{translation:[0f,0f,0f],scale:[8f,8f,8f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,1f,0f,0f]}}]}
