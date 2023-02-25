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

]]--

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

ingots = {}
ingots.large = minetest.settings:get_bool("ingots_large", false)

dofile(modpath .. "/api.lua")

if minetest.settings:get_bool("ingots_content", true) then
	dofile(modpath .. "/compatibility.lua")
end
