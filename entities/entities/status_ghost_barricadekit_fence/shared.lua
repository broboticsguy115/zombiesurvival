ENT.Type = "anim"
ENT.Base = "status_ghost_base"
ENT.Model = Model("models/props_c17/fence02a.mdl")

ENT.GhostModel = Model("models/props_c17/fence02a.mdl")
ENT.GhostRotation = Angle(270, 0, 0)
ENT.GhostHitNormalOffset = 55
ENT.GhostEntity = "prop_aegisfence"
ENT.GhostWeapon = "weapon_zs_barricadekit"
ENT.GhostDistance = 130
--ENT.GhostLimitedNormal = 0.75
ENT.GhostFlatGround = false

function ENT:RecalculateValidity()
		local owner = self:GetOwner()
	if not owner:IsValid() then return end

	if SERVER or MySelf == owner then
		self:SetRotation(math.NormalizeAngle(owner:GetInfoNum("_zs_ghostrotation", 0)))
	end

	local rotation = self.GhostNoRotation and 0 or self:GetRotation()
	local eyeangles = owner:EyeAngles()
	local shootpos = owner:GetShootPos()
	local entity
	local tr = util.TraceLine({start = shootpos, endpos = shootpos + owner:GetAimVector() * 130, mask = MASK_SOLID_BRUSHONLY, filter = owner})

	if tr.HitWorld and not tr.HitSky or tr.HitNonWorld and self.GhostPlaceOnEntities then
		if self.GhostHitNormalOffset then
			tr.HitPos = tr.HitPos + tr.HitNormal * self.GhostHitNormalOffset
		end

		local rot = self.GhostRotation
		eyeangles = tr.HitNormal:Angle()
		eyeangles:RotateAroundAxis(eyeangles:Right(), rot.pitch)
		eyeangles:RotateAroundAxis(eyeangles:Up(), rot.yaw)
		eyeangles:RotateAroundAxis(eyeangles:Forward(), rot.roll)

		local valid = true
		
		if self.GhostDistance then
			for _, ent in pairs(ents.FindInSphere(tr.HitPos, self.GhostDistance)) do
				if ent and ent:IsValid() then
					if self.GhostEntityWildCard then
						if self.GhostEntityWildCard == ent:GetClass():sub(1, #self.GhostEntityWildCard) then
							--valid = false -- not this one
							break
						end
					elseif ent:GetClass() == self.GhostEntity then
						--valid = false -- or this one
						break
					end
				end
			end
		end

		if valid and SERVER and GAMEMODE:EntityWouldBlockSpawn(self) then -- This isn't predicted but why would they be in the zombie spawn...
			valid = false -- not this one either
		end

		if valid then
			valid = self:CustomValidate(tr) -- nope
		end

		entity = tr.Entity

		self:SetValidPlacement(valid)
	else
		local rot = self.GhostNoTraceRot
		if rot then
			eyeangles:RotateAroundAxis(eyeangles:Right(), rot.pitch)
			eyeangles:RotateAroundAxis(eyeangles:Up(), rot.yaw)
			eyeangles:RotateAroundAxis(eyeangles:Forward(), rot.roll)
		end

		self:SetValidPlacement(false) -- no
	end

	if tr.HitNormal.z >= 0.75 then
		eyeangles:RotateAroundAxis(eyeangles[self.GhostRotateFunction](eyeangles), owner:GetAngles().yaw + rotation)
	else
		eyeangles:RotateAroundAxis(eyeangles[self.GhostRotateFunction](eyeangles), rotation)
	end

	local pos, ang = tr.HitPos, eyeangles
	self:SetPos(pos)
	self:SetAngles(ang)

	return pos, ang, entity
end