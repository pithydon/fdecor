minetest.register_node("fdecor:food_shelf", {
	description = "Food Shelf",
	tiles = {"fdecor_food_shelf_old.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	allow_metadata_inventory_put = function(pos, listname, index, stack)
		return 0
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name().." moves stuff in food shelf at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name().." takes stuff from food shelf at "..minetest.pos_to_string(pos))
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "food", drops)
		drops[#drops+1] = "fdecor:food_shelf"
		minetest.remove_node(pos)
		return drops
	end
})

if minetest.get_modpath("moreshelves") then
	minetest.override_item("fdecor:food_shelf", {
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			minetest.remove_node(pos)
			minetest.place_node(pos, {name = "moreshelves:food_shelf"})
		end
	})

	local add_items = function(pos, drops)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		for _,v in ipairs(drops) do
			inv:add_item("shelf", v)
		end
	end

	minetest.register_lbm({
		name = "fdecor:replace_old_shelves",
		nodenames = {"fdecor:food_shelf"},
		run_at_every_load = true,
		action = function(pos, node)
			local drops = {}
			default.get_inventory_drops(pos, "food", drops)
			minetest.remove_node(pos)
			minetest.place_node(pos, {name = "moreshelves:food_shelf"})
			minetest.after(0.01, add_items, pos, drops)
		end
	})

	minetest.register_craft({
		type = "shapeless",
		output = "moreshelves:food_shelf",
		recipe = {"fdecor:food_shelf"}
	})
end

minetest.register_node("fdecor:apple", {
	description = "Apple Block",
	drawtype = "normal",
	tiles = {"fdecor_apple_top.png", "fdecor_apple_bottom.png", "fdecor_apple_side.png"},
	groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 3, falling_hanging_node = 1},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:apple_sauce", {
	description = "Apple Sauce Block",
	drawtype = "normal",
	tiles = {"fdecor_apple_sauce.png"},
	groups = {food = 1, crumbly = 3, oddly_breakable_by_hand = 3, explody = 1, falling_node = 1}
})

