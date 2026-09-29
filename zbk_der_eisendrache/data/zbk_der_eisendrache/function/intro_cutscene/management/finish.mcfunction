# The tick event may finish the video, but the base pack start resumes outside that event.
execute unless score #active zbk.de matches 1 run return 0
execute unless data storage zbk_der_eisendrache:state start{owner:"zbk_der_eisendrache"} run return 0
execute if data storage zbk_der_eisendrache:state start{resume_queued:1b} run return 0
function zbk_der_eisendrache:intro_cutscene/management/stop
data modify storage zbk_der_eisendrache:state start.resume_queued set value 1b
schedule function zbk_der_eisendrache:intro_cutscene/management/resume_deferred 1t replace
