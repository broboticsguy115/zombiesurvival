hook.Add("InitPostEntityMap", "Adding", function()
	

	local ent = ents.Create("prop_dynamic_override")
	if ent:IsValid() then
		ent:SetPos(Vector(1200, -45, -80))
		ent:SetAngles(Angle(0, 90, 90))
		ent:SetKeyValue("solid", "6")
		ent:SetModel(Model("models/props_wasteland/interior_fence003b.mdl"))
		ent:Spawn()
		ent:SetColor(Color(0, 0, 0, 0))
	end
end)
