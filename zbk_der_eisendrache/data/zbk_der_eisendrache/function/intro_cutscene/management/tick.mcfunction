# Wait until the generated video player has finished or has been stopped.
execute if score #de_intro_on zbk_video matches 1 run return 0
function zbk_der_eisendrache:intro_cutscene/management/finish
