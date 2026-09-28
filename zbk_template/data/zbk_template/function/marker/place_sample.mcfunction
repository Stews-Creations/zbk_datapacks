# Called at a player's location by the demo trigger. The marker persists; its display can be rebuilt.
summon minecraft:marker ~ ~ ~ {Tags:["zbk_template_sample"]}
function zbk_template:marker/rebuild
tellraw @a[tag=debug] {"text":"[ZBK Template] marker/place_sample: marker placed and display created.","color":"gray"}
