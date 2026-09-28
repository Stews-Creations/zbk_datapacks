# ===================================
# SPAWN MENU - GIVE BUILD KIT ITEMS
# ===================================
# Gives player an empty book and Build Manager stick

# Give written book with build kit instructions
give @s minecraft:written_book[written_book_content={title:"Build Kit Guide",author:"Zombies",pages:[[{text:"Welcome to the Build Kit!\n\n",color:"dark_purple",bold:true},{text:"This kit contains tools to help you create your custom zombies map.\n\n",color:"black",bold:false},{text:"IMPORTANT:\n",color:"dark_red",bold:true},{text:"You must be in ",color:"black",bold:false},{text:"Creative Mode",color:"gold",bold:true},{text:" to use the Build Manager stick and place map elements.",color:"black",bold:false}],[{text:"Getting Started:\n\n",color:"dark_blue",bold:true},{text:"1. Switch to Creative Mode\n",color:"black",bold:false},{text:"/gamemode creative\n\n",color:"gray",italic:true},{text:"2. Use the Build Manager stick to access building tools\n\n",color:"black",bold:false},{text:"3. Place spawn points, doors, perks, and other elements\n\n",color:"black",bold:false},{text:"4. Test your map by starting the game!",color:"black",bold:false}],[{text:"Tips:\n\n",color:"dark_green",bold:true},{text:"- Set your spawn point first\n\n",color:"black",bold:false},{text:"- Place a worldspawn marker for game over screen\n\n",color:"black",bold:false},{text:"- Use the Build Manager to access all building functions\n\n",color:"black",bold:false},{text:"Good luck building!",color:"dark_purple",italic:true}]]},custom_name=[{text:"Build Kit Guide",italic:false,color:"gold"}]]

# Give Build Manager stick (reuse existing function)
function zbk:build_kit/management/build_manager/give_build_manager

# Feedback message
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Received Build Kit Guide and Build Manager stick!","color":"green"}]
