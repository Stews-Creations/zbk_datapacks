# Report immunity tags on the executing mob to the nearest builder.

tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":"[Mob Immunity] ","color":"gold"},{"text":"Target: ","color":"gray"},{"selector":"@s","color":"yellow"}]
execute if entity @s[tag=immune_guns] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Guns: ","color":"gray"},{"text":"Immune","color":"red"}]
execute unless entity @s[tag=immune_guns] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Guns: ","color":"gray"},{"text":"Can be hit","color":"green"}]
execute if entity @s[tag=immune_explosives] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Explosives: ","color":"gray"},{"text":"Immune","color":"red"}]
execute unless entity @s[tag=immune_explosives] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Explosives: ","color":"gray"},{"text":"Can be hit","color":"green"}]
execute if entity @s[tag=immune_elements] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Elements: ","color":"gray"},{"text":"Immune","color":"red"}]
execute unless entity @s[tag=immune_elements] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Elements: ","color":"gray"},{"text":"Can be hit","color":"green"}]
execute if entity @s[tag=immune_nuke] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Nuke: ","color":"gray"},{"text":"Immune","color":"red"}]
execute unless entity @s[tag=immune_nuke] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Nuke: ","color":"gray"},{"text":"Can be hit","color":"green"}]
execute if entity @s[tag=immune_melee] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Melee: ","color":"gray"},{"text":"Immune","color":"red"}]
execute unless entity @s[tag=immune_melee] run tellraw @p[tag=mob_immunity_tool_user,distance=..8,sort=nearest,limit=1] [{"text":" - Melee: ","color":"gray"},{"text":"Can be hit","color":"green"}]
