GM.ZombieEscapeWeaponsPrimary = {
	"weapon_zs_zeakbar",
	"weapon_zs_zesweeper",
	"weapon_zs_zesmg",
	"weapon_zs_zeinferno",
	"weapon_zs_zestubber",
	"weapon_zs_zebulletstorm",
	"weapon_zs_zesilencer",
	"weapon_zs_zequicksilver",
	"weapon_zs_zeamigo",
	"weapon_zs_zem4"
}

GM.ZombieEscapeWeaponsSecondary = {
	"weapon_zs_zedeagle",
	"weapon_zs_zebattleaxe",
	"weapon_zs_zeeraser",
	"weapon_zs_zeglock",
	"weapon_zs_zetempest"
}

-- Change this if you plan to alter the cost of items or you severely change how Worth works.
-- Having separate cart files allows people to have separate loadouts for different servers.
GM.CartFile = "zscartssc.txt"
GM.SkillLoadoutsFile = "zsskloadouts.txt"

ITEMCAT_GUNS = 1
ITEMCAT_AMMO = 2
ITEMCAT_MELEE = 3
ITEMCAT_TOOLS = 4
ITEMCAT_OTHER = 5
ITEMCAT_TRINKETS = 6
ITEMCAT_RETURNS = 7
ITEMCAT_DEPLOYABLES = 8

ITEMSUBCAT_TRINKETS_DEFENSIVE = 1
ITEMSUBCAT_TRINKETS_OFFENSIVE = 2
ITEMSUBCAT_TRINKETS_MELEE = 3
ITEMSUBCAT_TRINKETS_PERFORMANCE = 4
ITEMSUBCAT_TRINKETS_SUPPORT = 5
ITEMSUBCAT_TRINKETS_SPECIAL = 6

GM.ItemCategories = {
	[ITEMCAT_GUNS] = "Guns",
	[ITEMCAT_AMMO] = "Ammunition",
	[ITEMCAT_MELEE] = "Melee",
	[ITEMCAT_TOOLS] = "Tools",
	[ITEMCAT_OTHER] = "Other",
	[ITEMCAT_TRINKETS] = "Traits",
	[ITEMCAT_RETURNS] = "Returns"
	--[ITEMCAT_DEPLOYABLES] = "Deployables"
}

GM.ItemSubCategories = {
	[ITEMSUBCAT_TRINKETS_DEFENSIVE] = "Defensive",
	[ITEMSUBCAT_TRINKETS_OFFENSIVE] = "Offensive",
	[ITEMSUBCAT_TRINKETS_MELEE] = "Melee",
	[ITEMSUBCAT_TRINKETS_PERFORMANCE] = "Performance",
	[ITEMSUBCAT_TRINKETS_SUPPORT] = "Support",
	[ITEMSUBCAT_TRINKETS_SPECIAL] = "Special"
}

