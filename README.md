Ingots
======
A small mod that makes it possible to place ore ingots in the world.

Settings
=======
Large Ingots
	- makes placed ingot appear much larger, unless a mod hardcodes it
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
is_big*		- Boolean which determines which ingot variant will be used.
node_name*	- Set node name explicitly, instead of deriving it from the ingot_item.
mod_name*	- Attributes ingot nodes to a different mod.
* - optional

If you changed the item name, or maybe the mod from which you are registering ingots
use this to preserve compatibility with old worlds.
"ingots.register_alias(old_name, new_name)"

example: 'ingots.register_alias(moreores:tin_ingot, default:tin_ingot)'
this adds aliases for both small and large ingot variants
