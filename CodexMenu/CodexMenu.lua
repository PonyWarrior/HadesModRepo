-- IMPORT @ DEFAULT

CodexMenuData = {

}

function CloseCustomMirror( screen, button )
	if screen.PointsAddedThisTime > 0 then
		thread( PlayVoiceLines, GlobalVoiceLines.MetaUpgradeSelectedVoiceLines )
		PlaySound({ Name = "/SFX/Menu Sounds/MirrorCloseWithUpgrade" })
	else
		PlaySound({ Name = "/SFX/Menu Sounds/MirrorCloseNoUpgrade" })
	end

	UpdateSeenMetaUpgrades()
	DisableShopGamepadCursor()
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
	SetAnimation({ DestinationId = screen.Components.ShopBackground.Id, Name = screen.CloseAnimation })
	CloseScreen( GetAllIds( screen.Components ), 0.1 )
	ScreenAnchors.LevelUpScreen = nil
	UnfreezePlayerUnit()
	screen.KeepOpen = false
	OnScreenClosed({ Flag = screen.Name })

end

function OpenCustomMirror( args )
	ScreenAnchors.LevelUpScreen = { Components = {} }
	local screen = ScreenAnchors.LevelUpScreen
	OverwriteTableKeys( screen, args )
	local components = screen.Components
	screen.Name = "MetaUpgrade"
	screen.ResourceName = "MetaPoints"
	screen.InvestedColor = Color.UpgradeGreen
	screen.CloseAnimation = "LevelUpMirrorOut"
	screen.RefundPresentationName = "MetaPointRefundPresentation"
	screen.SpendPresentationName = "MetaPointSpendPresentation"
	screen.UnlockVoiceLines = HeroVoiceLines.MetaUpgradeUnlockedVoiceLines
	screen.CannotAffordVoiceLines = HeroVoiceLines.NotEnoughDarknessVoiceLines
	screen.TooltipOffsetX = LevelUpUI.RightArrowOffsetX
	screen.BackingOffsetX = 0
	screen.BackingTooltipOffsetX = 0
	screen.BackingTooltipOffsetY = 1
	screen.StatChangeX = -10
	screen.UpgradeCostX = 225
	screen.UpgradeCostJustification = "Left"
	screen.HighlightX = -196 + 34
	screen.IconX = 663
	screen.SwapButtonX = -310
	OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
	FreezePlayerUnit()
	EnableShopGamepadCursor()
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = true })

	-- backward compatability
	if GameState.Flags.SubtractionEnabled and not GameState.Flags.SwapMetaupgradesEnabled then
		GameState.Flags.SwapMetaupgradesEnabled = true
	end

	screen.SubjectName = "MetaUpgrades"
	components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
	components.ShopBackgroundSplatter = CreateScreenComponent({ Name = "LevelUpBackground", Group = "Combat_Menu" })
	components.ShopBackground = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })

	SetAnimation({ DestinationId = components.ShopBackground.Id, Name = "LevelUpMirrorIn" })

	SetScale({ Id = components.ShopBackgroundDim.Id, Fraction = 4 })
	SetColor({ Id = components.ShopBackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })

	PlaySound({ Name = "/SFX/Menu Sounds/MirrorMenuOpen" })

	thread( PlayVoiceLines, GlobalVoiceLines.OpenedMetaUpgradeMenuVoiceLines, true )

	-- wait for mirror animation before creating level up screen components
	wait(0.5)

	components.orbLeft = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu", X = 464, Y = 415 })
	components.orbRight = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu", X = 1446, Y = 415 })
	components.orbTopLeft = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu", X = 814, Y = 50 })
	components.orbTopRight = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu", X = 1096, Y = 50 })

	SetAnimation({ DestinationId = components.orbLeft.Id, Name = "LevelUpMirrorOrbShine"})
	SetAnimation({ DestinationId = components.orbRight.Id, Name = "LevelUpMirrorOrbShineFlipped"})
	SetAnimation({ DestinationId = components.orbTopLeft.Id, Name = "LevelUpMirrorOrbTopShine"})
	SetAnimation({ DestinationId = components.orbTopRight.Id, Name = "LevelUpMirrorOrbTopShineFlipped"})

	-- global for conditional VO on menu close
	screen.PointsAddedThisTime = 0

	-- Title
	CreateTextBox({ Id = components.ShopBackground.Id, Text = "Codex Menu Mirror", FontSize = 34, OffsetX = 0, OffsetY = -355, Color = Color.White, Font = "SpectralSCLight", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
	CreateTextBox({ Id = components.ShopBackground.Id, Text = "Reopen mirror after swapping upgrades to change the costs", FontSize = 18, OffsetX = 0, OffsetY = -315, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })

	-- Subtitle / Headers

	local numCapUpgrades = GetNumMetaUpgrades("MetaPointCapShrineUpgrade")
	if numCapUpgrades > 0 then
		local metaPointCap = MetaUpgradeData.MetaPointCapShrineUpgrade.BaseValue + (numCapUpgrades * MetaUpgradeData.MetaPointCapShrineUpgrade.ChangeValue)
		local metaPointsSpent = GetTotalSpentMetaPoints()
		components.SubtitleCap = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
		screen.SubtitleCapText = "MetaUpgradeMenu_Subtitle_Cap"
		CreateTextBox({ Id = components.SubtitleCap.Id, Text = screen.SubtitleCapText, FontSize = 26, OffsetX = -320, OffsetY = -225, Width = 840, Color = Color.Orange, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {68,68,68,255}, ShadowOffset={0, 2}, Justification = "Left", TextSymbolScale = 1.2, LuaKey = "TempTextData", LuaValue = { Spent = metaPointsSpent, Cap = metaPointCap }})
	end

	if not screen.ReadOnly then

		components.SubTitle = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
		Attach({ Id = components.SubTitle, DestinationId = components.ShopBackground.Id })
		screen.SubtitleText = "MetaUpgradeMenu_Subtitle"
		CreateTextBox({ Id = components.SubTitle.Id, Text = screen.SubtitleText, FontSize = 26, OffsetX = 290, OffsetY = -225, Width = 840, Color = Color.MetaUpgradePointsDisplay, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {68,68,68,255}, ShadowOffset={0, 2}, Justification = "Right", TextSymbolScale = 0.8, LuaKey = "TempTextData", LuaValue = { CurrentAmount = GameState.Resources.MetaPoints }})

		local hasLockedUpgrades = false
		for k, upgradeName in pairs( GameState.MetaUpgradesSelected ) do
			if not GameState.MetaUpgradesUnlocked[upgradeName] then
				hasLockedUpgrades = true
				break
			end
		end

		if hasLockedUpgrades then
			components.SubTitleKeys = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
			Attach({ Id = components.SubTitleKeys, DestinationId = components.ShopBackground.Id })

			local keyAmount = GameState.Resources.LockKeys or 0
			local superKeyAmount = GameState.Resources.SuperLockKeys or 0
			CreateTextBox({ Id = components.SubTitleKeys.Id, Text = "MetaUpgradeMenu_Subtitle_Key", FontSize = 26, OffsetX = 205, OffsetY = -225, Width = 840, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {68,68,68,255}, ShadowOffset={0, 2}, Justification = "Right", TextSymbolScale = 0.8, LuaKey = "TempTextData", LuaValue = { CurrentKeys = keyAmount, CurrentSuperKeys = superKeyAmount }})
		end
	end
	-- RefundButton
	if GameState.Flags.SwapMetaupgradesEnabled then
		local refundCost = 0
		local yOffset = 385
		if GameState.MetaUpgradeStagesUnlocked < 4 then
			yOffset = yOffset + 35
		end

		components.RefundButton = CreateScreenComponent({ Name = "ButtonRefund", Scale = 1.0, Group = "Combat_Menu_Overlay" })
		Attach({ Id = components.RefundButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 220, OffsetY = yOffset })
		CreateTextBox({ Id = components.RefundButton.Id, Text = "MetaUpgrade_Locked_Keys", Font = "AlegreyaSansSCBold", FontSize = 22, OffsetX = 30, OffsetY = 0, LuaKey = "TempTextData", LuaValue = { Amount = refundCost }})
		components.RefundButton.OnPressedFunctionName = "CustomMirrorRefund"
		components.RefundButton.Cost = refundCost
		SetInteractProperty({ DestinationId = components.RefundButton.Id, Property = "TooltipOffsetX", Value = LevelUpUI.TooltipOffset - LevelUpUI.RightArrowOffsetX + 40 })
		CreateTextBox({ Id = components.RefundButton.Id, Text = "MetaUpgradeRefundHint",
			FontSize = 1,
			OffsetX = 0, OffsetY = 0,
			Font = "AlegreyaSansSCExtraBold",
			Justification = "LEFT",
			Color = Color.Transparent
		})
	end
	--Reopen button
	components.ReopenButton = CreateScreenComponent({ Name = "ButtonRefund", Scale = 1.0, Group = "Combat_Menu_Overlay" })
	Attach({ Id = components.ReopenButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -280, OffsetY = 390 })
	CreateTextBox({ Id = components.ReopenButton.Id, Text = "Reopen Codex Menu Mirror", Font = "AlegreyaSansSCBold", FontSize = 22, OffsetX = 180, OffsetY = 0 })
	components.ReopenButton.OnPressedFunctionName = "ReopenCustomMirror"
	-- Close button

	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -6, OffsetY = 456 })
	components.CloseButton.OnPressedFunctionName = "CloseCustomMirror"
	components.CloseButton.ControlHotkey = "Cancel"

	components.LevelUpStatHighlight = CreateScreenComponent({ Name = "LevelUpStatHighlight", Group = "Combat_Menu" })
	SetAlpha({ Id = components.LevelUpStatHighlight.Id, Fraction = 0.0 })
	ScreenAnchors.LevelUpStatHighlightId = components.LevelUpStatHighlight.Id

	local itemLocationX = ScreenCenterX - 40
	local itemLocationY = 400
	local firstUseable = false
	for k, upgradeName in ipairs( GameState.MetaUpgradesSelected ) do
		if k > GetNumLockedMetaUpgrades() then
			break
		end

		local upgradeData = DeepCopyTable(MetaUpgradeData[upgradeName])
		if upgradeData.CostTable ~= nil then
			for k, _ in pairs (upgradeData.CostTable) do
				 upgradeData.CostTable[k] = 0
			end
		elseif upgradeData.Cost ~= nil then
			upgradeData.Cost = 0
		end

		local itemBackingKey = "Backing"..k
		components[itemBackingKey] = CreateScreenComponent({ Name = "BlankObstacle", X = itemLocationX, Y = itemLocationY, Group = "Combat_Menu" })

		local graphicKey = "Graphic"..k
		components[graphicKey] = CreateScreenComponent({ Name = "BlankObstacle", X = itemLocationX, Y = itemLocationY, Scale = 0.7, Group = "Combat_Menu" })
		Attach({ Id = components[graphicKey].Id, DestinationId = components[itemBackingKey].Id, OffsetX = -265 - 30, OffsetY = -30 })

		local strikeThroughCount = GetNulledMetaUpgradeCount()
		if not GameState.MetaUpgradesUnlocked[upgradeName] or ( k > TableLength(MetaUpgradeOrder) - strikeThroughCount) and not screen.ReadOnly then
			CreateMetaUpgradeEntry( { Screen = screen, Components = components, Data = upgradeData, Index = k, OffsetY = itemLocationY, Locked = true } )

			local strikethroughKey = "Strikethrough"..k
			components[strikethroughKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
			Attach({ Id = components["Strikethrough"..k].Id, DestinationId = components[itemBackingKey].Id, OffsetX = -160, OffsetY = -30 })
			SetAnimation({ DestinationId = components["Strikethrough"..k].Id, Name = "LevelUpMirrorStrikethrough" })

			local lockIconKey = "LockIcon"..k
			components[lockIconKey] = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = itemLocationY, Group = "Combat_Menu" })
			Attach({ Id = components[lockIconKey].Id, DestinationId = components[itemBackingKey].Id, OffsetX = 345, OffsetY = -35 })
			SetAnimation({ Name = "LockedIcon", DestinationId = components[lockIconKey].Id, Scale = 1.0 })
		else
			CreateMetaUpgradeEntry( { Screen = screen, Components = components, Data = upgradeData, Index = k, OffsetY = itemLocationY, Swap = GameState.Flags.SwapMetaupgradesEnabled } )

			if not firstUseable and not screen.ReadOnly then
				TeleportCursor({ OffsetX = itemLocationX + LevelUpUI.RightArrowOffsetX, OffsetY = itemLocationY + LevelUpUI.RightArrowOffsetY })
				if not GetConfigOptionValue({ Name = "UseMouse" }) then
					RunInteractMethod({ Id = components["RightArrowButton"..k].Id, Method = "HighlightOn" })
				end
				firstUseable = true
			end
		end
		itemLocationY = itemLocationY + LevelUpUI.MetaUpgradeSpacer
	end

	local firstSlot = false
	for k = GameState.MetaUpgradeStagesUnlocked, TableLength(MetaUpgradeLockOrder.LockedSetCosts) - 1 do
		if not firstSlot then
			firstSlot = true
			local panelOffsetY = 400 + LevelUpUI.MetaUpgradeSpacer * MetaUpgradeLockOrder.BaseUnlocked + k * LevelUpUI.MetaUpgradeSpacer * 2
			components["LockBacking"..k] = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = panelOffsetY, Group = "Combat_Menu" })
			-- SetAnimation({ DestinationId = components["LockBacking"..k].Id, Name = "LevelUpMirrorCoverPanel" })
			local lockCost = 0
			components.UnlockNextPanelButton = CreateScreenComponent({ Name = "ButtonMetaUpgradeUnlockPanel", Scale = 0.5, Group = "Combat_Menu" })
			Attach({ Id = components.UnlockNextPanelButton.Id, DestinationId = components["LockBacking"..k].Id, OffsetX = 0, OffsetY = 0 })
			components.UnlockNextPanelButton.OnPressedFunctionName = "UnlockNextMetaUpgradePanel"
			components.UnlockNextPanelButton.Cost = lockCost
			components.UnlockNextPanelButton.BackingId = components["LockBacking"..k].Id
			components.UnlockNextPanelButton.OffsetY = panelOffsetY
			CreateTextBox({ Id = components.UnlockNextPanelButton.Id, Text = "MetaUpgrade_Locked_Keys", Font = "AlegreyaSansSCBold", FontSize = 26, OffsetX = 0, OffsetY = 0, LuaKey = "TempTextData", LuaValue = { Amount = lockCost }})

			SetInteractProperty({ DestinationId = components.UnlockNextPanelButton.Id, Property = "TooltipOffsetX", Value = 350 })
			CreateTextBox({ Id = components.UnlockNextPanelButton.Id, Text = "MetaUpgradeUnlockHint",
				FontSize = 1,
				OffsetX = 0, OffsetY = 0,
				Font = "AlegreyaSansSCExtraBold",
				Justification = "LEFT",
				Color = Color.Transparent,

				LuaKey = "TempTextData",
				LuaValue =
				{
					Amount = lockCost
				}
			})
		else
			local panelOffsetY = 400 + LevelUpUI.MetaUpgradeSpacer * MetaUpgradeLockOrder.BaseUnlocked + k * LevelUpUI.MetaUpgradeSpacer * 2
			components["LockBacking"..k] = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = panelOffsetY, Group = "Combat_Menu" })
			SetAnimation({ DestinationId = components["LockBacking"..k].Id, Name = "LevelUpMirrorCoverPanel" })
		end
	end

	UpdateButtonStates( screen )
	if GameState.Flags.SwapMetaupgradesEnabled and not GameState.Flags.SwapMetaupgradesEnabledPresentation then
		GameState.Flags.SwapMetaupgradesEnabledPresentation = true
		UnlockMetaupgradeSwapPresentation( components )
	end

	screen.KeepOpen = true
	thread( HandleWASDInput, screen )
	HandleScreenInput( screen )
