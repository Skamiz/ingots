--[[
	Ingots - allows the placemant of ingots in the world
	Copyright (C) 2018  Skamiz Kazzarch

	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

	TODO: add tooltip to ingot item description indicating that they can be placed
]]--

-- ingot_item 	- The item which will be consumed to place an ingot. ex.: "default:steel_ingot"
-- texture 		- Name of texture used on ingot mesh. ex.: "ingot_steel.png"
-- is_big*		- Boolean which determines which ingot variant will be used.
-- node_name*	- Set node name explicity, instead of deriving it from the ingot_item.
-- mod_name*	- Attributes new nodes to a different mod.
function ingots.register_ingots(ingot_item, texture, is_big, node_name_override, mod_name_override)
	--checks, whether the item name is a valid item (thanks 'puzzlecube')
	if not minetest.registered_items[ingot_item] then
		minetest.log("warning", ingot_item.." is not registered. Skipping ingot registration")
		return
	end

	-- if not set explicitly use global mod setting
	if is_big == nil then
		is_big = ingots.large
	end

	-- de hardcoded modname, which allows the api to be properly used from within other mods (thanks 'argyle')
	local mod_name = mod_name_override or minetest.get_current_modname()
	--gets item name witout mod part, to be used in the definition of the new nodes
	local ingot_name = node_name_override or ingot_item:match(":(.+)$")

	local stack_size = 64
	local mesh_prefix = "ingot_"

	if is_big then
		ingot_name = ingot_name .. "_big"
		stack_size = 8
		mesh_prefix = "ingot_big_"
	end

	local node_name = mod_name .. ":" .. ingot_name .. "_"


	--this way there is no need for a separate on_punch function for a stack of 1 ingot
	minetest.register_alias(node_name .."0", "air")

	--gives the ingot_item the ability to be placed and increase already placed stacks of ingots
	minetest.override_item(ingot_item, {
		on_place = function (itemstack, placer, pointed_thing)
			local player_name = placer:get_player_name()
            local pos = pointed_thing.above
            if minetest.is_protected(pos, player_name) then
			    return
		    end
			local under_node = minetest.get_node(pointed_thing.under)
			local under_name = under_node.name
			local under_def = minetest.registered_nodes[under_name]

			if under_def and under_def._ingot_count and under_def._ingot_count < stack_size then
				minetest.set_node(pointed_thing.under, {name = node_name .. under_def._ingot_count + 1, param2 = under_node.param2})
				if not minetest.is_creative_enabled(player_name) then
					itemstack:take_item()
				end
			else
				local _, pos = minetest.item_place(ItemStack(node_name .. "1"), placer, pointed_thing)
				if pos and not minetest.is_creative_enabled(player_name)then
					itemstack:take_item()
				end
			end

			return itemstack
		end
	})

	--registers 'stack_size' number of nodes, each has one more ingot in it than the last
	for i = 1, stack_size do
		local box = {
					type = "fixed",
					fixed = {
						--rectangular box which encompases all placed ingots
						ingots.get_box(is_big, i),
					},
				}
		minetest.register_node(":" .. node_name .. i,{
			description = "ingots",
			drawtype = "mesh",
			tiles = {texture},
			mesh = mesh_prefix .. i .. ".obj",
			selection_box = box,
			collision_box = box,
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky = 3, level = 2, not_in_creative_inventory = 1},
			drop = ingot_item .. " " .. i,
			on_punch = function (pos, node, puncher, pointed_thing)
				if not puncher then return end
				local player_name = puncher:get_player_name()
				local wield = puncher:get_wielded_item()

				if minetest.is_protected(pos, player_name) then
					return
				end

				--checks, so that a stack can be taken appart only by hand or relevant ingot_item
				if wield:get_name() == ingot_item or wield:get_count() == 0 then
					minetest.set_node(pos, {name = node_name .. i - 1, param2 = node.param2})
					if not minetest.is_creative_enabled(player_name) then
						local stack = ItemStack(ingot_item)
						puncher:get_inventory():add_item("main", stack)
					end
				end
			end,
			_ingot_count = i,
		})
	end
end

--returns an apropriate nodebox for a given number of ingots
function ingots.get_box(is_big, i)
	if is_big then
		return {-0.5, -0.5, -0.5, 0.5, (((i + 1 - ((i +1 )%2)) / 8) - 0.5), 0.5}
	else
		return {-0.5, -0.5, -0.5, 0.5, (((i - 1 - ((i-1)%8)) / 8) - 3) / 8, 0.5}
	end
end

function ingots.register_alias(old_name, new_name)
	for i = 1, 64 do
		minetest.register_alias(old_name .. "_" .. i, new_name  .. "_" .. i)
	end
	for i = 1, 8 do
		minetest.register_alias(old_name .. "_big_" .. i, new_name  .. "_big_" .. i)
	end
end
