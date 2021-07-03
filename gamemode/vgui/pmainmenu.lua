local function HelpMenuPaint(self)
	Derma_DrawBackgroundBlur(self, self.Created)
	Derma_DrawBackgroundBlur(self, self.Created)
end



function GM:ShowHelp()
	if self.HelpMenu and self.HelpMenu:IsValid() then
		self.HelpMenu:Remove()
	end

	PlayMenuOpenSound()

	local screenscale = BetterScreenScale()
	local menu = vgui.Create("Panel")
	pMenu = menu
	menu:SetSize(screenscale * 420, ScrH())
	menu:Center()
	menu.Paint = HelpMenuPaint
	menu.Created = SysTime()

	local header = EasyLabel(menu, self.Name, "ZSHUDFont")
	header:SetContentAlignment(8)
	header:DockMargin(0, ScrH() * 0.25, 0, 64)
	header:Dock(TOP)

	local buttonhei = 32 * screenscale

	local but = vgui.Create("DButton", menu)
	
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("How to play")
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepHelp() menu:Remove() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("Options")
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepOptions() end
	
	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("Worth Menu")
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepWorth() menu:Remove() end

	--[[
	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("Weapon Database")
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepWeapons() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("Skills")
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() GAMEMODE:ToggleSkillWeb() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("Credits")
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepCredits() end
	--]]

	
	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("Close")
	but:SetTall(buttonhei)
	but:DockMargin(0, 24, 0, 0)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() menu:Remove() end

	menu:MakePopup()
end