end

function IsHermesBoon(trait)
	if trait ~= nil then
		for i, loot in pairs (LootData) do
			if loot.Icon == "BoonSymbolHermes" and loot.TraitIndex[trait.Name] then
				return true
			end
		end
		return false
	end
end

function IsChaosBoon(trait)
	if trait ~= nil then
		for i, loot in pairs (LootData) do
			if loot.Icon == "BoonSymbolChaos" and loot.TraitIndex[trait.Name] then
				return true
			end
		end
		return false
	end
end

function CustomMirrorRefund( screen, button )
	CloseMetaUpgradeScreen( screen, button )
	FreezePlayerUnit()
	for i, setData in pairs( MetaUpgradeOrder ) do
		for k, upgradeName in pairs( setData ) do
			local upgradeData = MetaUpgradeData[upgradeName]
			local numUpgrades = GetNumMetaUpgrades( upgradeName, { UnModified = true })
			if not IsMetaUpgradeActive(upgradeName, { UnModified = true }) then
				numUpgrades = GameState.MetaUpgradeState[ upgradeName ] or 0
			end
			for j = 1, numUpgrades, 1 do
				if IsMetaUpgradeActive( upgradeName, { UnModified = true }) then
					DecrementTableValue( GameState.MetaUpgrades, upgradeData.Name )
					ApplyMetaUpgrade( upgradeData, true, GameState.MetaUpgrades[upgradeData.Name] <= 0, true )
				else
					DecrementTableValue( GameState.MetaUpgradeState, upgradeData.Name )
				end
			end
		end
	end
	wait(0.5)
	OpenCustomMirror()
	UnfreezePlayerUnit()
