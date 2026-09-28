# circle_effect.mcfunction

# Create a vertical circle of green particles, rotated to show the opening
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^ ^0.5 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^0.35355 ^0.35355 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^0.5 ^ ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^0.35355 ^-0.35355 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^ ^-0.5 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^-0.35355 ^-0.35355 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^-0.5 ^ ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^-0.35355 ^0.35355 ^ 0 0 0 0 1 force

# Optional: denser circle
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^0.46194 ^0.19134 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^0.19134 ^0.46194 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^-0.19134 ^0.46194 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^-0.46194 ^0.19134 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^-0.46194 ^-0.19134 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^-0.19134 ^-0.46194 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^0.19134 ^-0.46194 ^ 0 0 0 0 1 force
particle minecraft:dust{color:[0.0,1.0,0.0],scale:1.0} ^0.46194 ^-0.19134 ^ 0 0 0 0 1 force
