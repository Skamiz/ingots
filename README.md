Ingots
======
A small mod that makes it possible to place ore ingots in the world.

Settings
=======
Large Ingots
	- makes placed ingot appear much larger
	- shouldn't be changed after ingots have been placed down or they will be lost
Compatibility Content
	- automatically try to register placebel ingots for several mods
	- disable if you want to use the API without the content


API
===
You can ragister your own ingots.
Call "ingots.register_ingots(ingot_item, texture, is_big)"
ingot_item 	- The item which will be consumed to place an ingot. ex.: "default:steel_ingot"
texture 	- Name of texture used on ingot mesh. ex.: "ingot_steel.png"
is_big 		- Boolean which determines which ingot variant will be used.
