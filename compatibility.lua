if minetest.get_modpath("default") then
		ingots.register_ingots("default:copper_ingot", "ingot_copper.png")
		ingots.register_ingots("default:tin_ingot", "ingot_tin.png")
		ingots.register_ingots("default:bronze_ingot", "ingot_bronze.png")
		ingots.register_ingots("default:steel_ingot", "ingot_steel.png")
		ingots.register_ingots("default:gold_ingot", "ingot_gold.png")
end

if minetest.get_modpath("moreores") then
		ingots.register_ingots("moreores:silver_ingot", "ingot_silver.png")
		ingots.register_ingots("moreores:mithril_ingot", "ingot_mithril.png")
		if not minetest.registered_items["default:tin_ingot"] then
			ingots.register_ingots("moreores:tin_ingot", "ingot_tin.png")
		end
end

if minetest.get_modpath("technic") then
		ingots.register_ingots("technic:stainless_steel_ingot", "ingot_stainless_steel.png")
		ingots.register_ingots("technic:carbon_steel_ingot", "ingot_carbon_steel.png")
		ingots.register_ingots("technic:mixed_metal_ingot", "ingot_mixed_metal.png")
		ingots.register_ingots("technic:brass_ingot", "ingot_brass.png")
		ingots.register_ingots("technic:lead_ingot", "ingot_lead.png")
		ingots.register_ingots("technic:zinc_ingot", "ingot_zinc.png")
		ingots.register_ingots("technic:chromium_ingot", "ingot_chromium.png")
		ingots.register_ingots("technic:cast_iron_ingot", "ingot_cast_iron.png")
end

if minetest.get_modpath("rainbow_ore") then
		ingots.register_ingots("rainbow_ore:rainbow_ore_ingot", "ingot_rainbow_ore.png")
end

if minetest.get_modpath("mcl_core") then
		ingots.register_ingots("mcl_core:iron_ingot", "ingot_steel.png")
		ingots.register_ingots("mcl_core:gold_ingot", "ingot_gold.png")
end
if minetest.get_modpath("mcl_copper") then
		ingots.register_ingots("mcl_copper:copper_ingot", "ingot_copper.png")
end
if minetest.get_modpath("mcl_nether") then
		ingots.register_ingots("mcl_nether:netherite_ingot", "ingot_netherite.png")
end

if minetest.get_modpath("everness") then
		ingots.register_ingots("everness:pyrite_ingot", "ingot_pyrite.png")
end

if minetest.get_modpath("pigiron") then
		ingots.register_ingots("pigiron:iron_ingot", "ingot_pig_iron.png")
end

if minetest.get_modpath("nether") then
		ingots.register_ingots("nether:nether_ingot", "ingot_nether.png")
end