--[[
Humans select what weapons (or other things) they want to start with and can even save favorites. Each object has a number of 'Worth' points.
Signature is a unique signature to give in case the item is renamed or reordered. Don't use a number or a string number!
A human can only use 100 points (default) when they join. Redeeming or joining late starts you out with a random loadout from above.
SWEP is a swep given when the player spawns with that perk chosen.
Callback is a function called. Model is a display model. If model isn't defined then the SWEP model will try to be used.
swep, callback, and model can all be nil or empty
]]
GM.Items = {}
function GM:AddItem(signature, category, price, swep, name, desc, model, callback)
	local tab = {Signature = signature, Name = name or "?", Description = desc, Category = category, Price = price or 0, SWEP = swep, Callback = callback, Model = model}

	tab.Worth = tab.Price -- compat

	self.Items[#self.Items + 1] = tab
	self.Items[signature] = tab

	return tab
end

function GM:AddStartingItem(signature, category, price, swep, name, desc, model, callback)
	local item = self:AddItem(signature, category, price, swep, name, desc, model, callback)
	item.WorthShop = true

	return item
end

function GM:AddPointShopItem(signature, category, price, swep, name, desc, model, callback)
	local item = self:AddItem("ps_"..signature, category, price, swep, name, desc, model, callback)
	item.PointShop = true

	return item
end

-- How much ammo is considered one 'clip' of ammo? For use with setting up weapon defaults. Works directly with zs_survivalclips
GM.AmmoCache = {}
GM.AmmoCache["ar2"]							= 32		-- Assault rifles.
GM.AmmoCache["alyxgun"]						= 24		-- Not used.
GM.AmmoCache["pistol"]						= 14		-- Pistols.
GM.AmmoCache["smg1"]						= 36		-- SMG's and some rifles.
GM.AmmoCache["357"]							= 8			-- Rifles, especially of the sniper variety.
GM.AmmoCache["xbowbolt"]					= 8			-- Crossbows
GM.AmmoCache["buckshot"]					= 12		-- Shotguns
GM.AmmoCache["ar2altfire"]					= 1			-- Not used.
GM.AmmoCache["slam"]						= 1			-- Force Field Emitters.
GM.AmmoCache["rpg_round"]					= 1			-- Not used. Rockets?
GM.AmmoCache["smg1_grenade"]				= 1			-- Not used.
GM.AmmoCache["sniperround"]					= 1			-- Barricade Kit
GM.AmmoCache["sniperpenetratedround"]		= 1			-- Remote Det pack.
GM.AmmoCache["grenade"]						= 1			-- Grenades.
GM.AmmoCache["thumper"]						= 1			-- Gun turret.
GM.AmmoCache["gravity"]						= 1			-- Unused.
GM.AmmoCache["battery"]						= 23		-- Used with the Medical Kit.
GM.AmmoCache["gaussenergy"]					= 2			-- Nails used with the Carpenter's Hammer.
GM.AmmoCache["combinecannon"]				= 1			-- Not used.
GM.AmmoCache["airboatgun"]					= 1			-- Arsenal crates.
GM.AmmoCache["striderminigun"]				= 1			-- Message beacons.
GM.AmmoCache["helicoptergun"]				= 1			-- Resupply boxes.
GM.AmmoCache["spotlamp"]					= 1
GM.AmmoCache["manhack"]						= 1
GM.AmmoCache["repairfield"]					= 1
GM.AmmoCache["zapper"]						= 1
GM.AmmoCache["pulse"]						= 30
GM.AmmoCache["impactmine"]					= 3
GM.AmmoCache["chemical"]					= 20
GM.AmmoCache["flashbomb"]					= 1
GM.AmmoCache["turret_buckshot"]				= 1
GM.AmmoCache["turret_assault"]				= 1
GM.AmmoCache["scrap"]						= 5

GM.AmmoResupply = table.ToAssoc({"ar2", "pistol", "smg1", "357", "xbowbolt", "buckshot", "battery", "pulse", "gaussenergy", "scrap"})

-----------
-- Worth --
-----------

GM:AddStartingItem("pshtr",				ITEMCAT_GUNS,			30,				"weapon_zs_peashooter")
GM:AddStartingItem("btlax",				ITEMCAT_GUNS,			30,				"weapon_zs_battleaxe")
GM:AddStartingItem("owens",				ITEMCAT_GUNS,			30,				"weapon_zs_owens")
GM:AddStartingItem("blstr",				ITEMCAT_GUNS,			50,				"weapon_zs_blaster")
GM:AddStartingItem("stbbr",				ITEMCAT_GUNS,			50,				"weapon_zs_stubber")
GM:AddStartingItem("tossr",				ITEMCAT_GUNS,			45,				"weapon_zs_tosser")
GM:AddStartingItem("crklr",				ITEMCAT_GUNS,			45,				"weapon_zs_crackler")
GM:AddStartingItem("z9000",				ITEMCAT_GUNS,			25,				"weapon_zs_z9000")

GM:AddStartingItem("2pcp",				ITEMCAT_AMMO,			15,				nil,			"28 pistol ammo",				nil,		"models/Items/BoxSRounds.mdl",			function(pl) pl:GiveAmmo(28, "pistol", true) end)
GM:AddStartingItem("3pcp",				ITEMCAT_AMMO,			20,				nil,			"42 pistol ammo",				nil,		"models/Items/BoxSRounds.mdl",			function(pl) pl:GiveAmmo(42, "pistol", true) end)
GM:AddStartingItem("2sgcp",				ITEMCAT_AMMO,			15,				nil,			"24 shotgun ammo",				nil,		"models/Items/BoxBuckshot.mdl",			function(pl) pl:GiveAmmo(24, "buckshot", true) end)
GM:AddStartingItem("3sgcp",				ITEMCAT_AMMO,			20,				nil,			"36 shotgun ammo",				nil,		"models/Items/BoxBuckshot.mdl",			function(pl) pl:GiveAmmo(36, "buckshot", true) end)
GM:AddStartingItem("2smgcp",			ITEMCAT_AMMO,			15,				nil,			"72 SMG ammo",					nil,		"models/Items/BoxMRounds.mdl",				function(pl) pl:GiveAmmo(72, "smg1", true) end)
GM:AddStartingItem("3smgcp",			ITEMCAT_AMMO,			20,				nil,			"108 SMG ammo",					nil,		"models/Items/BoxMRounds.mdl",				function(pl) pl:GiveAmmo(108, "smg1", true) end)
GM:AddStartingItem("2arcp",				ITEMCAT_AMMO,			15,				nil,			"64 assault rifle ammo",		nil,		"models/Items/357ammobox.mdl",			function(pl) pl:GiveAmmo(64, "ar2", true) end)
GM:AddStartingItem("3arcp",				ITEMCAT_AMMO,			20,				nil,			"96 assault rifle ammo",		nil,		"models/Items/357ammobox.mdl",			function(pl) pl:GiveAmmo(96, "ar2", true) end)
GM:AddStartingItem("2rcp",				ITEMCAT_AMMO,			15,				nil,			"16 rifle ammo",				nil,		"models/props_lab/box01a.mdl",			function(pl) pl:GiveAmmo(16, "357", true) end)
GM:AddStartingItem("3rcp",				ITEMCAT_AMMO,			20,				nil,			"24 rifle ammo",				nil,		"models/props_lab/box01a.mdl",			function(pl) pl:GiveAmmo(24, "357", true) end)
GM:AddStartingItem("2pls",				ITEMCAT_AMMO,			15,				nil,			"60 pulse ammo",				nil,		"models/Items/combine_rifle_ammo01.mdl",			function(pl) pl:GiveAmmo(60, "pulse", true) end)
GM:AddStartingItem("3pls",				ITEMCAT_AMMO,			20,				nil,			"90 pulse ammo",				nil,		"models/Items/combine_rifle_ammo01.mdl",			function(pl) pl:GiveAmmo(90, "pulse", true) end)



--GM:AddStartingItem("xbow1",				ITEMCAT_AMMO,			5,				nil,			"16 crossbow bolts",			nil,		"models/Items/CrossbowRounds.mdl",			function(pl) pl:GiveAmmo(16, "XBowBolt", true) end)
--GM:AddStartingItem("xbow2",				ITEMCAT_AMMO,			10,				nil,			"24 crossbow bolts",			nil,		"models/Items/CrossbowRounds.mdl",			function(pl) pl:GiveAmmo(24, "XBowBolt", true) end)


GM:AddStartingItem("zpaxe",				ITEMCAT_MELEE,			35,				"weapon_zs_axe")
GM:AddStartingItem("crwbar",			ITEMCAT_MELEE,			35,				"weapon_zs_crowbar")
GM:AddStartingItem("stnbtn",			ITEMCAT_MELEE,			20,				"weapon_zs_stunbaton")
GM:AddStartingItem("csknf",				ITEMCAT_MELEE,			5,				"weapon_zs_swissarmyknife")
GM:AddStartingItem("zpplnk",			ITEMCAT_MELEE,			10,				"weapon_zs_plank")
GM:AddStartingItem("zpfryp",			ITEMCAT_MELEE,			15,				"weapon_zs_fryingpan")
GM:AddStartingItem("zpcpot",			ITEMCAT_MELEE,			15,				"weapon_zs_pot")
GM:AddStartingItem("pipe",				ITEMCAT_MELEE,			40,				"weapon_zs_pipe")
GM:AddStartingItem("hook",				ITEMCAT_MELEE,			40,				"weapon_zs_hook")

local item
GM:AddStartingItem("medkit",			ITEMCAT_TOOLS,			40,				"weapon_zs_medicalkit")
GM:AddStartingItem("150mkit",				ITEMCAT_TOOLS,			20,				nil,			"150 medical kit charge",				nil,		"models/healthvial.mdl",			function(pl) pl:GiveAmmo(150, "battery", true) end)
GM:AddStartingItem("medgun",			ITEMCAT_TOOLS,			55,				"weapon_zs_medicgun")

GM:AddStartingItem("arscrate",			ITEMCAT_TOOLS,			30,				"weapon_zs_arsenalcrate")
.Countables = "prop_arsenalcrate"
GM:AddStartingItem("resupplybox",		ITEMCAT_TOOLS,			30,				"weapon_zs_resupplybox")
.Countables = "prop_resupplybox"

item =
GM:AddStartingItem("infturret",			ITEMCAT_TOOLS,			45,				"weapon_zs_gunturret",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret") pl:GiveAmmo(1, "thumper") pl:GiveAmmo(125, "smg1") end)
item.Countables = "prop_gunturret"
item.NoClassicMode = true

GM:AddStartingItem("manhack",			ITEMCAT_TOOLS,			50,				"weapon_zs_manhack").Countables = "prop_manhack"

GM:AddStartingItem("wrench",			ITEMCAT_TOOLS,			10,				"weapon_zs_wrench").NoClassicMode = true
GM:AddStartingItem("crphmr",			ITEMCAT_TOOLS,			30,				"weapon_zs_hammer").NoClassicMode = true
GM:AddStartingItem("exnls",				ITEMCAT_TOOLS,			10,				nil,			"Extra nails",						"20 extra nails for barricading.", 		"models/props_junk/cardboard_box004a.mdl", 			function(pl) pl:GiveAmmo(20, "GaussEnergy", true) end)
GM:AddStartingItem("junkpack",			ITEMCAT_TOOLS,	30,				"weapon_zs_boardpack")

GM:AddStartingItem("msgbeacon",			ITEMCAT_TOOLS,			10,				"weapon_zs_messagebeacon").Countables = "prop_messagebeacon"


GM:AddStartingItem("stone",				ITEMCAT_OTHER,			5,				"weapon_zs_stone")
GM:AddStartingItem("grenade",			ITEMCAT_OTHER,			10,				"weapon_zs_grenade", nil, nil, "models/Items/grenadeAmmo.mdl")

GM:AddStartingItem("detpck",			ITEMCAT_OTHER,			30,				"weapon_zs_detpack").Countables = "prop_detpack"




------------
-- Points --
------------

--Tier 1.5 (not much better than starting items) Mostly for people who are stuck with no points and no ammo.


-- Tier 2
GM:AddPointShopItem("glock3",			ITEMCAT_GUNS,			35,				"weapon_zs_glock3")
GM:AddPointShopItem("magnum",			ITEMCAT_GUNS,			35,				"weapon_zs_magnum")
GM:AddPointShopItem("eraser",			ITEMCAT_GUNS,			35,				"weapon_zs_eraser")
GM:AddPointShopItem("uzi",				ITEMCAT_GUNS,			35,				"weapon_zs_uzi")
GM:AddPointShopItem("annabelle",		ITEMCAT_GUNS,			35,				"weapon_zs_annabelle")
-- Tier 3
GM:AddPointShopItem("deagle",			ITEMCAT_GUNS,			70,				"weapon_zs_deagle")
GM:AddPointShopItem("ender",			ITEMCAT_GUNS,			70,				"weapon_zs_ender")
GM:AddPointShopItem("shredder",			ITEMCAT_GUNS,			70,				"weapon_zs_smg")
GM:AddPointShopItem("silencer",			ITEMCAT_GUNS,			70,				"weapon_zs_silencer")
GM:AddPointShopItem("hunter",			ITEMCAT_GUNS,			70,				"weapon_zs_hunter")

GM:AddPointShopItem("akbar",			ITEMCAT_GUNS,			70,				"weapon_zs_akbar")
GM:AddPointShopItem("laserpistol",		ITEMCAT_GUNS,			70,				"weapon_zs_laserpistol")

-- Tier 4

GM:AddPointShopItem("sweeper",			ITEMCAT_GUNS,			125,			"weapon_zs_sweepershotgun")
GM:AddPointShopItem("bulletstorm",		ITEMCAT_GUNS,			125,			"weapon_zs_bulletstorm")
GM:AddPointShopItem("reaper",			ITEMCAT_GUNS,			125,			"weapon_zs_reaper")
GM:AddPointShopItem("slugrifle",		ITEMCAT_GUNS,			125,			"weapon_zs_slugrifle")
GM:AddPointShopItem("stalker",			ITEMCAT_GUNS,			125,			"weapon_zs_m4")
GM:AddPointShopItem("inferno",			ITEMCAT_GUNS,			125,			"weapon_zs_inferno")
GM:AddPointShopItem("barreler",			ITEMCAT_GUNS,			135,			"weapon_zs_barreler")


-- Tier 5

GM:AddPointShopItem("crossbow",			ITEMCAT_GUNS,			200,			"weapon_zs_crossbow")
GM:AddPointShopItem("boomstick",		ITEMCAT_GUNS,			200,			"weapon_zs_boomstick")
GM:AddPointShopItem("pulserifle",		ITEMCAT_GUNS,			200,			"weapon_zs_pulserifle")


GM:AddPointShopItem("pistolammo",		ITEMCAT_AMMO,			7,				nil,							"14 pistol ammo",				nil,									"models/Items/BoxSRounds.mdl",						function(pl) pl:GiveAmmo(14, "pistol", true) end)
GM:AddPointShopItem("shotgunammo",		ITEMCAT_AMMO,			7,				nil,							"12 shotgun ammo",				nil,									"models/Items/BoxBuckshot.mdl",						function(pl) pl:GiveAmmo(12, "buckshot", true) end)
GM:AddPointShopItem("smgammo",			ITEMCAT_AMMO,			7,				nil,							"36 SMG ammo",					nil,									"models/Items/BoxMRounds.mdl",							function(pl) pl:GiveAmmo(36, "smg1", true) end)
GM:AddPointShopItem("rifleammo",		ITEMCAT_AMMO,			7,				nil,							"8 rifle ammo",					nil,									"models/props_lab/box01a.mdl",						function(pl) pl:GiveAmmo(8, "357", true) end)
GM:AddPointShopItem("assaultrifleammo",	ITEMCAT_AMMO,			7,				nil,							"32 assault rifle ammo",		nil,									"models/Items/357ammobox.mdl",						function(pl) pl:GiveAmmo(32, "ar2", true) end)
GM:AddPointShopItem("pulseammo",		ITEMCAT_AMMO,			7,				nil,							"30 pulse ammo",				nil,									"models/Items/combine_rifle_ammo01.mdl",						function(pl) pl:GiveAmmo(30, "pulse", true) end)
GM:AddPointShopItem("crossbowammo",		ITEMCAT_AMMO,			5,				nil,							"8 crossbow bolts",				nil,									"models/Items/CrossbowRounds.mdl",						function(pl) pl:GiveAmmo(8,	"XBowBolt",	true) end)
GM:AddPointShopItem("20nails",			ITEMCAT_AMMO,			15,				nil,			"Extra nails",						"20 extra nails for barricading.", 		"models/props_junk/cardboard_box004a.mdl", 			function(pl) pl:GiveAmmo(20, "GaussEnergy", true) end)
GM:AddPointShopItem("mkitcharge",			ITEMCAT_AMMO,			25,				nil,			"150 medical kit power",				nil,		"models/healthvial.mdl",		function(pl) pl:GiveAmmo(150, "Battery", true) end)


-- Tier 1
GM:AddPointShopItem("brassknuckles",	ITEMCAT_MELEE,			5,				"weapon_zs_brassknuckles").Model = "models/props_c17/utilityconnecter005.mdl"
GM:AddPointShopItem("knife",			ITEMCAT_MELEE,			10,				"weapon_zs_swissarmyknife")
GM:AddPointShopItem("zpplnk",			ITEMCAT_MELEE,			15,				"weapon_zs_plank")
GM:AddPointShopItem("zpfryp",			ITEMCAT_MELEE,			20,				"weapon_zs_fryingpan")
GM:AddPointShopItem("zpcpot",			ITEMCAT_MELEE,			20,				"weapon_zs_pot")
GM:AddPointShopItem("stunbaton",		ITEMCAT_MELEE,			25,				"weapon_zs_stunbaton")
GM:AddPointShopItem("axe",				ITEMCAT_MELEE,			30,				"weapon_zs_axe")
GM:AddPointShopItem("crowbar",			ITEMCAT_MELEE,			30,				"weapon_zs_crowbar")
GM:AddPointShopItem("hook",				ITEMCAT_MELEE,			35,				"weapon_zs_hook")
GM:AddPointShopItem("pipe",				ITEMCAT_MELEE,			40,				"weapon_zs_pipe")

GM:AddPointShopItem("shovel",			ITEMCAT_MELEE,			50,				"weapon_zs_shovel")
GM:AddPointShopItem("sledgehammer",		ITEMCAT_MELEE,			55,				"weapon_zs_sledgehammer")
GM:AddPointShopItem("butcherknf",		ITEMCAT_MELEE,			60,				"weapon_zs_butcherknife")

GM:AddPointShopItem("barricadekit",		ITEMCAT_TOOLS,			85,				"weapon_zs_barricadekit")
GM:AddPointShopItem("crphmr",			ITEMCAT_TOOLS,			25,				"weapon_zs_hammer",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_hammer") pl:GiveAmmo(5, "GaussEnergy") end)
GM:AddPointShopItem("wrench",			ITEMCAT_TOOLS,			20,				"weapon_zs_wrench").NoClassicMode = true
GM:AddPointShopItem("arsenalcrate",		ITEMCAT_TOOLS,			40,				"weapon_zs_arsenalcrate").Countables = "prop_arsenalcrate"
GM:AddPointShopItem("resupplybox",		ITEMCAT_TOOLS,			40,				"weapon_zs_resupplybox").Countables = "prop_resupplybox"


GM:AddPointShopItem("msgbeacon",		ITEMCAT_TOOLS,			10,				"weapon_zs_messagebeacon").Countables = "prop_messagebeacon"

item =
GM:AddPointShopItem("infturret",		ITEMCAT_TOOLS,			50,				"weapon_zs_gunturret",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret") pl:GiveAmmo(1, "thumper") end)
item.NoClassicMode = true
item.Countables = "prop_gunturret"

GM:AddPointShopItem("manhack",			ITEMCAT_TOOLS,			30,				"weapon_zs_manhack").Countables = "prop_manhack"


GM:AddPointShopItem("medkit",			ITEMCAT_TOOLS,			30,				"weapon_zs_medicalkit")




GM:AddPointShopItem("nade",		ITEMCAT_OTHER,			10,				"weapon_zs_grenade", nil, nil, "models/Items/grenadeAmmo.mdl")
GM:AddPointShopItem("detonationpack",		ITEMCAT_OTHER,			30,				"weapon_zs_detpack")



--Traits
GM:AddStartingItem("bf10hp",	ITEMCAT_TRINKETS, 10, nil, "Fit", "Increases survivability by increasing maximum health by a small amount.", "models/healthvial.mdl", function(pl) pl:SetMaxHealth(pl:GetMaxHealth() + 10) pl:SetHealth(pl:Health() + 10) end)
GM:AddStartingItem("bf25hp",	ITEMCAT_TRINKETS, 20, nil, "Tough", "Increases survivability by increasing maximum health.", "models/healthvial.mdl", function(pl) pl:SetMaxHealth(pl:GetMaxHealth() + 25) pl:SetHealth(pl:Health() + 25) end)
item = GM:AddStartingItem("5spd",	ITEMCAT_TRINKETS, 10, nil, "Quick", "Gives a slight bonus to running speed.", "models/props_junk/Shoe001a.mdl", function(pl) pl.HumanSpeedAdder = (pl.HumanSpeedAdder or 0) + 7 pl:ResetSpeed() end)
item.NoClassicMode = true
item.NoZombieEscape = true
item = GM:AddStartingItem("10spd",	ITEMCAT_TRINKETS, 15, nil, "Surged", "Gives a noticeable bonus to running speed.", "models/props_junk/garbage_coffeemug001a.mdl", function(pl) pl.HumanSpeedAdder = (pl.HumanSpeedAdder or 0) + 14 pl:ResetSpeed() end)
item.NoClassicMode = true
item.NoZombieEscape = true
GM:AddStartingItem("bfresist",	ITEMCAT_TRINKETS, 25, nil, "Resistant", "Resist poison damage by 50%", "models/props_lab/crematorcase.mdl", function(pl) pl.BuffResist = true end)
GM:AddStartingItem("bfregen",	ITEMCAT_TRINKETS, 25, nil, "Regenerative", "Recover 1 health every 6 seconds when under 50% health.", "models/healthvial.mdl", function(pl) pl.BuffRegenerative = true end)
GM:AddStartingItem("bfstrong",	ITEMCAT_TRINKETS, 25, nil, "Muscular", "Deal 20% more damage with melee weapons.", "models/props_lab/jar01a.mdl", function(pl) pl.BuffMuscular = true pl:DoMuscularBones() end)
GM:AddStartingItem("bfmedic",	ITEMCAT_TRINKETS, 25, nil, "Surgeon", "Medical Kit cooldown reduced by 30% \nMedic Gun effectiveness increased by 33%", "models/Items/HealthKit.mdl", function(pl) pl.BuffMedkit = true end)
GM:AddStartingItem("bfhandy",	ITEMCAT_TRINKETS, 25, nil, "Handy", "Increase repair rates by 25%", "models/props_c17/tools_wrench01a.mdl", function(pl) pl.BuffHandy = true end)

--Returns

GM:AddStartingItem("dbfhp",	ITEMCAT_RETURNS, -15, nil, "Weakness", "Reduces health by a significant amount in exchange for Worth.", "models/gibs/HGIBS.mdl", function(pl) pl:SetMaxHealth(pl:GetMaxHealth() - 30) pl:SetHealth(pl:GetMaxHealth()) end)
GM:AddStartingItem("dbfslow",	ITEMCAT_RETURNS, -5, nil, "Sluggish", "Reduces run speed by a significant amount in exchange for Worth.", "models/gibs/HGIBS.mdl", function(pl) pl.HumanSpeedAdder = (pl.HumanSpeedAdder or 0) - 20 pl:ResetSpeed() end)
GM:AddStartingItem("dbfnopickup",	ITEMCAT_RETURNS, -10, nil, "Noodle Arms", "Disallows picking up of objects in exchange for Worth.", "models/gibs/HGIBS.mdl", function(pl) pl.DebuffNoodlearms = true pl:DoNoodleArmBones() end)
GM:AddStartingItem("dbfnobuy",	ITEMCAT_RETURNS, -100, nil, "Banned for Life", "Disallows point purchases in exchange for Worth.", "models/gibs/HGIBS.mdl", function(pl) pl.ArsenalBan = true end)
GM:AddStartingItem("dbfbleed",	ITEMCAT_RETURNS, -15, nil, "Hemophilia", "Applies bleeding damage when hit in exchange for Worth.", "models/gibs/HGIBS.mdl", function(pl) pl.DebuffBleed = true end)
GM:AddStartingItem("dbfclumsy",	ITEMCAT_RETURNS, -25, nil, "Clumsy", "Makes you extremely easy to knock down in exchange for Worth.", "models/gibs/HGIBS.mdl", function(pl) pl.DebuffClumsy = true end)


-- These are the honorable mentions that come at the end of the round.

local function genericcallback(pl, magnitude) return pl:Name(), magnitude end
GM.HonorableMentions = {}
GM.HonorableMentions[HM_MOSTZOMBIESKILLED] = {Name = "Most zombies killed", String = "by %s, with %d killed zombies.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_MOSTDAMAGETOUNDEAD] = {Name = "Most damage to undead", String = "goes to %s, with a total of %d damage dealt to the undead.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_MOSTHEADSHOTS] = {Name = "Most headshot kills", String = "goes to %s, with a total of %s headshot kills.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_PACIFIST] = {Name = "Pacifist", String = "goes to %s for not killing a single zombie and still surviving!", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_MOSTHELPFUL] = {Name = "Most helpful", String = "goes to %s for assisting in the disposal of %d zombies.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_LASTHUMAN] = {Name = "Last Human", String = "goes to %s for being the last person alive.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_OUTLANDER] = {Name = "Outlander", String = "goes to %s for getting killed %d feet away from a zombie spawn.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_GOODDOCTOR] = {Name = "Good Doctor", String = "goes to %s for healing their team for %d points of health.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_HANDYMAN] = {Name = "Handy Man", String = "goes to %s for getting %d barricade assistance points.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_SCARECROW] = {Name = "Scarecrow", String = "goes to %s for killing %d poor crows.", Callback = genericcallback, Color = COLOR_WHITE}
GM.HonorableMentions[HM_MOSTBRAINSEATEN] = {Name = "Most brains eaten", String = "by %s, with %d brains eaten.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_MOSTDAMAGETOHUMANS] = {Name = "Most damage to humans", String = "goes to %s, with a total of %d damage given to living players.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_LASTBITE] = {Name = "Last Bite", String = "goes to %s for ending the round.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_USEFULTOOPPOSITE] = {Name = "Most useful to opposite team", String = "goes to %s for giving up a whopping %d kills!", Callback = genericcallback, Color = COLOR_RED}
GM.HonorableMentions[HM_STUPID] = {Name = "Stupid", String = "is what %s is for getting killed %d feet away from a zombie spawn.", Callback = genericcallback, Color = COLOR_RED}
GM.HonorableMentions[HM_SALESMAN] = {Name = "Salesman", String = "is what %s is for having %d points worth of items taken from their arsenal crate.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_WAREHOUSE] = {Name = "Warehouse", String = "describes %s well since they had their resupply boxes used %d times.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_DEFENCEDMG] = {Name = "Defender", String = "goes to %s for protecting humans from %d damage with defence boosts.", Callback = genericcallback, Color = COLOR_WHITE}
GM.HonorableMentions[HM_STRENGTHDMG] = {Name = "Alchemist", String = "is what %s is for boosting players with an additional %d damage.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_BARRICADEDESTROYER] = {Name = "Barricade Destroyer", String = "goes to %s for doing %d damage to barricades.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_NESTDESTROYER] = {Name = "Nest Destroyer", String = "goes to %s for destroying %d nests.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_NESTMASTER] = {Name = "Nest Master", String = "goes to %s for having %d zombies spawn through their nest.", Callback = genericcallback, Color = COLOR_LIMEGREEN}

-- Don't let humans use these models because they look like undead models. Must be lower case.
GM.RestrictedModels = {
	"models/player/zombie_classic.mdl",
	"models/player/zombie_classic_hbfix.mdl",
	"models/player/zombine.mdl",
	"models/player/zombie_soldier.mdl",
	"models/player/zombie_fast.mdl",
	"models/player/corpse1.mdl",
	"models/player/charple.mdl",
	"models/player/skeleton.mdl",
	"models/player/combine_soldier_prisonguard.mdl",
	"models/player/soldier_stripped.mdl",
	"models/player/zelpa/stalker.mdl",
	"models/player/fatty/fatty.mdl",
	"models/player/zombie_lacerator2.mdl"
}

-- If a person has no player model then use one of these (auto-generated).
GM.RandomPlayerModels = {}
for name, mdl in pairs(player_manager.AllValidModels()) do
	if not table.HasValue(GM.RestrictedModels, string.lower(mdl)) then
		table.insert(GM.RandomPlayerModels, name)
	end
end

GM.DeployableInfo = {}
function GM:AddDeployableInfo(class, name, wepclass)
	local tab = {Class = class, Name = name or "?", WepClass = wepclass}

	self.DeployableInfo[#self.DeployableInfo + 1] = tab
	self.DeployableInfo[class] = tab

	return tab
end
GM:AddDeployableInfo("prop_arsenalcrate", 		"Arsenal Crate", 		"weapon_zs_arsenalcrate")
GM:AddDeployableInfo("prop_resupplybox", 		"Resupply Box", 		"weapon_zs_resupplybox")
GM:AddDeployableInfo("prop_remantler", 			"Weapon Remantler", 	"weapon_zs_remantler")
GM:AddDeployableInfo("prop_messagebeacon", 		"Message Beacon", 		"weapon_zs_messagebeacon")
GM:AddDeployableInfo("prop_camera", 			"Camera",	 			"weapon_zs_camera")
GM:AddDeployableInfo("prop_gunturret", 			"Gun Turret",	 		"weapon_zs_gunturret")
GM:AddDeployableInfo("prop_gunturret_assault", 	"Assault Turret",	 	"weapon_zs_gunturret_assault")
GM:AddDeployableInfo("prop_gunturret_buckshot",	"Blast Turret",	 		"weapon_zs_gunturret_buckshot")
GM:AddDeployableInfo("prop_gunturret_rocket",	"Rocket Turret",	 	"weapon_zs_gunturret_rocket")
GM:AddDeployableInfo("prop_repairfield",		"Repair Field Emitter",	"weapon_zs_repairfield")
GM:AddDeployableInfo("prop_zapper",				"Zapper",				"weapon_zs_zapper")
GM:AddDeployableInfo("prop_zapper_arc",			"Arc Zapper",			"weapon_zs_zapper_arc")
GM:AddDeployableInfo("prop_ffemitter",			"Force Field Emitter",	"weapon_zs_ffemitter")
GM:AddDeployableInfo("prop_manhack",			"Manhack",				"weapon_zs_manhack")
GM:AddDeployableInfo("prop_manhack_saw",		"Sawblade Manhack",		"weapon_zs_manhack_saw")
GM:AddDeployableInfo("prop_drone",				"Drone",				"weapon_zs_drone")
GM:AddDeployableInfo("prop_drone_pulse",		"Pulse Drone",			"weapon_zs_drone_pulse")
GM:AddDeployableInfo("prop_drone_hauler",		"Hauler Drone",			"weapon_zs_drone_hauler")
GM:AddDeployableInfo("prop_rollermine",			"Rollermine",			"weapon_zs_rollermine")
GM:AddDeployableInfo("prop_tv",                   	 "TV",                    	"weapon_zs_tv")

GM.MaxSigils = 0

GM.DefaultRedeem = CreateConVar("zs_redeem", "4", FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY, "The amount of kills a zombie needs to do in order to redeem. Set to 0 to disable."):GetInt()
cvars.AddChangeCallback("zs_redeem", function(cvar, oldvalue, newvalue)
	GAMEMODE.DefaultRedeem = math.max(0, tonumber(newvalue) or 0)
end)

GM.WaveOneZombies = 0.11--math.Round(CreateConVar("zs_waveonezombies", "0.1", FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY, "The percentage of players that will start as zombies when the game begins."):GetFloat(), 2)
-- cvars.AddChangeCallback("zs_waveonezombies", function(cvar, oldvalue, newvalue)
-- 	GAMEMODE.WaveOneZombies = math.ceil(100 * (tonumber(newvalue) or 1)) * 0.01
-- end)

-- Game feeling too easy? Just change these values!
GM.ZombieSpeedMultiplier = math.Round(CreateConVar("zs_zombiespeedmultiplier", "1", FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY, "Zombie running speed will be scaled by this value."):GetFloat(), 2)
cvars.AddChangeCallback("zs_zombiespeedmultiplier", function(cvar, oldvalue, newvalue)
	GAMEMODE.ZombieSpeedMultiplier = math.ceil(100 * (tonumber(newvalue) or 1)) * 0.01
end)



-- This is a resistance, not for claw damage. 0.5 will make zombies take half damage, 0.25 makes them take 1/4, etc.
GM.ZombieDamageMultiplier = math.Round(CreateConVar("zs_zombiedamagemultiplier", "1", FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY, "Scales the amount of damage that zombies take. Use higher values for easy zombies, lower for harder."):GetFloat(), 2)
cvars.AddChangeCallback("zs_zombiedamagemultiplier", function(cvar, oldvalue, newvalue)
	GAMEMODE.ZombieDamageMultiplier = math.ceil(100 * (tonumber(newvalue) or 1)) * 0.01
end)

GM.TimeLimit = CreateConVar("zs_timelimit", "15", FCVAR_ARCHIVE + FCVAR_NOTIFY, "Time in minutes before the game will change maps. It will not change maps if a round is currently in progress but after the current round ends. -1 means never switch maps. 0 means always switch maps."):GetInt() * 60
cvars.AddChangeCallback("zs_timelimit", function(cvar, oldvalue, newvalue)
	GAMEMODE.TimeLimit = tonumber(newvalue) or 15
	if GAMEMODE.TimeLimit ~= -1 then
		GAMEMODE.TimeLimit = GAMEMODE.TimeLimit * 60
	end
end)

GM.RoundLimit = CreateConVar("zs_roundlimit", "3", FCVAR_ARCHIVE + FCVAR_NOTIFY, "How many times the game can be played on the same map. -1 means infinite or only use time limit. 0 means once."):GetInt()
cvars.AddChangeCallback("zs_roundlimit", function(cvar, oldvalue, newvalue)
	GAMEMODE.RoundLimit = tonumber(newvalue) or 3
end)

-- Static values that don't need convars...

-- Initial length for wave 1.
GM.WaveOneLength = 220

-- Add this many seconds for each additional wave.
GM.TimeAddedPerWave = 15

-- New players are put on the zombie team if the current wave is this or higher. Do not put it lower than 1 or you'll break the game.
GM.NoNewHumansWave = 4

-- Humans can not commit suicide if the current wave is this or lower.
GM.NoSuicideWave = 1

-- How long 'wave 0' should last in seconds. This is the time you should give for new players to join and get ready.
GM.WaveZeroLength = 150

-- Time humans have between waves to do stuff without NEW zombies spawning. Any dead zombies will be in spectator (crow) view and any living ones will still be living.
GM.WaveIntermissionLength = 60

-- Time in seconds between end round and next map.
GM.EndGameTime = 45

-- How many clips of ammo guns from the Worth menu start with. Some guns such as shotguns and sniper rifles have multipliers on this.
GM.SurvivalClips = 4 --2

-- How long do humans have to wait before being able to get more ammo from a resupply box?
GM.ResupplyBoxCooldown = 30

-- Put your unoriginal, 5MB Rob Zombie and Metallica music here.
GM.LastHumanSound = Sound("zombiesurvival/lasthuman.ogg")

-- Sound played when humans all die.
GM.AllLoseSound = Sound("zombiesurvival/music_lose.ogg")

-- Sound played when humans survive.
GM.HumanWinSound = Sound("zombiesurvival/music_win.ogg")

-- Sound played to a person when they die as a human.
GM.DeathSound = Sound("music/stingers/HL1_stinger_song28.mp3")

-- Fetch map profiles and node profiles from noxiousnet database?
GM.UseOnlineProfiles = false

-- This multiplier of points will save over to the next round. 1 is full saving. 0 is disabled.
-- Setting this to 0 will not delete saved points and saved points do not "decay" if this is less than 1.
GM.PointSaving = 0

-- Lock item purchases to waves. Tier 2 items can only be purchased on wave 2, tier 3 on wave 3, etc.
-- HIGHLY suggested that this is on if you enable point saving. Always false if objective map, zombie escape, classic mode, or wave number is changed by the map.
GM.LockItemTiers = false

-- Don't save more than this amount of points. 0 for infinite.
GM.PointSavingLimit = 0

-- For Classic Mode
GM.WaveIntermissionLengthClassic = 20
GM.WaveOneLengthClassic = 120
GM.TimeAddedPerWaveClassic = 10

-- Max amount of damage left to tick on these. Any more pending damage is ignored.
GM.MaxPoisonDamage = 50
GM.MaxBleedDamage = 50

-- Give humans this many points when the wave ends.
GM.EndWavePointsBonus = 0

-- Also give humans this many points when the wave ends, multiplied by (wave - 1)
GM.EndWavePointsBonusPerWave = 0
