function RemoveAllTraits()
	-- Remove all traits
	local removedTraitData = {}
	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
		table.insert(removedTraitData, { Name = traitData.Name, Rarity = traitData.Rarity })
	end

	for i, traitData in pairs(removedTraitData) do
		RemoveTrait( CurrentRun.Hero, traitData.Name )
	end
	--Reload equipment
	EquipWeaponUpgrade(CurrentRun.Hero)
	UnequipKeepsake(CurrentRun.Hero)
	EquipKeepsake(CurrentRun.Hero)
	UnequipAssist(CurrentRun.Hero)
	EquipAssist(CurrentRun.Hero)
end

function ModDebugPrint(text, delay, destroy)
	if delay == nil then
		delay = 5
	end
	Destroy({Ids = ScreenAnchors.HoldDisplayId})
	ScreenAnchors.HoldDisplayId = SpawnObstacle({ Name = "BlankObstacle", Group = "Events", DestinationId = CurrentRun.Hero.ObjectId })
	Attach({ Id = ScreenAnchors.HoldDisplayId, DestinationId = CurrentRun.Hero.ObjectId })
	CreateTextBox({ Id = ScreenAnchors.HoldDisplayId, Text = text, FontSize = 32, OffsetX = 0, OffsetY = -150, Color = Color.Yellow, Font = "AlegreyaSansSCBold", Justification = "Center" })
	wait(delay, RoomThreadName)
	if delay > 0 then
		Destroy({Ids = ScreenAnchors.HoldDisplayId})
		ScreenAnchors.HoldDisplayId = nil
	end
end

