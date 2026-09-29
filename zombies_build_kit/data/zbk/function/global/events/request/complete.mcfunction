# Called inside an extension request with {result}; complete the active operation.
execute unless data storage zbk:events stack[-1].context{request:1b} run return 0
data modify storage zbk:events stack[-1].context.handled set value 1b
$data modify storage zbk:events stack[-1].context.return_value set value $(result)
