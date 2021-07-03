AddCSLuaFile()

SWEP.PrintName = "'Waraxe' Handgun"
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_c17/concrete_barrier001a.mdl", bone = "v_weapon.USP_Parent", rel = "", pos = Vector(-0.69, -3.5, -1.5), angle = Angle(0, 0, 90), size = Vector(0.019, 0.019, 0.019), color = Color(203, 233, 236, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base+++"] = { type = "Model", model = "models/props_c17/canister02a.mdl", bone = "v_weapon.USP_Parent", rel = "base+", pos = Vector(-1.201, 0, -0.7), angle = Angle(90, 0, 0), size = Vector(0.129, 0.129, 0.059), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_junk/cinderblock01a.mdl", bone = "v_weapon.USP_Parent", rel = "base", pos = Vector(0.5, 3, 0), angle = Angle(0, 90, 90), size = Vector(0.119, 0.119, 0.119), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_c17/canister02a.mdl", bone = "v_weapon.USP_Parent", rel = "base+", pos = Vector(-1.201, 0, 0.699), angle = Angle(90, 0, 0), size = Vector(0.129, 0.129, 0.059), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_c17/concrete_barrier001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.659, 2.4, -3.651), angle = Angle(0, 85, 0), size = Vector(0.019, 0.019, 0.019), color = Color(203, 233, 236, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base+++"] = { type = "Model", model = "models/props_c17/canister02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base+", pos = Vector(-1.201, 0, -0.7), angle = Angle(90, 0, 0), size = Vector(0.129, 0.129, 0.059), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_junk/cinderblock01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.5, 3, 0), angle = Angle(0, 90, 90), size = Vector(0.119, 0.119, 0.119), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_c17/canister02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base+", pos = Vector(-1.201, 0, 0.699), angle = Angle(90, 0, 0), size = Vector(0.129, 0.129, 0.059), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_battleaxe"

SWEP.Primary.Damage = 14
SWEP.Primary.NumShots = 3
SWEP.Primary.Delay = 0.2

SWEP.Primary.ClipSize = 14
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Sound = ")weapons/usp/usp_unsil-1.wav"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Tier = 2


GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_HEADSHOT_MULTI, 0.07)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Halberd' Handgun", "Deals extra damage to zombies with full health, but less overall damage", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.85

	wept.BulletCallback = function(attacker, tr, dmginfo)
		if SERVER then
			local hitent = tr.Entity
			if hitent:IsValidLivingZombie() and hitent:Health() == hitent:GetMaxHealthEx() and gamemode.Call("PlayerShouldTakeDamage", hitent, attacker) then
				hitent:TakeSpecialDamage(hitent:Health() * 0.1, DMG_DIRECT, attacker, attacker:GetActiveWeapon(), tr.HitPos)
			end
		end
	end
end)

function SWEP:EmitFireSound()
	self:EmitSound(self.Primary.Sound, 80, 75)
end
