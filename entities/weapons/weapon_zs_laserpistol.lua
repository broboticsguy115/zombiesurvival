AddCSLuaFile()

if CLIENT then
	SWEP.PrintName = "'Nano' Laser Pistol"
	--SWEP.Description = "Although the Z9000 does not deal that much damage, the pulse shots it fires will slow targets."
	SWEP.Slot = 1
	SWEP.SlotPos = 0
	
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "Cylinder"
	SWEP.HUD3DPos = Vector(1.6, 0.25, -1)
	SWEP.HUD3DScale = 0.010

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.ViewModelBoneMods = {
		["Bullet1"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["Bullet2"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["Bullet3"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["Bullet4"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["Bullet5"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["Bullet6"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
	}



	SWEP.VElements = {
	["bullet1++++"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "Bullet5", rel = "", pos = Vector(0.009, 0.008, -0.004), angle = Angle(0, 0, 0), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name2"] = { type = "Model", model = "models/props_combine/combine_mine01.mdl", bone = "Cylinder", rel = "", pos = Vector(0, 0, -1.514), angle = Angle(0, 0, 0), size = Vector(0.096, 0.096, 0.324), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["coolenergy"] = { type = "Model", model = "models/props_combine/combine_fence01a.mdl", bone = "Python", rel = "", pos = Vector(0, -1.547, 0), angle = Angle(0, 180, 0), size = Vector(0.065, 0.02, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bullet1++"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "Bullet3", rel = "", pos = Vector(0.009, 0.008, -0.004), angle = Angle(0, 0, 0), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["propreload"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "Python", rel = "", pos = Vector(0, -0.616, 4.053), angle = Angle(180, 0, 0), size = Vector(0.024, 0.024, 0.18), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_helicopter/combine_helicopter01", skin = 0, bodygroup = {} },
	["bullet1"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "Bullet1", rel = "", pos = Vector(0.009, 0.009, -0.004), angle = Angle(0, 0, 0), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bullet1+++++"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "Bullet6", rel = "", pos = Vector(0.009, 0.008, -0.004), angle = Angle(0, 0, 0), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bullet1+++"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "Bullet4", rel = "", pos = Vector(0.009, 0.008, -0.004), angle = Angle(0, 0, 0), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["future_barrel"] = { type = "Model", model = "models/maxofs2d/thruster_propeller.mdl", bone = "Python", rel = "", pos = Vector(0, 0, 0.777), angle = Angle(0, 0, 0), size = Vector(0.209, 0.209, 0.209), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_helicopter/combine_helicopter02", skin = 0, bodygroup = {} },
	["gunhandle"] = { type = "Model", model = "models/weapons/w_pist_glock18.mdl", bone = "Python", rel = "", pos = Vector(0, 4.208, -2.893), angle = Angle(90, -90, 0), size = Vector(0.69, 0.796, 0.691), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_citadel/combine_citadel001", skin = 0, bodygroup = {} },
	["glowy"] = { type = "Sprite", sprite = "sprites/blueglow1", bone = "Python", rel = "", pos = Vector(-0.076, -0.650, -0.650), size = { x = 1.000, y = 1.000 }, color = Color(0, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["endflick"] = { type = "Model", model = "models/props_combine/combine_barricade_med01a.mdl", bone = "Python", rel = "", pos = Vector(0.007, -0.663, -2.837), angle = Angle(0, 90, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bullet1+"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "Bullet2", rel = "", pos = Vector(0.009, 0.008, -0.004), angle = Angle(0, 0, 0), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "Python", rel = "", pos = Vector(0, -0.237, 1.11), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.569), color = Color(210, 210, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_combine/combine_generator01.mdl", bone = "Python", rel = "", pos = Vector(-0.35, -1.515, 2.319), angle = Angle(180, 0, 0), size = Vector(0.025, 0.025, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name3"] = { type = "Model", model = "models/props_combine/tprotato2_chunk05.mdl", bone = "Python", rel = "", pos = Vector(-0.413, -1.53, 0.545), angle = Angle(13.362, -6.145, -40.628), size = Vector(0.126, 0.126, 0.126), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["frame"] = { type = "Model", model = "models/props_phx/construct/metal_wire_angle360x2.mdl", bone = "Python", rel = "", pos = Vector(0, -0.274, -1.851), angle = Angle(0, 0, 0), size = Vector(0.014, 0.014, 0.075), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["propreload+"] = { type = "Model", model = "models/maxofs2d/hover_rings.mdl", bone = "Python", rel = "", pos = Vector(0, -0.616, -0.891), angle = Angle(180, 0, 0), size = Vector(0.029, 0.029, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_dropship/combine_fenceglowb", skin = 0, bodygroup = {} },
	["coolenergy+"] = { type = "Model", model = "models/props_combine/combine_fence01b.mdl", bone = "Python", rel = "", pos = Vector(-0.018, -1.547, 0), angle = Angle(0, 0, 0), size = Vector(0.065, 0.02, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name3+"] = { type = "Model", model = "models/props_combine/tprotato2.mdl", bone = "Python", rel = "", pos = Vector(0.035, -0.575, -3.764), angle = Angle(13.362, -90, 180), size = Vector(0.05, 0.019, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["switch"] = { type = "Model", model = "models/maxofs2d/button_06.mdl", bone = "Python", rel = "", pos = Vector(0.461, 0.300, -2.572), angle = Angle(-90, 0, 0), size = Vector(0.046, 0.046, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
	["ar2"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.596, 0.846, -4.042), angle = Angle(-90, 0, 0), size = Vector(0.624, 0.5, 0.782), color = Color(210, 210, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["end+"] = { type = "Model", model = "models/props_combine/tprotato2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.323, 1.432, -4.186), angle = Angle(91.268, 0, 0), size = Vector(0.064, 0.017, 0.059), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["mine"] = { type = "Model", model = "models/props_combine/combine_mine01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.686, 1.069, -3.55), angle = Angle(-90, 0, 0), size = Vector(0.179, 0.179, 0.263), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["gunhandle"] = { type = "Model", model = "models/weapons/w_pist_glock18.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.056, 1.171, 1.906), angle = Angle(-180, 180, 0), size = Vector(0.947, 0.947, 0.947), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_citadel/combine_citadel001", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_combine/combine_generator01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.75, 0, -6.075), angle = Angle(0, 90, -90), size = Vector(0.046, 0.046, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["end"] = { type = "Model", model = "models/props_combine/tprotato2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.852, 0.943, -3.822), angle = Angle(91.268, 0, 0), size = Vector(0.064, 0.017, 0.059), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["coolenergy"] = { type = "Model", model = "models/props_combine/combine_fence01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.633, 0.976, -5.948), angle = Angle(-180, -90, -90), size = Vector(0.09, 0.09, 0.039), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

sound.Add( {
	name = "laser_pist",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 140,
	pitch = {4000, 4005},
	sound = "weapons/stunstick/alyx_stunner1.wav"
} )

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "revolver"

SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.ReloadSound = Sound("buttons/combine_button_locked.wav")
SWEP.Primary.Sound = Sound("laser_pist")
SWEP.Primary.Damage = 43
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 1

SWEP.Primary.ClipSize = 6
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pulse"
SWEP.Primary.DefaultClip = 50
SWEP.Tier = 3

SWEP.ConeMax = 2
SWEP.ConeMin = 1.5

SWEP.IronSightsPos = Vector(-4.7, 7.232, -0.26)
SWEP.IronSightsAng = Vector(0, 0, 0)


SWEP.TracerName = "ToolTracer"



SWEP.PointsMultiplier = GAMEMODE.PulsePointsMultiplier

function SWEP.BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	if ent:IsValidZombie() then
		ent:AddLegDamageExt(4.5, attacker, attacker:GetActiveWeapon(), SLOWTYPE_PULSE)
	end

	if IsFirstTimePredicted() then
		util.CreatePulseImpactEffect(tr.HitPos, tr.HitNormal)
	end
end
