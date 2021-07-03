SWEP.PrintName = "'Aegis' Blockade Kit"
SWEP.Description = "An extremely powerful tool that converts spare scrap into placeable blockades. \nUse PRIMARY FIRE to deploy a blockade.\nUse SECONADRY FIRE to rotate the blockade. \nUse RELOAD to change the shape of the blockade. \nWARNING: Does not come with spare scrap!"
SWEP.Slot = 4
SWEP.SlotPos = 0

SWEP.ViewModel = "models/weapons/c_rpg.mdl"
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"

SWEP.Primary.ClipSize = 20
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "scrap"
SWEP.Primary.Delay = 1.25
SWEP.Primary.DefaultClip = 0

SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Ammo = "dummy"
SWEP.Secondary.Automatic = false

SWEP.UseHands = true

SWEP.MaxStock = 5
SWEP.Shape = 1

if CLIENT then
	SWEP.ViewModelFOV = 60
end

SWEP.WalkSpeed = SPEED_SLOWEST

function SWEP:Initialize()
	self:SetWeaponHoldType("rpg")
	GAMEMODE:DoChangeDeploySpeed(self)
end

function SWEP:Deploy()
	GAMEMODE:DoChangeDeploySpeed(self)

	return true
end

function SWEP:CanPrimaryAttack()
	local owner = self:GetOwner()
	local place1 = nil
	local place2 = nil
	local place3 = nil

	if owner:IsHolding() or owner:GetBarricadeGhosting() then return false end

	if self:GetPrimaryAmmoCount() <= 0 then
		self:EmitSound("buttons/button10.wav")
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
		return false
	end
	
	if self:GetPrimaryAmmoCount() >= 5 and self.Shape == 1 then
		place1 = true
	else
		place1 = false
	end
	
	if self:GetPrimaryAmmoCount() >= 10 and self.Shape == 2 then
		place2 = true
	else
		place2 = false
	end
	
	if self:GetPrimaryAmmoCount() >= 20 and self.Shape == 3 then
		place3 = true
	else
		place3 = false
	end
	
	
	if place1 or place2 or place3 then
		return true
	else
		return false
	end
end

function SWEP:SecondaryAttack()
end



util.PrecacheModel("models/props_debris/wood_board05a.mdl")
util.PrecacheModel("models/props_c17/concrete_barrier001a.mdl")
util.PrecacheModel("models/props_c17/fence02a.mdl")
util.PrecacheSound("npc/dog/dog_servo12.wav")