minetest.register_node("fdecor:coconut", {
	description = "Coconut Block",
	drawtype = "normal",
	tiles = {"fdecor_coconut_top.png", "fdecor_coconut.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 2, falling_hanging_node = 1, falling_kill_node = 1},
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
	sounds = default.node_sound_wood_defaults()
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
	sounds = default.node_sound_defaults()
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
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:celery_with_peanut_butter", {
	description = "Celery with Peanut Butter Block",
	drawtype = "normal",
	paramtype2 = "facedir",
	tiles = {"fdecor_celery_top.png", "fdecor_celery_top.png^[transformFY", "fdecor_celery_with_peanut_butter_side.png^[transformFX",
			"fdecor_celery_with_peanut_butter_side.png", "fdecor_celery_side.png", "fdecor_peanut_butter.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 1, choppy = 3},
	on_place = minetest.rotate_node,
	sounds = default.node_sound_defaults()
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
	sounds = default.node_sound_defaults()
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
	groups = {food = 1, oddly_breakable_by_hand = 3, crumbly = 3, falling_sticky_node = 1}
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
		type = "connected",
		fixed = {{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}},
		connect_front = {{-0.25, -0.5, -0.5, 0.25, -0.25, -0.25}},
		connect_left = {{-0.5, -0.5, -0.25, -0.25, -0.25, 0.25}},
		connect_back = {{-0.25, -0.5, 0.25, 0.25, -0.25, 0.5}},
		connect_right = {{0.25, -0.5, -0.25, 0.5, -0.25, 0.25}},
	},
	connects_to = {"fdecor:mushroom_stipe", "group:tree", "group:wood", "group:stone"},
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

minetest.register_node("fdecor:blue_cheese", {
	description = "Blue Cheese Block",
	drawtype = "normal",
	tiles = {"fdecor_blue_cheese.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:cheddar_cheese", {
	description = "Cheddar Cheese Block",
	drawtype = "normal",
	tiles = {"fdecor_cheddar_cheese.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:swiss_cheese", {
	description = "Swiss Cheese Block",
	drawtype = "normal",
	tiles = {"fdecor_swiss_cheese.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:white_cheese", {
	description = "White Cheese Block",
	drawtype = "normal",
	tiles = {"fdecor_white_cheese.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:marble_cheese", {
	description = "Marble Cheese Block",
	drawtype = "normal",
	tiles = {"fdecor_marble_cheese.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
	sounds = default.node_sound_defaults()
})

minetest.register_node("fdecor:milk_chocolate", {
	description = "Milk Chocolate Block",
	drawtype = "normal",
	tiles = {"fdecor_milk_chocolate.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("fdecor:dark_chocolate", {
	description = "Dark Chocolate Block",
	drawtype = "normal",
	tiles = {"fdecor_dark_chocolate.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("fdecor:white_chocolate", {
	description = "White Chocolate Block",
	drawtype = "normal",
	tiles = {"fdecor_white_chocolate.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("fdecor:milk_chocolate_brick", {
	description = "Milk Chocolate Brick",
	drawtype = "normal",
	tiles = {"fdecor_milk_chocolate_brick.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("fdecor:dark_chocolate_brick", {
	description = "Dark Chocolate Brick",
	drawtype = "normal",
	tiles = {"fdecor_dark_chocolate_brick.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("fdecor:white_chocolate_brick", {
	description = "White Chocolate Brick",
	drawtype = "normal",
	tiles = {"fdecor_white_chocolate_brick.png"},
	groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
	sounds = default.node_sound_stone_defaults()
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

doors.register_door("fdecor:milk_chocolate_door", {
	description = "Milk Chocolate Door",
	inventory_image = "fdecor_milk_chocolate_door_inv.png",
	tiles = {"fdecor_milk_chocolate_door.png"},
	recipe = {
		{"fdecor:milk_chocolate", "fdecor:milk_chocolate"},
		{"fdecor:milk_chocolate", "fdecor:milk_chocolate"},
		{"fdecor:milk_chocolate", "fdecor:milk_chocolate"}
	},
	groups = {oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
	sounds = default.node_sound_stone_defaults(),
	protected = false
})

doors.register_door("fdecor:dark_chocolate_door", {
	description = "Dark Chocolate Door",
	inventory_image = "fdecor_dark_chocolate_door_inv.png",
	tiles = {"fdecor_dark_chocolate_door.png"},
	recipe = {
		{"fdecor:dark_chocolate", "fdecor:dark_chocolate"},
		{"fdecor:dark_chocolate", "fdecor:dark_chocolate"},
		{"fdecor:dark_chocolate", "fdecor:dark_chocolate"}
	},
	groups = {oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
	sounds = default.node_sound_stone_defaults(),
	protected = false
})

doors.register_door("fdecor:white_chocolate_door", {
	description = "White Chocolate Door",
	inventory_image = "fdecor_white_chocolate_door_inv.png",
	tiles = {"fdecor_white_chocolate_door.png"},
	recipe = {
		{"fdecor:white_chocolate", "fdecor:white_chocolate"},
		{"fdecor:white_chocolate", "fdecor:white_chocolate"},
		{"fdecor:white_chocolate", "fdecor:white_chocolate"}
	},
	groups = {oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
	sounds = default.node_sound_stone_defaults(),
	protected = false
})

walls.register("fdecor:blue_cheese_wall", "Blue Cheese Wall", "fdecor_blue_cheese.png",
		"fdecor:blue_cheese", default.node_sound_defaults())
walls.register("fdecor:marble_cheese_wall", "Marble Cheese Wall", "fdecor_marble_cheese.png",
		"fdecor:marble_cheese", default.node_sound_defaults())
walls.register("fdecor:white_cheese_wall", "White Cheese Wall", "fdecor_white_cheese.png",
		"fdecor:white_cheese", default.node_sound_defaults())
walls.register("fdecor:swiss_cheese_wall", "Swiss Cheese Wall", "fdecor_swiss_cheese.png",
		"fdecor:swiss_cheese", default.node_sound_defaults())
walls.register("fdecor:cheddar_cheese_wall", "Cheddar Cheese Wall", "fdecor_cheddar_cheese.png",
		"fdecor:cheddar_cheese", default.node_sound_defaults())
walls.register("fdecor:milk_chocolate_wall", "Milk Chocolate Wall", "fdecor_milk_chocolate.png",
		"fdecor:milk_chocolate", default.node_sound_stone_defaults())
walls.register("fdecor:dark_chocolate_wall", "Dark Chocolate Wall", "fdecor_dark_chocolate.png",
		"fdecor:dark_chocolate", default.node_sound_stone_defaults())
walls.register("fdecor:white_chocolate_wall", "White Chocolate Wall", "fdecor_white_chocolate.png",
		"fdecor:white_chocolate", default.node_sound_stone_defaults())

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

if minetest.get_modpath("moreblocks") then
	stairsplus:register_all("stairs", "peanut_butter", "fdecor:peanut_butter", {
		description = "Peanut Butter",
		tiles = {"fdecor_peanut_butter.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, crumbly = 1, disable_jump = 1}
	})

	stairsplus:register_all("stairs", "mashed_potatoes", "fdecor:mashed_potatoes", {
		description = "Mashed Potatoes",
		tiles = {"fdecor_mashed_potatoes.png"},
		groups = {food = 1, oddly_breakable_by_hand = 3, crumbly = 3, falling_sticky_node = 1}
	})

	stairsplus:register_all("stairs", "potato_brick", "fdecor:potato_brick", {
		description = "Potato Brick",
		tiles = {"fdecor_potato_brick.png"},
		groups = {food = 1, oddly_breakable_by_hand = 2, choppy = 2}
	})

	stairsplus:register_all("stairs", "blue_cheese", "fdecor:blue_cheese", {
		description = "Blue Cheese",
		tiles = {"fdecor_blue_cheese.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
		sounds = default.node_sound_defaults()
	})

	stairsplus:register_all("stairs", "marble_cheese", "fdecor:marble_cheese", {
		description = "Marble Cheese",
		tiles = {"fdecor_marble_cheese.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
		sounds = default.node_sound_defaults()
	})

	stairsplus:register_all("stairs", "white_cheese", "fdecor:white_cheese", {
		description = "White Cheese",
		tiles = {"fdecor_white_cheese.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
		sounds = default.node_sound_defaults()
	})

	stairsplus:register_all("stairs", "swiss_cheese", "fdecor:swiss_cheese", {
		description = "Swiss Cheese",
		tiles = {"fdecor_swiss_cheese.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
		sounds = default.node_sound_defaults()
	})

	stairsplus:register_all("stairs", "cheddar_cheese", "fdecor:cheddar_cheese", {
		description = "Cheddar Cheese",
		tiles = {"fdecor_cheddar_cheese.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
		sounds = default.node_sound_defaults()
	})

	stairsplus:register_all("stairs", "milk_chocolate", "fdecor:milk_chocolate", {
		description = "Milk Chocolate",
		tiles = {"fdecor_milk_chocolate.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults()
	})

	stairsplus:register_all("stairs", "dark_chocolate", "fdecor:dark_chocolate", {
		description = "Dark Chocolate",
		tiles = {"fdecor_dark_chocolate.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults()
	})

	stairsplus:register_all("stairs", "white_chocolate", "fdecor:white_chocolate", {
		description = "White Chocolate",
		tiles = {"fdecor_white_chocolate.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults()
	})

	stairsplus:register_all("stairs", "milk_chocolate_brick", "fdecor:milk_chocolate_brick", {
		description = "Milk Chocolate Brick",
		tiles = {"fdecor_milk_chocolate_brick.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults()
	})

	stairsplus:register_all("stairs", "dark_chocolate_brick", "fdecor:dark_chocolate_brick", {
		description = "Dark Chocolate Brick",
		tiles = {"fdecor_dark_chocolate_brick.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults()
	})

	stairsplus:register_all("stairs", "white_chocolate_brick", "fdecor:white_chocolate_brick", {
		description = "White Chocolate Brick",
		tiles = {"fdecor_white_chocolate_brick.png"},
		groups = {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
		sounds = default.node_sound_stone_defaults()
	})
else
	stairs.register_stair_and_slab("peanut_butter", "fdecor:peanut_butter", {food = 1, oddly_breakable_by_hand = 1, crumbly = 1, disable_jump = 1},
			{"fdecor_peanut_butter.png"}, "Peanut Butter Stairs", "Peanut Butter Slab")

	stairs.register_stair_and_slab("mashed_potatoes", "fdecor:mashed_potatoes", {food = 1, oddly_breakable_by_hand = 3, crumbly = 3, falling_sticky_node = 1},
			{"fdecor_mashed_potatoes.png"}, "Mashed Potatoes Stairs", "Mashed Potatoes Slab")

	stairs.register_stair_and_slab("potato_brick", "fdecor:potato_brick", {food = 1, oddly_breakable_by_hand = 2, choppy = 2},
			{"fdecor_potato_brick.png"}, "Potato Brick Stairs", "Potato Brick Slab")

	stairs.register_stair_and_slab("blue_cheese", "fdecor:blue_cheese", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
			{"fdecor_blue_cheese.png"}, "Blue Cheese Stairs", "Blue Cheese Slab", default.node_sound_defaults())

	stairs.register_stair_and_slab("marble_cheese", "fdecor:marble_cheese", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
			{"fdecor_marble_cheese.png"}, "Marble Cheese Stairs", "Marble Cheese Slab", default.node_sound_defaults())

	stairs.register_stair_and_slab("white_cheese", "fdecor:white_cheese", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
			{"fdecor_white_cheese.png"}, "White Cheese Stairs", "White Cheese Slab", default.node_sound_defaults())

	stairs.register_stair_and_slab("swiss_cheese", "fdecor:swiss_cheese", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
			{"fdecor_swiss_cheese.png"}, "Swiss Cheese Stairs", "Swiss Cheese Slab", default.node_sound_defaults())

	stairs.register_stair_and_slab("cheddar_cheese", "fdecor:cheddar_cheese", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, snappy = 1},
			{"fdecor_cheddar_cheese.png"}, "Cheddar Cheese Stairs", "Cheddar Cheese Slab", default.node_sound_defaults())

	stairs.register_stair_and_slab("milk_chocolate", "fdecor:milk_chocolate", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
			{"fdecor_milk_chocolate.png"}, "Milk Chocolate Stairs", "Milk Chocolate Slab", default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("dark_chocolate", "fdecor:dark_chocolate", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
			{"fdecor_dark_chocolate.png"}, "Dark Chocolate Stairs", "Dark Chocolate Slab", default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("white_chocolate", "fdecor:white_chocolate", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
			{"fdecor_white_chocolate.png"}, "White Chocolate Stairs", "White Chocolate Slab", default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("milk_chocolate_brick", "fdecor:milk_chocolate_brick", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
			{"fdecor_milk_chocolate_brick.png"}, "Milk Chocolate Brick Stairs", "Milk Chocolate Brick Slab", default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("dark_chocolate_brick", "fdecor:dark_chocolate_brick", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
			{"fdecor_dark_chocolate_brick.png"}, "Dark Chocolate Brick Stairs", "Dark Chocolate Brick Slab", default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("white_chocolate_brick", "fdecor:white_chocolate_brick", {food = 1, oddly_breakable_by_hand = 1, cracky = 3, choppy = 2},
			{"fdecor_white_chocolate_brick.png"}, "White Chocolate Brick Stairs", "White Chocolate Brick Slab", default.node_sound_stone_defaults())
end

if minetest.get_modpath("furniture") then
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

if minetest.get_modpath("csh") then
	csh.from_node("fdecor:banana")
	csh.from_node("fdecor:red_banana")
	csh.from_node("fdecor:carrot")
	csh.from_node("fdecor:broccoli_stalk")
	csh.from_node("fdecor:cauliflower_stalk")
	csh.from_node("fdecor:potato_brick")
	csh.from_node("fdecor:blue_cheese")
	csh.from_node("fdecor:marble_cheese")
	csh.from_node("fdecor:white_cheese")
	csh.from_node("fdecor:swiss_cheese")
	csh.from_node("fdecor:cheddar_cheese")
	csh.from_node("fdecor:milk_chocolate")
	csh.from_node("fdecor:dark_chocolate")
	csh.from_node("fdecor:white_chocolate")
	csh.from_node("fdecor:milk_chocolate_brick")
	csh.from_node("fdecor:dark_chocolate_brick")
	csh.from_node("fdecor:white_chocolate_brick")
end

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

if minetest.get_modpath("crops") then
	minetest.register_craft({
		output = "fdecor:potato",
		recipe = {
			{"crops:potato", "crops:potato", "crops:potato"},
			{"crops:potato", "crops:potato", "crops:potato"},
			{"crops:potato", "crops:potato", "crops:potato"}
		}
	})

	minetest.register_craft({
		type = "shapeless",
		output = "crops:potato 9",
		recipe = {"fdecor:potato"}
	})
end

if minetest.get_modpath("farming") and farming.mod == "redo" then
	minetest.register_craft({
		output = "fdecor:carrot",
		recipe = {
			{"farming:carrot", "farming:carrot", "farming:carrot"},
			{"farming:carrot", "farming:carrot", "farming:carrot"},
			{"farming:carrot", "farming:carrot", "farming:carrot"}
		}
	})

	minetest.register_craft({
		type = "shapeless",
		output = "farming:carrot 9",
		recipe = {"fdecor:carrot"}
	})

	minetest.register_craft({
		output = "fdecor:dark_chocolate",
		recipe = {
			{"farming:chocolate_dark", "farming:chocolate_dark", "farming:chocolate_dark"},
			{"farming:chocolate_dark", "farming:chocolate_dark", "farming:chocolate_dark"},
			{"farming:chocolate_dark", "farming:chocolate_dark", "farming:chocolate_dark"}
		}
	})

	minetest.register_craft({
		type = "shapeless",
		output = "farming:chocolate_dark 9",
		recipe = {"fdecor:dark_chocolate"}
	})

	minetest.register_craft({
		output = "fdecor:potato",
		recipe = {
			{"farming:potato", "farming:potato", "farming:potato"},
			{"farming:potato", "farming:potato", "farming:potato"},
			{"farming:potato", "farming:potato", "farming:potato"}
		}
	})

	minetest.register_craft({
		type = "shapeless",
		output = "farming:potato 9",
		recipe = {"fdecor:potato"}
	})

	minetest.register_craft({
		output = "fdecor:rhubarb",
		recipe = {
			{"farming:rhubarb", "farming:rhubarb", "farming:rhubarb"},
			{"farming:rhubarb", "farming:rhubarb", "farming:rhubarb"},
			{"farming:rhubarb", "farming:rhubarb", "farming:rhubarb"}
		}
	})

	minetest.register_craft({
		type = "shapeless",
		output = "farming:rhubarb 9",
		recipe = {"fdecor:rhubarb"}
	})
end

if minetest.get_modpath("moretrees") then
	minetest.register_craft({
		output = "fdecor:coconut",
		recipe = {
			{"moretrees:coconut", "moretrees:coconut", "moretrees:coconut"},
			{"moretrees:coconut", "moretrees:coconut", "moretrees:coconut"},
			{"moretrees:coconut", "moretrees:coconut", "moretrees:coconut"}
		}
	})

	minetest.register_craft({
		type = "shapeless",
		output = "moretrees:coconut 9",
		recipe = {"fdecor:coconut"}
	})
end