end

function ReopenCustomMirror(screen, button)
	CloseMetaUpgradeScreen(screen, button)
	FreezePlayerUnit()
	wait(0.5)
	OpenCustomMirror()
	UnfreezePlayerUnit()
end

function RemoveAllTraits()
	local removedTraitData = {}
	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
		table.insert(removedTraitData, { Name = traitData.Name, Rarity = traitData.Rarity })
	end

	for i, traitData in pairs(removedTraitData) do
		RemoveTrait( CurrentRun.Hero, traitData.Name )
	end
end

function ReloadEquipment()
	EquipWeaponUpgrade(CurrentRun.Hero)
	EquipKeepsake(CurrentRun.Hero)
	EquipAssist(CurrentRun.Hero)
end

function ModDebugPrint(text, delay)
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
			ReloadEquipment()
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
					ReloadEquipment()
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
					OpenCustomMirror()
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
					--Save state
					if CurrentRun.Hero.Traits ~= nil then
						local wp = GetEquippedWeapon()
						GameState.CodexMenuSavedState = { Traits = {}, Weapon = wp, Aspect = { Name = GetWeaponUpgradeTrait(wp, GameState.LastWeaponUpgradeData[wp].Index), Rarity = GetRarityKey(GetWeaponUpgradeLevel(wp, GetEquippedWeaponTraitIndex(wp))) }, Keepsake = GameState.LastAwardTrait, Assist = GameState.LastAssistTrait, }
						for i, traitData in pairs( CurrentRun.Hero.Traits ) do
							if traitData.Name ~= GameState.CodexMenuSavedState.Weapon and traitData.Name ~= GameState.CodexMenuSavedState.Aspect.Name
							and traitData.Name ~= GameState.CodexMenuSavedState.Keepsake and traitData.Name ~= GameState.CodexMenuSavedState.Assist then
								table.insert(GameState.CodexMenuSavedState.Traits, { Name = traitData.Name, Rarity = traitData.Rarity, })
							end
						end
					end
				end,
				["NPC_Patroclus_01"] = function()
					if GameState.CodexMenuSavedState ~= nil then
						RemoveAllTraits()
						if GameState.LastAwardTrait == "ReincarnationTrait" then
								RemoveLastStand( CurrentRun.Hero, "ReincarnationTrait" )
								CurrentRun.Hero.MaxLastStands = CurrentRun.Hero.MaxLastStands - 1
						end
						EquipPlayerWeapon( WeaponData[GameState.CodexMenuSavedState.Weapon], { PreLoadBinks = true } )
						EquipKeepsake(CurrentRun.Hero, GameState.CodexMenuSavedState.Keepsake)
						EquipAssist(CurrentRun.Hero, GameState.CodexMenuSavedState.Assist)
						AddTraitToHero({ TraitName = GameState.CodexMenuSavedState.Aspect.Name, Rarity = GameState.CodexMenuSavedState.Aspect.Rarity })
						for i, traitData in pairs( GameState.CodexMenuSavedState.Traits ) do
							AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity }) })
						end
					end
				end,
				["NPC_Eurydice_01"] = function()
					for i, traitData in pairs( CurrentRun.Hero.Traits ) do
						if traitData ~= nil and IsGodTrait(traitData.Name) or IsHermesBoon(traitData) or IsChaosBoon(traitData) and TraitData[traitData.Name] and traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil then
							RemoveTrait(CurrentRun.Hero, traitData.Name)
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
