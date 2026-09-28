execute unless data storage zbk:events stack[-1].context{request:1b} run return 0
data modify storage zbk:events stack[-1].context.blocked set value 1b