function DisplayStats()
	UpdateStats()
	local Xspacer = -25
	local Yspacer = 27
	--UI
	ScreenAnchors.StatsPanel1 = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 450, Y = 160})
	ScreenAnchors.StatsPanel2 = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 1100, Y = 160})
	ScreenAnchors.StatsBackground = DeepCopyTable(ScreenData.StatsBackground)
	local components = ScreenAnchors.StatsBackground.Components
	components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "Combat_UI", X = 830, Y = 400})
	components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "Combat_UI", X = 490, Y = 464 })
	components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "Combat_UI", X = 1710, Y = 423 })
	SetScaleY({Id = components.LeftPart.Id, Fraction = 1.3})
	SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.3})
	SetScaleX({Id = components.MiddlePart.Id, Fraction = 10})
	SetScaleY({Id = components.RightPart.Id, Fraction = 1.3})
	StatsData.ComponentIds = GetAllIds(components)
	local index = 0
	--General Stats
	string = "General Stats"
	CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 125, OffsetY = index * Yspacer,
	Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
	ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })

	index = index + 2
	local string = "Max Health : "..StatsData.TotalHealth.." ("..StatsData.DefaultHealth.."+"..StatsData.BonusHealth..")"
	CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = { 255, 40, 40, 255 },
	Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
	ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })

	index = index + 1
	local string = "Death defiance heal : "..(StatsData.TotalDefianceHeal * 100).."% ("..(StatsData.DefaultDefianceHeal * 100).."%+"..(StatsData.BonusDefianceHeal * 100).."%)"
	CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = { 255, 40, 40, 255 },
	Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
	ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })

	if StatsData.BackstabDamageBonus ~= 0 then
		index = index + 1
		string = "Backstab damage : "..((StatsData.BackstabDamageBonus + 1) * 100).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.LightPurple,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.AmmoStoredDamageBonus ~= 0 then
		index = index + 1
		string = "Damage to enemies with Casts in them : "..((StatsData.AmmoStoredDamageBonus + 1) * 100).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.LightSalmon,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.DoorHeal ~= 0 then
		index = index + 1
		string = "Next chamber heal : "..StatsData.DoorHeal
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.LawnGreen,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	index = index + 1
	string = "Dash count : "..StatsData.TotalDash.." ("..StatsData.DefaultDash.."+"..StatsData.BonusDash..")"
	CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Orange,
	Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
	ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })

	if StatsData.DashBoonDamage ~= 0 then
		index = index + 1
		string = "Dash damage : "..StatsData.DashBoonDamage
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Yellow,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.DashBonusCritChance ~= 0 then
		index = index + 1
		string = "Dash attack critical chance : "..(100 * StatsData.DashBonusCritChance).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.ForestGreen,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.WeaponBonusDamage ~= 0 then
		index = index + 1
		string = "Attack damage : +"..((StatsData.WeaponBonusDamage - 1) * 100).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Yellow,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.WeaponBonusCritChance ~= 0 then
		index = index + 1
		string = "Attack critical chance : "..(100 * StatsData.WeaponBonusCritChance).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Green,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	index = index + 1
	if StatsData.CastBonusDamage == 0 then
		StatsData.CastBonusDamage = StatsData.DefaultCastDamage
	end
	string = "Cast damage : "..StatsData.TotalCastDamage.."("..StatsData.CastBonusDamage.."+"..(StatsData.CastBonusDamageMultiplier * 100).."%)"
	CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Yellow,
	Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
	ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })

	if StatsData.CastBonusCritChance ~= 0 then
		index = index + 1
		string = "Cast critical chance : "..(100 * StatsData.CastBonusCritChance).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Green,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.SpecialBonusDamage ~= 0 then
		index = index + 1
		string = "Special damage : +"..((StatsData.SpecialBonusDamage - 1) * 100).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Yellow,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.SpecialBonusCritChance ~= 0 then
		index = index + 1
		string = "Special critical chance : "..(100 * StatsData.SpecialBonusCritChance).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Green,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.DashBonusDamage ~= 0 then
		index = index + 1
		string = "Dash attack damage : +"..((StatsData.DashBonusDamage - 1) * 100).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Yellow,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.GlobalBonusCritChance ~= 0 then
		index = index + 1
		string = "Global critical chance : "..(100 * StatsData.GlobalBonusCritChance).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Green,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	index = index + 1
	string = "Critical damage : "..StatsData.TotalCritDamage.."% ("..StatsData.DefaultCritDamage.."%+"..(StatsData.BonusCritDamage * 100).."%)"
	CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Green,
	Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
	ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })

	if StatsData.BonusArmorCritDamage ~= 0 then
		index = index + 1
		string = "Critical damage to armor : "..((StatsData.BonusArmorCritDamage * 100) + StatsData.TotalCritDamage).."% (+"..(StatsData.BonusArmorCritDamage * 100).."%)"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.Green,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end
	--Effects
	index = index + 2
	string = "Effects"
	CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 125, OffsetY = (index * Yspacer),
	Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
	ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	index = index + 1

	if StatsData.CanWeaponDeflect then
		index = index + 1
		string = "Attack deflect : true"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.CanCastDeflect then
		index = index + 1
		string = "Cast deflect : true"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.CanSpecialDeflect then
		index = index + 1
		string = "Special deflect : true"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.CanDashDeflect then
		index = index + 1
		string = "Dash deflect : true"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.DeflectDamageMultiplier ~= 0 then
		index = index + 1
		string = "Deflected projectile damage : +"..(StatsData.DeflectDamageMultiplier * 100).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.ReducedTrapDamageMultiplier ~= 1 then
		index = index + 1
		string = "Trap damage : "..(StatsData.ReducedTrapDamageMultiplier * 100).."% (-"..((1 - StatsData.ReducedTrapDamageMultiplier) * 100).."%)"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.ReducedEnemyDamage ~= 1 then
		index = index + 1
		string = "Enemy damage : "..((1 - StatsData.ReducedEnemyDamage) * 100).."% (-"..(StatsData.ReducedEnemyDamage * 100).."%)"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.DefianceProtectionDuration ~= 0 then
		index = index + 1
		string = "Death defiance invincibility period : "..StatsData.DefianceProtectionDuration.."s"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end

	if StatsData.BackstabBonusAfterDeflect ~= 0 then
		index = index + 1
		string = "Post deflection backstab damage bonus : +"..(StatsData.BackstabBonusAfterDeflect * 100).."%"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end
	--Unique Effects
	index = index + 2
	string = "Unique Effects"
	CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 125, OffsetY = (index * Yspacer),
	Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
	ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	index = index + 1

	if StatsData.AthenaBarrier ~= 0 then
		index = index + 1
		string = "Athena barrier (Cooldown : "..StatsData.AthenaBarrier.."s)"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel1, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = Color.AthenaVoice,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
	end
	--Panel 2
	index = 0
	--Call
	if StatsData.Call ~= nil then
		index = index + 2
		string = "Call Stats"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel2, Text = string, OffsetX = 125, OffsetY = (index * Yspacer),
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
		index = index + 4
		if StatsData.MaxGaugeEffect == nil then
			StatsData.MaxGaugeEffect = "Duration only"
		end
		string = "Call : "..StatsData.Call.." \\n ".."Effect : "..StatsData.CallEffect.." \\n "
		.."Starting gauge : "..StatsData.BonusStartingGauge.." (0+"..StatsData.BonusStartingGauge..")".." \\n "
		.."Cost : "..StatsData.CallCost.." (1/"..(100 / StatsData.CallCost).." of gauge)".." \\n "
		.."Damage : "..(StatsData.CallDamage or 0).." Crit chance : "..(StatsData.CallCritChance or 0).."%".." \\n "
		.."Base duration : "..StatsData.CallDuration.."		Max gauge duration : "..(StatsData.MaxGaugeDurationMultiplier * StatsData.CallDuration).." \\n "
		.."Max gauge effect : "..StatsData.MaxGaugeEffect
		CreateTextBox({ Id = ScreenAnchors.StatsPanel2, Text = string, OffsetX = 0, OffsetY = index * Yspacer, Color = StatsData.CallColor,
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
		index = index + 2
	end
	--Revenge Effects
	--Too complicated, hardcoded for now but needs overhaul
	if StatsData.RevengeEffects ~= table.empty then
		index = index + 2
		string = "Revenge Effects"
		CreateTextBox({ Id = ScreenAnchors.StatsPanel2, Text = string, OffsetX = 125, OffsetY = (index * Yspacer),
		Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
		index = index + 2
		local name = 0
		local dmg = 0
		local effect = 0
		local duration = 0
		local color = Color.White
		for k, trait in pairs(StatsData.RevengeEffects) do
			if trait.PropertyChanges ~= nil then
				index = index + 1
				name = string.gsub(trait.Name, "RetaliateTrait", " Revenge : ")
				for j, property in pairs(trait.PropertyChanges) do
					if property.ProjectileProperty ~= nil and property.ProjectileProperty == "DamageLow" then
						dmg = property.BaseValue
					end
					if property.WeaponName == "MagicShieldRetaliate" then
						effect = "Damage + Reflection"
						duration = 0.5
						color = Color.AthenaVoice
					elseif property.WeaponName == "LightningStrikeRetaliate" then
						effect = "Damage"
						duration = 0
						color = Color.ZeusVoice
					elseif property.WeaponName == "AreaWeakenAphrodite" then
						effect = "AreaDamage + Weak"
						duration = 0
						color = Color.AphroditeVoice
					elseif property.WeaponName == "AresRetaliate" then
						effect = "Doom"
						duration = 0
						color = Color.AresVoice
					end
				end
				string = name.." \\n ".." Effect : "..effect.." \\n ".." Damage : "..dmg.." Duration : "..duration
				CreateTextBox({ Id = ScreenAnchors.StatsPanel2, Text = string, OffsetX = 0, OffsetY = (index * Yspacer), Color = color,
				Font = "UbuntuMonoBold", FontSize = 20, OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 3,
				ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left" })
			end
		end
	end
end

function UpdateStats()
	--Reset values
	StatsData.BonusDash = 0
	StatsData.BonusHealth = 0
	StatsData.DoorHeal = 0

	StatsData.WeaponBonusDamage = 0
	StatsData.CastBonusDamage = 0
	StatsData.CastBonusDamageMultiplier = 0
	StatsData.SpecialBonusDamage = 0
	StatsData.DashBoonDamage = 0
	StatsData.DashBonusDamage = 0
	StatsData.BackstabDamageBonus = 0
	StatsData.AmmoStoredDamageBonus = 0

	StatsData.WeaponBonusCritChance = 0
	StatsData.CastBonusCritChance = 0
	StatsData.SpecialBonusCritChance = 0
	StatsData.DashBonusCritChance = 0
	StatsData.GlobalBonusCritChance = 0

	StatsData.BonusCritDamage = 0
	StatsData.BonusArmorCritDamage = 0

	StatsData.CanWeaponDeflect = false
	StatsData.CanCastDeflect = false
	StatsData.CanSpecialDeflect = false
	StatsData.CanDashDeflect = false
	StatsData.DeflectDamageMultiplier = 0
	StatsData.BackstabBonusAfterDeflect = 0

	StatsData.BonusDefianceHeal = 0
	StatsData.DefianceProtectionDuration = 0

	StatsData.TotalHealth = 0
	StatsData.TotalDash = 0
	StatsData.TotalCastDamage = 0
	StatsData.TotalCritDamage = 0
	StatsData.TotalDefianceHeal = 0

	StatsData.Call = nil
	StatsData.CallEffect = nil
	StatsData.CallDuration = 0
	StatsData.MaxGaugeEffect = nil
	StatsData.MaxGaugeDurationMultiplier = 0
	StatsData.AdditionalCallData = {}
	StatsData.CallColor = nil
	StatsData.CallCost = 0
	StatsData.CallDamage = 0
	StatsData.CallCritChance = 0
	StatsData.BonusStartingGauge = 0

	StatsData.AthenaBarrier = 0

	StatsData.RevengeEffects = {}
	-- Set default values
	StatsData.DefaultHealth = 50
	StatsData.DefaultDash = 1
	StatsData.DefaultCastDamage = 50
	StatsData.DefaultCritDamage = 300
	StatsData.DefaultDefianceHeal = 0.5
	StatsData.ReducedTrapDamageMultiplier = 1
	StatsData.ReducedEnemyDamage = 1
	--Traits
	local rarityData = nil
	local rarityMultiplier = nil
	for k, trait in pairs(CurrentRun.Hero.Traits) do
		rarityData = trait.RarityLevels[trait.Rarity]
		rarityMultiplier = rarityData.Multiplier
		if trait.CriticalHealthBufferMultiplier ~= nil then
			StatsData.BonusArmorCritDamage = StatsData.BonusArmorCritDamage + (trait.CriticalHealthBufferMultiplier - 1)
		end
		--Trait values
		if trait.LastStandHealFraction ~= nil then
			StatsData.BonusDefianceHeal = StatsData.BonusDefianceHeal + trait.LastStandHealFraction
		elseif trait.Name == "ShieldHitTrait" then
			StatsData.AthenaBarrier = trait.TimeCooldown
		elseif trait.Name ~= "AutoRetaliateTrait" and string.match(trait.Name, "Retaliate") and trait.PropertyChanges ~= nil then
			table.insert(StatsData.RevengeEffects, DeepCopyTable(trait))
		elseif trait.AddShout ~= nil then
			StatsData.Call = string.gsub(trait.AddShout.FunctionName, "Shout", "")
			if StatsData.Call == "Athena" then
				StatsData.CallEffect = "Invulnerability"
				StatsData.CallColor = Color.AthenaVoice
			elseif StatsData.Call == "Artemis" then
				StatsData.CallEffect = "Summon Arrows"
				StatsData.CallColor = Color.ArtemisVoice
				StatsData.MaxGaugeEffect = "Fire 10 arrows"
				--StatsData.CallDamage = StatsData.AdditionalCallData.ArrowDamage
				--StatsData.CallCritChance = StatsData.AdditionalCallData.ArrowCritChance
			else
				StatsData.CallEffect = "Unknown"
			end
			StatsData.CallDuration = trait.AddShout.SuperDuration or 0
			StatsData.MaxGaugeDurationMultiplier = trait.AddShout.MaxDurationMultiplier or 0
			StatsData.CallCost = trait.AddShout.Cost or 0
		elseif trait.StartingSuperAmount ~= nil then
			StatsData.BonusStartingGauge = StatsData.BonusStartingGauge + trait.StartingSuperAmount
		end
		--Outgoing modifiers
		if trait.AddOutgoingDamageModifiers ~= nil then
			local data = DeepCopyTable(trait.AddOutgoingDamageModifiers)
			--for k, modifier in pairs(data) do
				if data.ValidWeaponMultiplier ~= nil then
					if Contains(data.ValidWeapons, "SwordWeapon") then
						StatsData.WeaponBonusDamage = StatsData.WeaponBonusDamage + data.ValidWeaponMultiplier
					elseif Contains(data.ValidWeapons, "RangedWeapon") then
						if data.ValidWeaponMultiplier < 5 then
							StatsData.CastBonusDamageMultiplier = StatsData.CastBonusDamageMultiplier + (data.ValidWeaponMultiplier - 1)
						else
							StatsData.CastBonusDamage = StatsData.CastBonusDamage + data.ValidWeaponMultiplier
						end
					elseif Contains(data.ValidWeapons, "SwordParry") then
						StatsData.SpecialBonusDamage = StatsData.SpecialBonusDamage + data.ValidWeaponMultiplier
					elseif Contains(data.ValidWeapons, "ShieldWeaponDash") then
						StatsData.DashBonusDamage = StatsData.DashBonusDamage + data.ValidWeaponMultiplier
					end
				end
			--end
		end
		--Incoming player modifiers
		if trait.AddIncomingDamageModifiers ~= nil then
			local data = DeepCopyTable(trait.AddIncomingDamageModifiers)
			if data.TrapDamageTakenMultiplier ~= nil then
				if data.TrapDamageTakenMultiplier < 1 then
					StatsData.ReducedTrapDamageMultiplier = StatsData.ReducedTrapDamageMultiplier - data.TrapDamageTakenMultiplier
				end
			elseif data.NonTrapDamageTakenMultiplier ~= nil then
				StatsData.ReducedEnemyDamage = StatsData.ReducedEnemyDamage - data.NonTrapDamageTakenMultiplier
			end
		end
		--Incoming enemy modifiers
		if trait.EnemyIncomingDamageModifiers ~= nil then
			local data = DeepCopyTable(trait.EnemyIncomingDamageModifiers)
			if data.ProjectileDeflectedMultiplier ~= nil then
				StatsData.DeflectDamageMultiplier = StatsData.DeflectDamageMultiplier + (data.ProjectileDeflectedMultiplier - 1)
			end
		end
		--Property changes
		if trait.PropertyChanges ~= nil then
			for k, propertyChange in pairs(trait.PropertyChanges) do
				if propertyChange.WeaponProperty == "ClipSize" and (propertyChange.WeaponNames ~= nil and Contains(propertyChange.WeaponNames, "RushWeapon")) then
					StatsData.BonusDash = StatsData.BonusDash + (propertyChange.ChangeValue * (rarityMultiplier or 1))

				elseif propertyChange.LuaProperty == "MaxHealth" then
						StatsData.BonusHealth = StatsData.BonusHealth + round((propertyChange.BaseValue / trait.RarityMultiplier), 2)

				elseif propertyChange.ProjectileProperty == "CriticalHitChance" and propertyChange.WeaponNames ~= nil then
					if Contains(propertyChange.WeaponNames, "SwordWeapon") then
						StatsData.WeaponBonusCritChance = StatsData.WeaponBonusCritChance + round((propertyChange.BaseValue / trait.RarityMultiplier), 2)
					elseif Contains(propertyChange.WeaponNames, "RangedWeapon") then
						StatsData.CastBonusCritChance = StatsData.CastBonusCritChance + round((propertyChange.BaseValue / trait.RarityMultiplier), 2)
					elseif Contains(propertyChange.WeaponNames, "SwordParry") then
						StatsData.SpecialBonusCritChance = StatsData.SpecialBonusCritChance + round((propertyChange.BaseValue / trait.RarityMultiplier), 2)
					elseif Contains(propertyChange.WeaponNames, "ShieldWeaponDash") then
						StatsData.DashBonusCritChance = StatsData.DashBonusCritChance + round((propertyChange.BaseValue / trait.RarityMultiplier), 2)
					end

				elseif propertyChange.UnitProperty == "CritMultiplierAddition" then
					StatsData.BonusCritDamage = StatsData.BonusCritDamage + propertyChange.BaseValue
				elseif propertyChange.UnitProperty == "CritAddition" then
					StatsData.GlobalBonusCritChance = StatsData.GlobalBonusCritChance + propertyChange.BaseValue

				elseif propertyChange.ProjectileProperty == "DamageLow" and propertyChange.WeaponNames ~= nil then
					if Contains(propertyChange.WeaponNames, "RangedWeapon") then
						StatsData.CastBonusDamage = StatsData.CastBonusDamage + propertyChange.BaseValue
					elseif Contains(propertyChange.WeaponNames, "RushWeapon") then
						StatsData.DashBoonDamage = StatsData.DashBoonDamage + propertyChange.BaseValue
					end

				elseif propertyChange.ProjectileProperty == "DeflectProjectiles" and propertyChange.WeaponNames ~= nil then
					if Contains(propertyChange.WeaponNames, "SwordWeapon") then
						StatsData.CanWeaponDeflect = true
					elseif Contains(propertyChange.WeaponNames, "RangedWeapon") then
						StatsData.CanCastDeflect = true
					elseif Contains(propertyChange.WeaponNames, "SwordParry") then
						StatsData.CanSpecialDeflect = true
					end

				elseif propertyChange.WeaponProperty == "Projectile" and propertyChange.WeaponNames ~= nil then
					if Contains(propertyChange.WeaponNames, "RushWeapon") then
						if propertyChange.ChangeValue == "AthenaRushProjectile" then
							StatsData.CanDashDeflect = true
						end
					end

				elseif propertyChange.EffectName == "MagicShield" and propertyChange.WeaponNames ~= nil then
					if propertyChange.BaseValue ~= nil then
						StatsData.DefianceProtectionDuration = StatsData.DefianceProtectionDuration + propertyChange.BaseValue
					end
				elseif propertyChange.EffectName == "AthenaBackstabVulnerability" and propertyChange.WeaponNames ~= nil then
					if propertyChange.BaseValue ~= nil then
						StatsData.BackstabBonusAfterDeflect = StatsData.BackstabBonusAfterDeflect + (propertyChange.BaseValue - 1)
					end

				elseif propertyChange.WeaponNames ~= nil and Contains(propertyChange.WeaponNames, "ArtemisShoutWeapon") then
					ModDebugPrint(propertyChange.ProjectileProperty,2)
					if propertyChange.ProjectileProperty == "DamageHigh" then
						--ModDebugPrint(propertyChange.BaseValue,0)
						--StatsData.AdditionalCallData.ArrowDamage = propertyChange.DamageLow
						StatsData.CallDamage = propertyChange.BaseValue
					elseif propertyChange.ProjectileProperty == "CriticalHitChance" then
						--StatsData.AdditionalCallData.ArrowCritChance = propertyChange.CriticalHitChance
					end
				end
			end
		end
	end
		--Meta Upgrades
		StatsData.BonusHealth = StatsData.BonusHealth + (GetNumMetaUpgrades("HealthMetaUpgrade") * MetaUpgradeData.HealthMetaUpgrade.ChangeValue)
		StatsData.BonusDash = StatsData.BonusDash + GetNumMetaUpgrades("StaminaMetaUpgrade")
		StatsData.BackstabDamageBonus = StatsData.BackstabDamageBonus + (GetNumMetaUpgrades("BackstabMetaUpgrade") * 0.1)
		StatsData.AmmoStoredDamageBonus = StatsData.AmmoStoredDamageBonus + (GetNumMetaUpgrades("StoredAmmoVulnerabilityMetaUpgrade") * 0.1)
		--Totals
		StatsData.TotalDash = StatsData.DefaultDash + StatsData.BonusDash
		StatsData.TotalHealth = StatsData.DefaultHealth + StatsData.BonusHealth
		if StatsData.CastBonusDamage ~= 0 then
			StatsData.TotalCastDamage = StatsData.CastBonusDamage * (1 + StatsData.CastBonusDamageMultiplier)
		else
			StatsData.TotalCastDamage = StatsData.DefaultCastDamage * (1 + StatsData.CastBonusDamageMultiplier)
		end
		StatsData.TotalCastDamage = round(StatsData.TotalCastDamage)
		if StatsData.GlobalBonusCritChance ~= 0 then
			StatsData.WeaponBonusCritChance = StatsData.WeaponBonusCritChance + StatsData.GlobalBonusCritChance
			StatsData.CastBonusCritChance = StatsData.CastBonusCritChance + StatsData.GlobalBonusCritChance
			StatsData.SpecialBonusCritChance = StatsData.SpecialBonusCritChance + StatsData.GlobalBonusCritChance
			StatsData.DashBonusCritChance = StatsData.DashBonusCritChance + StatsData.GlobalBonusCritChance
		end
		StatsData.TotalCritDamage = StatsData.DefaultCritDamage + (StatsData.BonusCritDamage * 100)
		StatsData.TotalDefianceHeal = StatsData.DefaultDefianceHeal + StatsData.BonusDefianceHeal
		--Special Calculations
		local maxHealth = CurrentRun.Hero.MaxHealth
		local roomHealFraction = GetTotalHeroTraitValue("DoorHeal")
		StatsData.DoorHeal = roomHealFraction * maxHealth
		StatsData.DoorHeal = StatsData.DoorHeal + GetNumMetaUpgrades("DoorHealMetaUpgrade") * MetaUpgradeData.DoorHealMetaUpgrade.ChangeValue
		StatsData.DoorHeal = StatsData.DoorHeal * CalculateHealingMultiplier()
end

OnControlPressed{ "Codex",
	function(triggerArgs)
		if IsScreenOpen("TraitTrayScreen") then
			wait(0.1)
			Destroy({Id = ScreenAnchors.StatsPanel1})
			Destroy({Id = ScreenAnchors.StatsPanel2})
			if StatsData.ComponentIds ~= nil then
				Destroy({Ids = StatsData.ComponentIds})
			end
			DisplayStats()
		else
			Destroy({Id = ScreenAnchors.StatsPanel1})
			Destroy({Id = ScreenAnchors.StatsPanel2})
			Destroy({Ids = StatsData.ComponentIds})
		end
	end
}

OnControlPressed{ "Codex",
	function( triggerArgs )
		if CodexUI.Screen == nil then
			return
		end
		-- prevent crash by pressing too early
		wait(0.5)
		--set to false for public version
		local debug = false
		--Boons
		if CodexStatus.SelectedChapterName == "OlympianGods" then
			local boon = CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]
			CreateLoot({ Name = boon, OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
			if debug then
				ModDebugPrint("Trying to spawn boon : " .. boon)
			end
			return
		end
		--Chaos Boon
		if CodexStatus.SelectedChapterName == "ChthonicGods" and
		 CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName] == "TrialUpgrade" then
			local boon = CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]
			CreateLoot({ Name = boon, OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
			if debug then
				ModDebugPrint("Trying to spawn boon : " .. boon)
			end
			return
		end
		--Items
		if CodexStatus.SelectedChapterName == "Items" then
			local consumableTable =
			{
				["RoomRewardMetaPointDrop"] = "RoomRewardMetaPointDrop",
				["GemDrop"] = "GemDrop",
				["LockKeyDrop"] = "LockKeyDrop",
				["GiftDrop"] = "GiftDrop",
				["RoomRewardMaxHealthDrop"] = "RoomRewardMaxHealthDrop",
				["RoomRewardMoneyDrop"] = "RoomRewardMoneyDrop",
				["SuperGemDrop"] = "SuperGemDrop",
				["SuperLockKeyDrop"] = "SuperLockKeyDrop",
				["SuperGiftDrop"] = "SuperGiftDrop",
				["RoomRewardConsolationPrize"] = "RoomRewardConsolationPrize",
			}
			local item = CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]
			if item == consumableTable[item] then
        local consumableId = SpawnObstacle({ Name = item, DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing", OffsetX = 100 })
        local consumable = CreateConsumableItem( consumableId, item, 0 )
				if debug then
					ModDebugPrint("Trying to spawn consumable : " .. item)
				end
				return
			end
			CreateLoot({ Name = item, OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
			if debug then
				ModDebugPrint("Trying to spawn item : " .. item)
			end
			return
		end
		--Weapons
		if CodexStatus.SelectedChapterName == "Weapons" then
			local weapon = CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]
			EquipPlayerWeapon( WeaponData[weapon], { PreLoadBinks = true } )
			RemoveAllTraits()
			if debug then
				ModDebugPrint("Trying to equip weapon : " .. weapon)
			end
			return
		end
		--Enemies
		if CodexStatus.SelectedChapterName == "Enemies" then
			local enemy = CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]
			local enemyData = EnemyData[enemy]
			local newEnemy = DeepCopyTable( enemyData )
			newEnemy.AIOptions = enemyData.AIOptions
			newEnemy.BlocksLootInteraction = false
			local invaderSpawnPoint = 40000
			newEnemy.ObjectId = SpawnUnit({
					Name = enemyData.Name,
					Group = "Standing",
					DestinationId = invaderSpawnPoint, OffsetX = 400, OffsetY = 200 })
			SetupEnemyObject( newEnemy, CurrentRun )
			if debug then
				ModDebugPrint("Trying to spawn enemy : " .. enemy)
			end
			return
		end
		--Bosses and Commands
		if CodexStatus.SelectedChapterName == "ChthonicGods" or
		CodexStatus.SelectedChapterName == "OtherDenizens" then
			local debugTicks = 0
			local entry = CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]
			local bossTable =
			{
				["NPC_Hades_01"] = "Hades",
				["NPC_FurySister_01"] = "Harpy",
				["Harpy2"] = "Harpy2",
				["Harpy3"] = "Harpy3",
				["Theseus"] = "Theseus",
				["Minotaur"] = "Minotaur",
				["NPC_Thanatos_01"] = "NPC_Thanatos_Field_01"
			}
			local commandTable =
			{
				["PlayerUnit"] = function()
					RemoveAllTraits()
				end,
				["NPC_Achilles_01"] = function()
					if IsSuperValid() then
						wait(1, RoomThreadName)
						BuildSuperMeter(CurrentRun, 100)
						CommenceSuperMove()
						UpdateSuperDamageBonus()
						thread( MarkObjectiveComplete, "EXMove" )
					end
				end,
				["NPC_Nyx_01"] = function()
					OpenMetaUpgradeMenu()
				end,
				["NPC_Skelly_01"] = function()
					OpenShrineUpgradeMenu({ BlockRunStartButton = true })
				end,
				["NPC_Cerberus_01"] = function()
					StartUpAwardMenu(triggerArgs.TriggeredByTable)
				end,
				["NPC_Charon_01"] = function()
					CurrentRun.CurrentRoom.Store = nil
					StartUpStore()
				end,
				["NPC_Hypnos_01"] = function()
					GenerateSellTraitShop(CurrentRun, CurrentRun.CurrentRoom)
					OpenSellTraitMenu()
				end,
				["NPC_Orpheus_01"] = function()
					if CodexMenuData.LastAddedTrait ~= nil then
						RemoveTrait(CurrentRun.Hero, CodexMenuData.LastAddedTrait)
					end
				end,
				["NPC_Eurydice_01"] = function()
					for i, traitData in pairs( CurrentRun.Hero.Traits ) do
						if CodexMenuData.LastAddedTrait ~= nil and traitData.Name == CodexMenuData.LastAddedTrait and TraitData[traitData.Name] and traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil then
							RemoveWeaponTrait( traitData.Name )
							AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = GetUpgradedRarity(traitData.Rarity) }) })
						end
					end
				end,
			}
			--Bosses
			if bossTable[entry] then
				if entry == "NPC_Hades_01" then entry = "Hades"
				elseif entry == "NPC_FurySister_01" then entry = "Harpy"
				elseif entry == "NPC_Thanatos_01" then entry = "NPC_Thanatos_Field_01"
				end
				local enemyData = EnemyData[entry]
				local newEnemy = DeepCopyTable( enemyData )
				newEnemy.AIOptions = enemyData.AIOptions
				newEnemy.BlocksLootInteraction = false
				local invaderSpawnPoint = 40000
				newEnemy.ObjectId = SpawnUnit({
						Name = enemyData.Name,
						Group = "Standing",
						DestinationId = invaderSpawnPoint, OffsetX = 400, OffsetY = 200 })
				SetupEnemyObject( newEnemy, CurrentRun )
				if debug then
					ModDebugPrint("Trying to spawn boss : " .. entry)
				end
				--Commands
			elseif commandTable[entry] then
				commandTable[entry]()
				if debug then
					ModDebugPrint("Trying to use command : " .. entry)
				end
			end
			return
		end
	end
}
