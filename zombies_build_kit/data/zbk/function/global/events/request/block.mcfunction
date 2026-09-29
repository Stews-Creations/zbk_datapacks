# Called inside a request listener; denial applies only to the active event frame.
execute unless data storage zbk:events stack[-1].context{request:1b} run return 0
data modify storage zbk:events stack[-1].context.blocked set value 1b
