INC_SERVER()

function SWEP:Deploy()
	gamemode.Call("WeaponDeployed", self:GetOwner(), self)

	self.IdleAnimation = CurTime() + self:SequenceDuration()

	self:SpawnGhost()

	return true
end

function SWEP:OnRemove()
	self:RemoveGhost()
end

function SWEP:Holster()
	self:RemoveGhost()
	return true
end

function SWEP:SpawnGhost()
	local owner = self:GetOwner()
	if owner and owner:IsValid() then
		if self.Shape == 1 then
			owner:GiveStatus("ghost_barricadekit")
		elseif self.Shape == 2 then
			owner:GiveStatus("ghost_barricadekit_concrete")
		elseif self.Shape == 3 then
			owner:GiveStatus("ghost_barricadekit_fence")
		end
	end
end

function SWEP:RemoveGhost()
	local owner = self:GetOwner()
	if owner and owner:IsValid() then
		owner:RemoveStatus("ghost_barricadekit", false, true)
		owner:RemoveStatus("ghost_barricadekit_concrete", false, true)
		owner:RemoveStatus("ghost_barricadekit_fence", false, true)
	end
end

function SWEP:Think()
	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end
end

function SWEP:Reload()
	local owner = self:GetOwner()
	if owner and owner:IsValid() then
		if owner:KeyPressed(IN_RELOAD) and not self:GetOwner():KeyDown(IN_ATTACK) and not self:GetOwner():KeyDown(IN_ATTACK2) then
			if self.Shape == 3 then
				self.Shape = 1
			elseif self.Shape == 1 then
				self.Shape = 2
			elseif self.Shape == 2 then
				self.Shape = 3
			end
			self:RemoveGhost()
			self:SpawnGhost()
		end
	end
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	local owner = self:GetOwner()
	if not gamemode.Call("CanPlaceNail", owner) then return false end

	if self.Shape == 1 then
		status = owner.status_ghost_barricadekit
	elseif self.Shape == 2 then
		status = owner.status_ghost_barricadekit_concrete
	elseif self.Shape == 3 then
		status = owner.status_ghost_barricadekit_fence
	end
	if not (status and status:IsValid()) then return end
	status:RecalculateValidity()
	if not status:GetValidPlacement() then return end

	local pos, ang = status:RecalculateValidity()
	if not pos or not ang then return end

	self:SetNextPrimaryAttack(CurTime() + self.Primary.Delay)

	if self.Shape == 1 then
		ent = ents.Create("prop_aegisboard")
		self:TakePrimaryAmmo(5)
	end
	if self.Shape == 2 then
		ent = ents.Create("prop_aegisconcrete")
		self:TakePrimaryAmmo(10)
	end
	if self.Shape == 3 then
		ent = ents.Create("prop_aegisfence")
		self:TakePrimaryAmmo(20)
	end
	if ent:IsValid() then
		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:Spawn()

		ent:EmitSound("npc/dog/dog_servo12.wav")

		ent:GhostAllPlayersInMe(5)

		ent:SetObjectOwner(owner)

		local stored = owner:PopPackedItem(ent:GetClass())
		if stored then
			ent:SetObjectHealth(stored[1])
		end

		
	end
end
