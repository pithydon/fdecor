fdecor = {}
local creative = minetest.setting_getbool("creative_mode")
local modpath = minetest.get_modpath("fdecor")

-- index {
--  sound
--  register nodes
--  ABMs
--  register crafts
--  mapgen
-- }

-- sound
function fdecor.node_sound_crunchy_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_wood_footstep", gain = 0.5}
	table.dug = table.dug or
			{name = "fdecor_crunch", gain = 0.5}
	default.node_sound_defaults(table)
	return table
end

-- register nodes
for _,v in ipairs({{"blue", "Blue"}, {"marble", "Marble"}, {"white", "White"}, {"swiss", "Swiss"}, {"cheddar", "Cheddar"}}) do
	minetest.register_node("fdecor:"..v[1].."_cheese", {
		description = v[2].." Cheese Block",
		drawtype = "normal",
		tiles = {"fdecor_"..v[1].."_cheese.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
		sounds = default.node_sound_defaults()
	})

	walls.register("fdecor:"..v[1].."_cheese_wall", v[2].." Cheese Wall", "fdecor_"..v[1].."_cheese.png",
			"fdecor:"..v[1].."_cheese", default.node_sound_defaults())

	stairs.register_stair_and_slab(v[1].."_cheese", "fdecor:"..v[1].."_cheese", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
			{"fdecor_"..v[1].."_cheese.png"}, v[2].." Cheese Stairs", v[2].." Cheese Slab", default.node_sound_defaults())
end

for _,v in ipairs({{"milk", "Milk"}, {"dark", "Dark"}, {"white", "White"}}) do
	minetest.register_node("fdecor:"..v[1].."_chocolate", {
		description = v[2].." Chocolate Block",
		drawtype = "normal",
		tiles = {"fdecor_"..v[1].."_chocolate.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults()
	})

	minetest.register_node("fdecor:"..v[1].."_chocolate_brick", {
		description = v[2].." Chocolate Brick",
		drawtype = "normal",
		tiles = {"fdecor_"..v[1].."_chocolate_brick.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults()
	})

	doors.register_door("fdecor:"..v[1].."_chocolate_door", {
		description = v[2].." Chocolate Door",
		inventory_image = "fdecor_"..v[1].."_chocolate_door_inv.png",
		tiles = {"fdecor_"..v[1].."_chocolate_door.png"},
		recipe = {
			{"fdecor:"..v[1].."_chocolate", "fdecor:"..v[1].."_chocolate"},
			{"fdecor:"..v[1].."_chocolate", "fdecor:"..v[1].."_chocolate"},
			{"fdecor:"..v[1].."_chocolate", "fdecor:"..v[1].."_chocolate"}
		},
		groups = {oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults(),
		protected = false
	})

	doors.register_trapdoor("fdecor:"..v[1].."_chocolate_trapdoor", {
		description = v[2].." Chocolate Trapdoor",
		inventory_image = "fdecor_"..v[1].."_chocolate_trapdoor.png",
		tile_front = "fdecor_"..v[1].."_chocolate_trapdoor.png",
		tile_side = "fdecor_"..v[1].."_chocolate.png",
		groups = {oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults(),
		protected = false
	})

	walls.register("fdecor:"..v[1].."_chocolate_wall", v[2].." Chocolate Wall", "fdecor_"..v[1].."_chocolate.png",
			"fdecor:"..v[1].."_chocolate", default.node_sound_stone_defaults())

	stairs.register_stair_and_slab(v[1].."_chocolate", "fdecor:"..v[1].."_chocolate", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
			{"fdecor_"..v[1].."_chocolate.png"}, v[2].." Chocolate Stairs", v[2].." Chocolate Slab", default.node_sound_stone_defaults())

	stairs.register_stair_and_slab(v[1].."_chocolate_brick", "fdecor:"..v[1].."_chocolate_brick", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
			{"fdecor_"..v[1].."_chocolate_brick.png"}, v[2].." Chocolate Brick Stairs", v[2].." Chocolate Brick Slab", default.node_sound_stone_defaults())
end

minetest.register_node("fdecor:apple", {
	description = "Apple Block",
	drawtype = "normal",
	tiles = {"fdecor_apple_top.png", "fdecor_apple_bottom.png", "fdecor_apple_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 3, falling_hanging_node = 1},
	sounds = fdecor.node_sound_crunchy_defaults()
})

minetest.register_node("fdecor:apple_sauce", {
	description = "Apple Sauce Block",
	drawtype = "normal",
	tiles = {"fdecor_apple_sauce.png"},
	groups = {food = 1, crumbly = 3, oddly_breakable_by_hand = 3, explody = 1, falling_node = 1}
})

minetest.register_node("fdecor:pumpkin", {
	description = "Pumpkin",
	drawtype = "normal",
	tiles = {"fdecor_pumpkin_top.png", "fdecor_pumpkin_bottom.png", "fdecor_pumpkin_side.png"},
	groups = {food = 1, snappy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults({
		dig = {name = "default_dig_oddly_breakable_by_hand"},
		dug = {name = "default_dig_choppy"}
	})
})

minetest.register_node("fdecor:unlit_jackolantern", {
	description = "Unlit Jack O Lantern",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_pumpkin_top.png", "fdecor_pumpkin_bottom.png", "fdecor_pumpkin_side.png",
			"fdecor_pumpkin_side.png", "fdecor_pumpkin_side.png", "fdecor_pumpkin_jackolantern.png"},
	groups = {snappy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults({
		dig = {name = "default_dig_oddly_breakable_by_hand"},
		dug = {name = "default_dig_choppy"}
	}),
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local player_name = clicker:get_player_name()
		if itemstack:get_name() == "default:torch" and not minetest.is_protected(pos, player_name) then
			minetest.log("action", player_name.." places torch in a Jack O Lantern at "..minetest.pos_to_string(pos))
			minetest.swap_node(pos, {name = "fdecor:jackolantern", param2 = node.param2})
			if not creative then
				itemstack:take_item()
				return itemstack
			end
		end
	end
})

minetest.register_node("fdecor:jackolantern", {
	description = "Jack O Lantern",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_pumpkin_top.png", "fdecor_pumpkin_bottom.png", "fdecor_pumpkin_side.png", "fdecor_pumpkin_side.png", "fdecor_pumpkin_side.png",
			{name = "fdecor_pumpkin_jackolantern_anim.png", animation = { type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.2}}},
	light_source = 12,
	drop = "fdecor:unlit_jackolantern",
	groups = {snappy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults({
		dig = {name = "default_dig_oddly_breakable_by_hand"},
		dug = {name = "default_dig_choppy"}
	})
})

minetest.register_node("fdecor:coconut", {
	description = "Coconut Block",
	drawtype = "normal",
	tiles = {"fdecor_coconut_top.png", "fdecor_coconut.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 2, float = 1, falling_hanging_node = 1, falling_kill_node = 1},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("fdecor:banana", {
	description = "Banana Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_banana_top.png", "fdecor_banana_top.png^[transformFY", "fdecor_banana_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 3},
	on_place = minetest.rotate_node,
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:red_banana", {
	description = "Red Banana Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_red_banana_top.png", "fdecor_red_banana_top.png^[transformFY", "fdecor_red_banana_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 3},
	on_place = minetest.rotate_node,
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:banana_mash", {
	description = "Banana Mash",
	drawtype = "normal",
	tiles = {"fdecor_banana_mash.png"},
	groups = {food = 1, crumbly = 3, oddly_breakable_by_hand = 3, explody = 1, falling_node = 1}
})

minetest.register_node("fdecor:royal_banana", {
	description = "Inedible Royal Banana Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_royal_banana_top.png", "fdecor_royal_banana_top.png^[transformFY", "fdecor_royal_banana_side.png"},
	groups = {oddly_breakable_by_hand = 2, choppy = 3, snappy = 3, not_in_creative_inventory = 1},
	on_place = minetest.rotate_node,
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:bread", {
	description = "Bread Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_bread_top.png", "fdecor_bread_bottom.png", "fdecor_bread_side.png", "fdecor_bread_side.png", "fdecor_bread_slice.png"},
	groups = {food = 1, oddly_breakable_by_hand = 3, choppy = 3, snappy = 2, flammable = 3},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:strawberry", {
	description = "Strawberry Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_strawberry_top.png", "fdecor_strawberry_bottom.png", "fdecor_strawberry_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 3, choppy = 3, snappy = 3},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:carrot", {
	description = "Carrot Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_carrot_top.png", "fdecor_carrot_top.png", "fdecor_carrot_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, choppy = 2},
	on_place = minetest.rotate_node,
	sounds = fdecor.node_sound_crunchy_defaults()
})

minetest.register_node("fdecor:carrot_leaves", {
	description = "Carrot Leaves Block",
	drawtype = "firelike",
	paramtype = "light",
	walkable = false,
	inventory_image = "fdecor_carrot_leaves.png",
	wield_image = "fdecor_carrot_leaves.png",
	tiles = {"fdecor_carrot_leaves.png"},
	groups = {food = 1, snappy = 3, flammable = 2},
	sounds = default.node_sound_leaves_defaults()
})

minetest.register_node("fdecor:broccoli_sapling", {
	description = "Broccoli Sapling",
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "fdecor_broccoli_sapling.png",
	tiles = {"fdecor_broccoli_sapling.png"},
	selection_box = {
		type = "fixed",
		fixed = {{-0.3125, -0.5, -0.3125, 0.3125, 0.375, 0.3125}}
	},
	groups = {food = 1, oddly_breakable_by_hand = 3, choppy = 3, snappy = 3},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_defaults(),
	walkable = false
})

minetest.register_node("fdecor:broccoli_stalk", {
	description = "Broccoli Stalk Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_broccoli_top.png", "fdecor_broccoli_top.png", "fdecor_broccoli_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 1},
	on_place = minetest.rotate_node,
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:broccoli_flower", {
	description = "Broccoli Flower Block",
	drawtype = "normal",
	tiles = {"fdecor_broccoli_flower.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"fdecor:broccoli_sapling"}, rarity = 12},
			{items = {"fdecor:broccoli_flower"}}
		}
	},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:cauliflower_sapling", {
	description = "Cauliflower Sapling",
	drawtype = "plantlike",
	paramtype = "light",
	inventory_image = "fdecor_cauliflower_sapling.png",
	tiles = {"fdecor_cauliflower_sapling.png"},
	selection_box = {
		type = "fixed",
		fixed = {{-0.3125, -0.5, -0.3125, 0.3125, 0.375, 0.3125}}
	},
	groups = {food = 1, oddly_breakable_by_hand = 3, choppy = 3, snappy = 3},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_defaults(),
	walkable = false
})

minetest.register_node("fdecor:cauliflower_stalk", {
	description = "Cauliflower Stalk Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_cauliflower_top.png", "fdecor_cauliflower_top.png", "fdecor_cauliflower_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 1},
	on_place = minetest.rotate_node,
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:cauliflower_flower", {
	description = "Cauliflower Flower Block",
	drawtype = "normal",
	tiles = {"fdecor_cauliflower_flower.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"fdecor:cauliflower_sapling"}, rarity = 12},
			{items = {"fdecor:cauliflower_flower"}}
		}
	},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:purple_cauliflower", {
	description = "Purple Cauliflower Block",
	drawtype = "normal",
	tiles = {"fdecor_purple_cauliflower.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 3},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:celery", {
	description = "Celery Block",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, 0.125, 0.1875, 0.5, 0.5},
			{-0.5, -0.5, -0.25, -0.1875, 0.5, 0.5},
			{0.1875, -0.5, -0.25, 0.5, 0.5, 0.5}
		}
	},
	tiles = {"fdecor_celery_top.png", "fdecor_celery_top.png^[transformFY", "fdecor_celery_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 1, choppy = 3},
	on_place = minetest.rotate_node,
	sounds = fdecor.node_sound_crunchy_defaults()
})

minetest.register_node("fdecor:celery_with_peanut_butter", {
	description = "Celery with Peanut Butter Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_celery_top.png", "fdecor_celery_top.png^[transformFY", "fdecor_celery_with_peanut_butter_side.png^[transformFX",
			"fdecor_celery_with_peanut_butter_side.png", "fdecor_celery_side.png", "fdecor_peanut_butter.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 1, choppy = 3},
	on_place = minetest.rotate_node,
	sounds = fdecor.node_sound_crunchy_defaults()
})

minetest.register_node("fdecor:rhubarb", {
	description = "Rhubarb Block",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, 0.125, 0.1875, 0.5, 0.5},
			{-0.5, -0.5, -0.25, -0.1875, 0.5, 0.5},
			{0.1875, -0.5, -0.25, 0.5, 0.5, 0.5}
		}
	},
	tiles = {"fdecor_rhubarb_top.png", "fdecor_rhubarb_top.png^[transformFY", "fdecor_rhubarb_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 1, choppy = 3},
	on_place = minetest.rotate_node,
	sounds = fdecor.node_sound_crunchy_defaults()
})

minetest.register_node("fdecor:peanut_butter", {
	description = "Peanut Butter Block",
	drawtype = "normal",
	tiles = {"fdecor_peanut_butter.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, crumbly = 1, disable_jump = 1}
})

minetest.register_node("fdecor:potato", {
	description = "Potato Block",
	drawtype = "normal",
	tiles = {"fdecor_potato.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 2}
})

minetest.register_node("fdecor:mashed_potatoes", {
	description = "Mashed Potatoes Block",
	drawtype = "normal",
	tiles = {"fdecor_mashed_potatoes.png"},
	groups = {food = 1, oddly_breakable_by_hand = 3, crumbly = 3, falling_sticky_node = 2}
})

minetest.register_node("fdecor:potato_brick", {
	description = "Potato Brick",
	drawtype = "normal",
	tiles = {"fdecor_potato_brick.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 2}
})

minetest.register_node("fdecor:mushroom_stipe", {
	description = "Mushroom Stipe",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}
	},
	tiles = {"fdecor_mushroom_stipe.png"},
	groups = {food = 1, oddly_breakable_by_hand = 3, snappy = 3}
})

minetest.register_node("fdecor:white_mushroom", {
	description = "White Mushroom Block",
	drawtype = "normal",
	tiles = {"fdecor_white_mushroom_top.png", "fdecor_white_mushroom_bottom.png", "fdecor_white_mushroom_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 3, snappy = 3}
})

minetest.register_node("fdecor:brown_mushroom", {
	description = "Brown Mushroom Block",
	drawtype = "normal",
	tiles = {"fdecor_brown_mushroom_top.png", "fdecor_brown_mushroom_bottom.png", "fdecor_brown_mushroom_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 3, snappy = 3}
})

minetest.register_node("fdecor:red_mushroom", {
	description = "Red Mushroom Block",
	drawtype = "normal",
	tiles = {"fdecor_red_mushroom_top.png", "fdecor_red_mushroom_bottom.png", "fdecor_red_mushroom_side.png"},
	groups = {oddly_breakable_by_hand = 3, snappy = 3}
})

minetest.register_node("fdecor:orange_mushroom", {
	description = "Orange Mushroom Block",
	drawtype = "normal",
	tiles = {"fdecor_orange_mushroom_top.png", "fdecor_orange_mushroom_bottom.png", "fdecor_orange_mushroom_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 3, snappy = 3}
})

default.register_fence("fdecor:french_fries", {
	description = "French Fries",
	texture = "fdecor_french_fries.png",
	inventory_image = "fdecor_french_fries_inv.png",
	wield_image = "fdecor_french_fries_inv.png",
	material = "fdecor:potato",
	groups = {food = 1, oddly_breakable_by_hand = 3, choppy = 3}
})

beds.register_bed("fdecor:banana_bed", {
	description = "Banana Bed",
	inventory_image = "fdecor_banana_bed_inv.png",
	wield_image = "fdecor_banana_bed_inv.png",
	tiles = {
		bottom = {
			"fdecor_banana_bed_top.png^[transformFY",
			"fdecor_banana_side.png",
			"fdecor_banana_bed_side.png"
		},
		top = {
			"fdecor_banana_bed_top.png",
			"fdecor_banana_side.png",
			"fdecor_banana_bed_side.png"
		}
	},
	nodebox = {
		bottom = {{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, {-0.4375, -0.1875, -0.4375, 0.4375, 0.0625, 0.5}},
		top = {{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, {-0.4375, -0.1875, -0.5, 0.4375, 0.0625, 0.4375}},
	},
	selectionbox = {{-0.5, -0.5, -0.5, 0.5, -0.1875, 1.5}, {-0.4375, -0.1875, -0.4375, 0.4375, 0.0625, 1.4375}},
	recipe = {
		{"fdecor:banana_mash", "fdecor:banana_mash", "fdecor:banana_mash"},
		{"fdecor:banana", "fdecor:banana", "fdecor:banana"}
	},
})

beds.register_bed("fdecor:red_banana_bed", {
	description = "Red Banana Bed",
	inventory_image = "fdecor_red_banana_bed_inv.png",
	wield_image = "fdecor_red_banana_bed_inv.png",
	tiles = {
		bottom = {
			"fdecor_red_banana_bed_top.png^[transformFY",
			"fdecor_red_banana_side.png",
			"fdecor_red_banana_bed_side.png"
		},
		top = {
			"fdecor_red_banana_bed_top.png",
			"fdecor_red_banana_side.png",
			"fdecor_red_banana_bed_side.png"
		}
	},
	nodebox = {
		bottom = {{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, {-0.4375, -0.1875, -0.4375, 0.4375, 0.0625, 0.5}},
		top = {{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, {-0.4375, -0.1875, -0.5, 0.4375, 0.0625, 0.4375}},
	},
	selectionbox = {{-0.5, -0.5, -0.5, 0.5, -0.1875, 1.5}, {-0.4375, -0.1875, -0.4375, 0.4375, 0.0625, 1.4375}},
	recipe = {
		{"fdecor:banana_mash", "fdecor:banana_mash", "fdecor:banana_mash"},
		{"fdecor:red_banana", "fdecor:red_banana", "fdecor:red_banana"}
	},
})

xpanes.register_pane("swiss_cheese_pane", {
	description = "Swiss Cheese Pane",
	textures = {"fdecor_swiss_cheese_alpha.png","fdecor_swiss_cheese_alpha.png","fdecor_swiss_cheese.png"},
	inventory_image = "fdecor_swiss_cheese_alpha.png",
	wield_image = "fdecor_swiss_cheese_alpha.png",
	sounds = default.node_sound_defaults(),
	groups = {food = 1, cracky = 3, choppy = 3, snappy = 3, oddly_breakable_by_hand = 3, pane = 1},
	recipe = {
		{"fdecor:swiss_cheese", "", ""},
		{"", "fdecor:swiss_cheese", "fdecor:swiss_cheese"},
		{"fdecor:swiss_cheese", "fdecor:swiss_cheese", "fdecor:swiss_cheese"}
	}
})

stairs.register_slab("banana", "fdecor:banana", {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 3},
		{"fdecor_banana_top.png", "fdecor_banana_top.png^[transformFY", "fdecor_banana_side.png"},
		"Banana Slab", default.node_sound_defaults())

stairs.register_stair("banana", "fdecor:banana", {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 3},
		{"fdecor_banana_top.png", "fdecor_banana_top.png^[transformFY", "fdecor_banana_side.png",
		"fdecor_banana_side.png", "fdecor_banana_side.png", "fdecor_banana_stair.png"},
		"Banana Stair", default.node_sound_defaults())

stairs.register_slab("red_banana", "fdecor:red_banana", {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 3},
		{"fdecor_red_banana_top.png", "fdecor_red_banana_top.png^[transformFY", "fdecor_red_banana_side.png"},
		"Red Banana Slab", default.node_sound_defaults())

stairs.register_stair("red_banana", "fdecor:red_banana", {food = 1, oddly_breakable_by_hand = 2, choppy = 3, snappy = 3},
		{"fdecor_red_banana_top.png", "fdecor_red_banana_top.png^[transformFY", "fdecor_red_banana_side.png",
		"fdecor_red_banana_side.png", "fdecor_red_banana_side.png", "fdecor_red_banana_stair.png"},
		"Red Banana Stair", default.node_sound_defaults())

stairs.register_slab("bread", "fdecor:bread", {food = 1, oddly_breakable_by_hand = 3, choppy = 3, snappy = 2, flammable = 3},
		{"fdecor_bread_slice.png", "fdecor_bread_slice.png", "fdecor_bread_side.png^[transformR270", "fdecor_bread_side.png^[transformR90", "fdecor_bread_top.png", "fdecor_bread_bottom.png"},
		"Bread Slab", default.node_sound_defaults())

stairs.register_stair("bread", "fdecor:bread", {food = 1, oddly_breakable_by_hand = 3, choppy = 3, snappy = 2, flammable = 3},
		{"fdecor_bread_stair.png", "fdecor_bread_bottom.png", "fdecor_bread_side.png", "fdecor_bread_side.png", "fdecor_bread_slice.png"},
		"Bread Stair", default.node_sound_defaults())

stairs.register_stair_and_slab("peanut_butter", "fdecor:peanut_butter", {food = 1, oddly_breakable_by_hand = 1, crumbly = 1, disable_jump = 1},
		{"fdecor_peanut_butter.png"}, "Peanut Butter Stairs", "Peanut Butter Slab")

stairs.register_stair_and_slab("mashed_potatoes", "fdecor:mashed_potatoes", {food = 1, oddly_breakable_by_hand = 3, crumbly = 3, falling_sticky_node = 1},
		{"fdecor_mashed_potatoes.png"}, "Mashed Potatoes Stairs", "Mashed Potatoes Slab")

stairs.register_stair_and_slab("potato_brick", "fdecor:potato_brick", {food = 1, oddly_breakable_by_hand = 2, choppy = 2},
		{"fdecor_potato_brick.png"}, "Potato Brick Stairs", "Potato Brick Slab")

if minetest.get_modpath("flowerpots") then
	flowerpots.add_plant(1, "broccoli", "Broccoli", "fdecor:broccoli_sapling", "fdecor_broccoli_sapling.png")
	flowerpots.add_plant(1, "cauliflower", "Cauliflower", "fdecor:cauliflower_sapling", "fdecor_cauliflower_sapling.png")
	flowerpots.add_plant(7, "potato", "Potato", "fdecor:potato", "fdecor_potato.png")
	flowerpots.add_plant(7, "mushroom_stipe", "Mushroom Stipe", "fdecor:mushroom_stipe", "fdecor_mushroom_stipe.png")
end

if minetest.get_modpath("furniture") then
	furniture.register_wooden("fdecor:french_fries", {groups = {food = 1, oddly_breakable_by_hand = 3, choppy = 3}, stick = "fdecor:french_fries"})
	furniture.register_stone("fdecor:blue_cheese", {})
	furniture.register_stone("fdecor:marble_cheese", {})
	furniture.register_stone("fdecor:white_cheese", {})
	furniture.register_stone("fdecor:swiss_cheese", {})
	furniture.register_stone("fdecor:cheddar_cheese", {})
	furniture.register_stone("fdecor:milk_chocolate", {})
	furniture.register_stone("fdecor:dark_chocolate", {})
	furniture.register_stone("fdecor:white_chocolate", {})
	furniture.register_wool("fdecor:potato", {handle_crafts = false})

	minetest.register_craft({
		output = "furniture:chair_potato",
		recipe = {
			{"fdecor:potato", "", "fdecor:potato"},
			{"fdecor:potato", "fdecor:potato", "fdecor:potato"},
			{"fdecor:potato", "fdecor:potato", "fdecor:potato"}
		}
	})

	minetest.register_craft({
		output = "furniture:stool_potato",
		recipe = {
			{"fdecor:potato", "fdecor:potato", "fdecor:potato"},
			{"fdecor:potato", "fdecor:potato", "fdecor:potato"}
		}
	})
end

-- ABMs
minetest.register_abm({
	nodenames = {"fdecor:broccoli_sapling"},
	interval = 10,
	chance = 50,
	action = function(pos, node)
		if default.can_grow(pos) then
			minetest.log("action", "A broccoli sapling grows into a broccoli tree at "..minetest.pos_to_string(pos))
			minetest.place_schematic({x = pos.x - 1, y = pos.y, z = pos.z - 1}, modpath.."/schematics/broccoli.mts", "0", nil, false)
		end
	end
})

minetest.register_abm({
	nodenames = {"fdecor:cauliflower_sapling"},
	interval = 10,
	chance = 50,
	action = function(pos, node)
		if default.can_grow(pos) then
			minetest.log("action", "A cauliflower sapling grows into a cauliflower tree at "..minetest.pos_to_string(pos))
			if math.random(25) == 1 then
				minetest.place_schematic({x = pos.x - 1, y = pos.y, z = pos.z - 1}, modpath.."/schematics/purple_cauliflower.mts", "0", nil, false)
			else
				minetest.place_schematic({x = pos.x - 1, y = pos.y, z = pos.z - 1}, modpath.."/schematics/cauliflower.mts", "0", nil, false)
			end
		end
	end
})

-- register crafts
minetest.register_craft({
	type = "shapeless",
	output = "fdecor:apple_sauce",
	recipe = {"default:stone", "fdecor:apple"},
	replacements = {
		{"default:stone", "default:stone"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "fdecor:banana_mash",
	recipe = {"default:stone", "fdecor:banana"},
	replacements = {
		{"default:stone", "default:stone"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "fdecor:banana_mash",
	recipe = {"default:stone", "fdecor:red_banana"},
	replacements = {
		{"default:stone", "default:stone"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "fdecor:celery_with_peanut_butter",
	recipe = {"fdecor:celery", "fdecor:peanut_butter"}
})

minetest.register_craft({
	type = "shapeless",
	output = "fdecor:mashed_potatoes",
	recipe = {"default:stone", "fdecor:potato"},
	replacements = {
		{"default:stone", "default:stone"}
	}
})

minetest.register_craft({
	output = "fdecor:potato_brick 4",
	recipe = {
		{"fdecor:potato", "fdecor:potato"},
		{"fdecor:potato", "fdecor:potato"}
	}
})

minetest.register_craft({
	output = "fdecor:milk_chocolate_brick 5",
	recipe = {
		{"", "fdecor:milk_chocolate", "fdecor:milk_chocolate"},
		{"fdecor:white_chocolate", "fdecor:milk_chocolate", "fdecor:milk_chocolate"}
	}
})

minetest.register_craft({
	output = "fdecor:milk_chocolate_brick 5",
	recipe = {
		{"fdecor:milk_chocolate", "fdecor:milk_chocolate", ""},
		{"fdecor:milk_chocolate", "fdecor:milk_chocolate", "fdecor:white_chocolate"}
	}
})

minetest.register_craft({
	output = "fdecor:dark_chocolate_brick 5",
	recipe = {
		{"", "fdecor:dark_chocolate", "fdecor:dark_chocolate"},
		{"fdecor:white_chocolate", "fdecor:dark_chocolate", "fdecor:dark_chocolate"}
	}
})

minetest.register_craft({
	output = "fdecor:dark_chocolate_brick 5",
	recipe = {
		{"fdecor:dark_chocolate", "fdecor:dark_chocolate", ""},
		{"fdecor:dark_chocolate", "fdecor:dark_chocolate", "fdecor:white_chocolate"}
	}
})

minetest.register_craft({
	output = "fdecor:white_chocolate_brick 5",
	recipe = {
		{"", "fdecor:white_chocolate", "fdecor:white_chocolate"},
		{"fdecor:milk_chocolate", "fdecor:white_chocolate", "fdecor:white_chocolate"}
	}
})

minetest.register_craft({
	output = "fdecor:white_chocolate_brick 5",
	recipe = {
		{"fdecor:white_chocolate", "fdecor:white_chocolate", ""},
		{"fdecor:white_chocolate", "fdecor:white_chocolate", "fdecor:milk_chocolate"}
	}
})

minetest.register_craft({
	output = "fdecor:apple",
	recipe = {
		{"default:apple", "default:apple", "default:apple"},
		{"default:apple", "default:apple", "default:apple"},
		{"default:apple", "default:apple", "default:apple"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:apple 9",
	recipe = {"fdecor:apple"}
})

minetest.register_craft({
	output = "fdecor:bread",
	recipe = {
		{"farming:bread", "farming:bread", "farming:bread"},
		{"farming:bread", "farming:bread", "farming:bread"},
		{"farming:bread", "farming:bread", "farming:bread"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:bread 9",
	recipe = {"fdecor:bread"}
})

minetest.register_craft({
	output = "fdecor:mushroom_stipe",
	recipe = {
		{"flowers:mushroom_red"},
		{"flowers:mushroom_red"},
		{"flowers:mushroom_red"}
	}
})

minetest.register_craft({
	output = "fdecor:mushroom_stipe",
	recipe = {
		{"flowers:mushroom_brown"},
		{"flowers:mushroom_brown"},
		{"flowers:mushroom_brown"}
	}
})

minetest.register_craft({
	output = "fdecor:red_mushroom",
	recipe = {
		{"flowers:mushroom_red", "flowers:mushroom_red", "flowers:mushroom_red"},
		{"flowers:mushroom_red", "flowers:mushroom_red", "flowers:mushroom_red"},
		{"flowers:mushroom_red", "flowers:mushroom_red", "flowers:mushroom_red"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "flowers:mushroom_red 9",
	recipe = {"fdecor:red_mushroom"}
})

minetest.register_craft({
	output = "fdecor:brown_mushroom",
	recipe = {
		{"flowers:mushroom_brown", "flowers:mushroom_brown", "flowers:mushroom_brown"},
		{"flowers:mushroom_brown", "flowers:mushroom_brown", "flowers:mushroom_brown"},
		{"flowers:mushroom_brown", "flowers:mushroom_brown", "flowers:mushroom_brown"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "flowers:mushroom_brown 9",
	recipe = {"fdecor:brown_mushroom"}
})

minetest.register_craft({
	type = "shapeless",
	output = "fdecor:jackolantern",
	recipe = {"fdecor:pumpkin", "default:torch"}
})

minetest.register_craft({
	type = "shapeless",
	output = "fdecor:jackolantern",
	recipe = {"fdecor:unlit_jackolantern", "default:torch"}
})

-- mapgen
if minetest.setting_getbool("enable_fdecor_biomes") ~= false then
	local mg_params = minetest.get_mapgen_params()
	if mg_params.mgname == "v6" then
		minetest.register_decoration({
			deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = -0.02,
				scale = 0.021,
				spread = {x = 800, y = 800, z = 800},
				seed = 418,
				octaves = 2,
				persist = 0.6
			},
			y_min = 1,
			y_max = 31000,
			schematic = modpath.."/schematics/mapgen_broccoli.mts",
			flags = "place_center_x, place_center_z"
		})
	elseif mg_params.mgname ~= "singlenode" then
		minetest.register_biome({
			name = "broccoli_forest",
			node_top = "default:dirt_with_grass",
			depth_top = 1,
			node_filler = "default:dirt",
			depth_filler = 3,
			y_min = 1,
			y_max = 31000,
			heat_point = 70,
			humidity_point = 40
		})

		minetest.register_decoration({
			deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = 0,
				scale = 0.022,
				spread = {x = 250, y = 250, z = 250},
				seed = 418,
				octaves = 2,
				persist = 0.6
			},
			biomes = {"broccoli_forest"},
			y_min = 1,
			y_max = 31000,
			schematic = modpath.."/schematics/mapgen_broccoli.mts",
			flags = "place_center_x, place_center_z"
		})

		minetest.register_decoration({
			deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = -0.02,
				scale = 0.02,
				spread = {x = 600, y = 600, z = 600},
				seed = 418,
				octaves = 2,
				persist = 0.6
			},
			biomes = {"broccoli_forest"},
			y_min = 1,
			y_max = 31000,
			schematic = modpath.."/schematics/mapgen_cauliflower.mts",
			flags = "place_center_x, place_center_z"
		})

		minetest.register_decoration({
			deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = -0.0001,
				scale = 0.0011,
				spread = {x = 250, y = 250, z = 250},
				seed = 2,
				octaves = 3,
				persist = 0.66
			},
			biomes = {"broccoli_forest"},
			y_min = 1,
			y_max = 31000,
			schematic = {
				size = {x = 3, y = 2, z = 1},
				data = {
					{name = "air", prob = 0},
					{name = "air", prob = 0},
					{name = "air", prob = 0},
					{name = "fdecor:carrot", param2 = 12, prob = 127},
					{name = "fdecor:carrot", param2 = 12},
					{name = "fdecor:carrot", param2 = 12, prob = 63}
				}
			},
			flags = "place_center_x",
			rotation = "random"
		})

		minetest.register_decoration({
			deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = 0.0007,
				scale = 0.0011,
				spread = {x = 250, y = 250, z = 250},
				seed = 2,
				octaves = 3,
				persist = 0.66
			},
			biomes = {"broccoli_forest"},
			y_min = 1,
			y_max = 31000,
			schematic = {
				size = {x = 3, y = 2, z = 1},
				data = {
					{name = "air", prob = 0},
					{name = "air", prob = 0},
					{name = "air", prob = 0},
					{name = "fdecor:celery", param2 = 13, prob = 191},
					{name = "fdecor:celery", param2 = 13},
					{name = "fdecor:celery", param2 = 13, prob = 127}
				}
			},
			flags = "place_center_x",
			rotation = "random"
		})

		minetest.register_decoration({
			deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = -0.075,
				scale = 0.1,
				spread = {x = 250, y = 250, z = 250},
				seed = 329,
				octaves = 3,
				persist = 0.6
			},
			biomes = {"broccoli_forest"},
			y_min = 1,
			y_max = 31000,
			schematic = {
				size = {x = 1, y = 5, z = 1},
				data = {
					{name = "fdecor:carrot", prob = 255, force_place = true},
					{name = "fdecor:carrot", prob = 255, force_place = true},
					{name = "fdecor:carrot", prob = 255, force_place = true},
					{name = "fdecor:carrot_leaves"},
					{name = "air", prob = 0}
				}
			},
			flags = "place_center_y"
		})

		minetest.register_ore({
			ore_type = "scatter",
			ore = "fdecor:potato",
			wherein = "default:dirt",
			clust_scarcity = 768,
			clust_num_ores = 8,
			clust_size = 3,
			y_min = 1,
			y_max = 31000,
			biomes = {"broccoli_forest"}
		})

		minetest.register_decoration({
			deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = -0.075,
				scale = 0.09,
				spread = {x = 200, y = 200, z = 200},
				seed = 329,
				octaves = 3,
				persist = 0.6
			},
			biomes = {"deciduous_forest", "coniferous_forest", "floatland_coniferous_forest"},
			y_min = 1,
			y_max = 31000,
			schematic = {
				size = {x = 1, y = 3, z = 1},
				data = {
					{name = "air", prob = 0},
					{name = "fdecor:mushroom_stipe", prob = 255, force_place = true},
					{name = "fdecor:brown_mushroom", prob = 255, force_place = true},
				}
			}
		})

		minetest.register_decoration({
			deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = -0.075,
				scale = 0.09,
				spread = {x = 200, y = 200, z = 200},
				seed = 330,
				octaves = 3,
				persist = 0.6
			},
			biomes = {"deciduous_forest", "coniferous_forest", "floatland_coniferous_forest"},
			y_min = 1,
			y_max = 31000,
			schematic = {
				size = {x = 1, y = 3, z = 1},
				data = {
					{name = "air", prob = 0},
					{name = "fdecor:mushroom_stipe", prob = 255, force_place = true},
					{name = "fdecor:red_mushroom", prob = 255, force_place = true},
				}
			}
		})

		for _,v in ipairs({{-0.03,0.09,5},{-0.015,0.075,4},{0,0.06,3},{0.015,0.045,2},{0.03,0.03,1}}) do
			minetest.register_decoration({
				deco_type = "simple",
				place_on = {"default:dirt_with_grass"},
				sidelen = 16,
				noise_params = {
					offset = v[1],
					scale = v[2],
					spread = {x = 200, y = 200, z = 200},
					seed = 329,
					octaves = 3,
					persist = 0.6
				},
				biomes = {"broccoli_forest"},
				y_min = 1,
				y_max = 31000,
				decoration = "default:grass_"..v[3]
			})
		end
	end
end
