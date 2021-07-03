INC_CLIENT()

SWEP.DrawCrosshair = false
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false

function SWEP:DrawHUD()
	local wid, hei = 384, 16
	local x, y = ScrW() - wid - 64, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFont")

	local charges = self:GetPrimaryAmmoCount()
	local chargetxt = "Scrap: " .. charges
	local costtxt = "Blockade cost:"
	local costtxt1 = "Fence (20)"
	local costtxt2 = "Concrete (10)"
	local costtxt3 = "Board (5)"
	if charges > 4 then
		draw.SimpleText(chargetxt, "ZSHUDFont", x + wid, texty, COLOR_GREEN, TEXT_ALIGN_RIGHT)
	else
		draw.SimpleText(chargetxt, "ZSHUDFont", x + wid, texty, COLOR_DARKRED, TEXT_ALIGN_RIGHT)
	end
	
	draw.SimpleText(costtxt, "ZSHUDFontSmaller", x + wid - 5, texty - 95, COLOR_GRAY, TEXT_ALIGN_RIGHT)
	draw.SimpleText(costtxt1, "ZSHUDFontSmall", x + wid - 10, texty - 75, COLOR_GRAY, TEXT_ALIGN_RIGHT)
	draw.SimpleText(costtxt2, "ZSHUDFontSmall", x + wid - 0, texty - 50, COLOR_GRAY, TEXT_ALIGN_RIGHT)
	draw.SimpleText(costtxt3, "ZSHUDFontSmall", x + wid - 20, texty - 25, COLOR_GRAY, TEXT_ALIGN_RIGHT)

	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	self:DrawCrosshairDot()
end

function SWEP:Reload()
	if self:GetOwner():KeyPressed(IN_RELOAD) and not self:GetOwner():KeyDown(IN_ATTACK) and not self:GetOwner():KeyDown(IN_ATTACK2) then
		self:EmitSound("common/wpn_denyselect.wav")
	end
end

function SWEP:Deploy()
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	return true
end

function SWEP:GetViewModelPosition(pos, ang)
	return pos, ang
end

function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end

function SWEP:PrimaryAttack()
end



function SWEP:Think()
	if self:GetOwner():KeyDown(IN_ATTACK2) and not self:GetOwner():KeyDown(IN_RELOAD) then
		self:RotateGhost(FrameTime() * 60)
	elseif self:GetOwner():KeyDown(IN_ATTACK2) and self:GetOwner():KeyDown(IN_RELOAD) then
		self:RotateGhost(FrameTime() * -60)
	end
end

local nextclick = 0
local kityaw = CreateClientConVar("zs_barricadekityaw", 90, false, true)
local kitpitch = CreateClientConVar("zs_barricadekitpit", 0, false, true)
function SWEP:RotateGhost(amount)
	if nextclick <= RealTime() then
		surface.PlaySound("npc/headcrab_poison/ph_step4.wav")
		nextclick = RealTime() + 0.3
	end
	RunConsoleCommand("zs_barricadekityaw", math.NormalizeAngle(kityaw:GetFloat() + amount))
	RunConsoleCommand("_zs_ghostrotation", math.NormalizeAngle(GetConVar("_zs_ghostrotation"):GetFloat() + amount))
end
