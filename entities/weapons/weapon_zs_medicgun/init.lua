INC_SERVER()

SWEP.Primary.Projectile = "projectile_healdart"
SWEP.Primary.ProjVelocity = 2000

function SWEP:EntModify(ent)
	local owner = self:GetOwner()

	ent:SetSeeked(self:GetSeekedPlayer() or nil)
	if owner.BuffMedkit then
		ent.Heal = self.Heal * (owner.MedDartEffMul * 1.33)
	else
		ent.Heal = self.Heal * (owner.MedDartEffMul or 1)
	end
	ent.BuffDuration = self.BuffDuration
end
