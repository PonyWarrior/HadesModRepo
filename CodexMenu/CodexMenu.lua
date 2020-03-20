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
        local cost = 0
        local consumable = CreateConsumableItem( consumableId, item, cost )
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
					if CurrentRun.Hero.Traits ~= nil then
						GameState.CodexMenuSavedState = {}
						for i, traitData in pairs( CurrentRun.Hero.Traits ) do
							table.insert(GameState.CodexMenuSavedState, { Name = traitData.Name, Rarity = traitData.Rarity, })
						end
					end
				end,
				["NPC_Patroclus_01"] = function()
					if GameState.CodexMenuSavedState ~= nil then
						RemoveAllTraits()
						for i, traitData in pairs( GameState.CodexMenuSavedState ) do
							AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity }) })
						end
					end
				end,
				["NPC_Eurydice_01"] = function()
					for i, traitData in pairs( CurrentRun.Hero.Traits ) do
						if IsGodTrait(traitData.Name) and TraitData[traitData.Name] and traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil then
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

CodexMenuData =
{
}
