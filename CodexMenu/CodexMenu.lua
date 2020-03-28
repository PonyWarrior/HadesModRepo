-- IMPORT @ DEFAULT

CodexMenuData =
{
	ZeusUpgrade =
	{
	  "ZeusWeaponTrait", "ZeusRushTrait", "ZeusRangedTrait", "ZeusSecondaryTrait", "ZeusShoutTrait",
		"RetaliateWeaponTrait", "SuperGenerationTrait", "OnWrathDamageBuffTrait", "ZeusBonusBounceTrait",
		"ZeusLightningDebuff", "ZeusBoltAoETrait", "ZeusBonusBoltTrait", "ZeusChargedBoltTrait",
	},
	PoseidonUpgrade =
	{
		"PoseidonWeaponTrait", "PoseidonSecondaryTrait", "PoseidonRushTrait", "PoseidonRangedTrait", "PoseidonShoutTrait",
		"RoomRewardBonusTrait", "DefensiveSuperGenerationTrait", "BonusCollisionTrait", "SlamExplosionTrait", "SlipperyTrait", "BossDamageTrait",
		"RandomMinorLootDrop", "DoubleCollisionTrait",
	},
	AthenaUpgrade =
	{
		"AthenaWeaponTrait", "AthenaSecondaryTrait", "AthenaRushTrait", "AthenaRangedTrait", "AthenaShoutTrait",
		"TrapDamageTrait", "EnemyDamageTrait", "AthenaRetaliateTrait", "PreloadSuperGenerationTrait",
		"AthenaBackstabDebuffTrait", "AthenaShieldTrait", "LastStandDurationDrop", "LastStandHealDrop", "ShieldHitTrait",
	},
	AphroditeUpgrade =
	{
		"AphroditeWeaponTrait", "AphroditeRushTrait", "AphroditeRangedTrait", "AphroditeSecondaryTrait", "AphroditeShoutTrait",
		"AphroditeRetaliateTrait", "AphroditeDeathTrait", "ProximityArmorTrait", "HealthRewardBonusTrait",
		"AphroditeDurationTrait", "AphroditeWeakenTrait", "AphroditePotencyTrait", "CharmTrait",
	},
	ArtemisUpgrade =
	{
		"ArtemisWeaponTrait", "ArtemisRushTrait", "ArtemisRangedTrait", "ArtemisSecondaryTrait", "ArtemisShoutTrait",
		"CritBonusTrait", "ArtemisBonusProjectileTrait", "ArtemisSupportingFireTrait", "CritVulnerabilityTrait", "ArtemisCriticalTrait",
		"CriticalBufferMultiplierTrait", "CriticalSuperGenerationTrait", "ArtemisAmmoExitTrait", "MoreAmmoTrait",
	},
	AresUpgrade =
	{
		"AresWeaponTrait", "AresRushTrait", "AresRangedTrait", "AresSecondaryTrait" , "AresShoutTrait",
		"AresRetaliateTrait", "IncreasedDamageTrait", "OnEnemyDeathDamageInstanceBuffTrait", "AresLongCurseTrait",
		"AresLoadCurseTrait", "AresDragTrait", "AresCursedRiftTrait",
	},
	DionysusUpgrade =
	{
		"DionysusWeaponTrait", "DionysusSecondaryTrait", "DionysusRushTrait", "DionysusRangedTrait", "DionysusShoutTrait",
		"DoorHealTrait", "LowHealthDefenseTrait", "DionysusSpreadTrait", "DionysusSlowTrait", "DionysusPoisonPowerTrait",
		"DionysusDefenseTrait", "DionysusGiftDrop", "DionysusComboVulnerability",
	},
	HermesUpgrade =
	{
		"AmmoReloadTrait", "HermesShoutDodge", "HermesWeaponTrait", "HermesSecondaryTrait", "RushRallyTrait", "MoveSpeedTrait",
		"RushSpeedBoostTrait", "RapidCastTrait", "BonusDashTrait", "DodgeChanceTrait", "AmmoReclaimTrait", "MagnetismTrait", "UnstoredAmmoDamageTrait",
	},
	DemeterUpgrade =
	{
		--Removed "HarvestBoonDrop", causes crash
		"DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait", "DemeterRangedTrait", "DemeterShoutTrait",
		"CastNovaTrait", "ZeroAmmoBonusTrait", "MaximumChillBlast", "MaximumChillBonusSlow", "HealingPotencyDrop", "InstantChillKill",
	},
	TrialUpgrade =
	{
		"ChaosBlessingMeleeTrait", "ChaosBlessingRangedTrait", "ChaosBlessingAmmoTrait", "ChaosBlessingMaxHealthTrait", "ChaosBlessingBoonRarityTrait",
		"ChaosBlessingMoneyTrait", "ChaosBlessingMetapointTrait", "ChaosBlessingSecondaryTrait", "ChaosBlessingDashAttackTrait", "ChaosBlessingExtraChanceTrait"
	},
	WeaponUpgrade =
	{
		SwordWeapon = { "SwordTwoComboTrait", "SwordSecondaryAreaDamageTrait", "SwordHeavySecondStrikeTrait", "SwordThrustWaveTrait", "SwordSecondaryDoubleAttackTrait", "SwordHealthBufferDamageTrait", "SwordDoubleDashAttackTrait", "SwordCriticalTrait", "SwordBackstabTrait", "SwordCursedLifeStealTrait", },
		BowWeapon = { "BowDoubleShotTrait", "BowLongRangeDamageTrait", "BowSlowChargeDamageTrait", "BowTapFireTrait", "BowPenetrationTrait", "BowPowerShotTrait", "BowSecondaryBarrageTrait", "BowTripleShotTrait", "BowSecondaryFocusedFireTrait", "BowChainShotTrait", },
		ShieldWeapon = { "ShieldDashAOETrait", "ShieldRushProjectileTrait", "ShieldThrowFastTrait", "ShieldThrowCatchExplode", "ShieldChargeHealthBufferTrait", "ShieldChargeSpeedTrait", "ShieldBashDamageTrait", "ShieldPerfectRushTrait", "ShieldThrowElectiveCharge", "ShieldRushPunchTrait", },
		SpearWeapon = { "SpearReachAttack", "SpearAutoAttack", "SpearThrowExplode", "SpearThrowBounce", "SpearThrowPenetrate", "SpearThrowCritical", "SpearSpinDamageRadius", "SpearSpinChargeLevelTime", "SpearDashMultiStrike", "SpearThrowElectiveCharge", },
		GunWeapon = { "GunSlowGrenade", "GunMinigunTrait", "GunShotgunTrait", "GunExplodingSecondaryTrait", "GunGrenadeFastTrait", "GunArmorPenerationTrait", "GunInfiniteAmmoTrait", "GunConsecutiveFireTrait", "GunGrenadeClusterTrait", "GunGrenadeDropTrait", "GunHeavyBulletTrait", },
		FistWeapon = { "FistReachAttackTrait", "FistDashAttackHealthBufferTrait", "FistTeleportSpecialTrait", "FistDoubleDashSpecialTrait", "FistChargeSpecialTrait", "FistKillTrait", "FistSpecialLandTrait", "FistAttackFinisherTrait", "FistConsecutiveAttackTrait" },
	},
	Legendaries =
	{
		"ZeusChargedBoltTrait", "MoreAmmoTrait", "DionysusComboVulnerability", "InstantChillKill", "DoubleCollisionTrait",
		"ShieldHitTrait", "CharmTrait", "AresCursedRiftTrait", "MagnetismTrait", "UnstoredAmmoDamageTrait",
	},
	Duos =
	{
		"LightningCloudTrait", "AutoRetaliateTrait", "AmmoBoltTrait", "ImpactBoltTrait", "ReboundingAthenaCastTrait", "JoltDurationTrait",
		"FishingTrait", "ImprovedPomTrait", "RaritySuperBoost", "BlizzardOrbTrait",
		"TriggerCurseTrait", "SlowProjectileTrait", "ArtemisReflectBuffTrait", "CurseSickTrait", "HeartsickCritDamageTrait",
		"DionysusAphroditeStackIncreaseTrait", "AresHomingTrait", "HomingLaserTrait", "IceStrikeArrayTrait", "HomingLaserTrait",
	},
	Consumables =
	{
		"RandomMinorLootDrop", "LastStandDurationDrop", "LastStandHealDrop", "DionysusGiftDrop", "HealingPotencyDrop", "HarvestBoonDrop",
	},
}

CodexMenuData.GodNames = {}
for key,_ in pairs(CodexMenuData) do
    table.insert(CodexMenuData.GodNames,key)
end

function CustomInvertTable(tableArg)
    local inverseTable = {}
    for _,value in ipairs(tableArg) do
        inverseTable[value]=true
    end
    return inverseTable
end

for _,value in ipairs(CodexMenuData.GodNames) do
    CodexMenuData[value.."Inverted"]=CustomInvertTable(CodexMenuData[value])
end

CodexMenuData.BoonSelector = { Components = {} }

function ChangeBoonSelectorRarity(screen, button)
	if screen.LockedRarityButton ~= nil and screen.LockedRarityButton ~= button then
		ModifyTextBox({ Id = screen.LockedRarityButton.Id, Text = screen.LockedRarityButton.Rarity })
	end
	screen.Rarity = button.Rarity
	screen.LockedRarityButton = button
	ModifyTextBox({ Id = button.Id, Text = ">>"..button.Rarity.."<<" })
end

function GiveSelectedBoonToPlayer(screen, button)
	if not HeroHasTrait(button.Boon) then
		local isLegendary = false
		local isDuo = false
		local isConsumable = false
		for i, trait in pairs (CodexMenuData.Legendaries) do
			if button.Boon == trait then
				isLegendary = true
			end
		end
		if isLegendary then
			AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon, Rarity = "Legendary" }) })
			return
		end
		for i, trait in pairs (CodexMenuData.Duos) do
			if button.Boon == trait then
				isDuo = true
			end
		end
		if isDuo then
			AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon, Rarity = "Duo" }) })
			return
		end
		for i, trait in pairs (CodexMenuData.Consumables) do
			if button.Boon == trait then
				isConsumable = true
			end
		end
		if isConsumable then
			local consumableId = SpawnObstacle({ Name = button.Boon, DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing" })
			local consumable = CreateConsumableItemFromData( consumableId, ConsumableData[button.Boon], 0 )
			return
		end
			AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon, Rarity = screen.Rarity }) })
	end
end

function OpenBoonSelector(godName, spawnBoon)
	OnScreenClosed({Flag = "Codex"})
	wait(0.1)
	ReloadAllTraits()
	if godName ~= nil and CodexMenuData[godName] then
		local Boons = DeepCopyTable(CodexMenuData[godName])
		if Boons == nil then
			return
		end
		ScreenAnchors.BoonSelector = DeepCopyTable(CodexMenuData.BoonSelector)
		local screen = ScreenAnchors.BoonSelector
		local components = screen.Components
		screen.Name = "BoonSelector"
		screen.Rarity = "Common"
		screen.RowStartX = -350
		screen.RowStartY = -270
		OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
		SetConfigOption({ Name = "UseOcclusion", Value = false })
		FreezePlayerUnit()
		EnableShopGamepadCursor()
		PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
		--Background
		components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "BoonSelector" })
		components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "BoonSelector" })
		components.Lighting = CreateScreenComponent({ Name = "BoonSelectLighting", Group = "BoonSelector" })
		components.FrontFx = CreateScreenComponent({ Name = "BoonSelectInFrontFx", Group = "BoonSelector" })
		local lColor = Color.White
		if godName == "Duos" then
			lColor = Color.Green
		else
			lColor = LootData[godName].LootColor
			components.BoonIcon = CreateScreenComponent({ Name = "rectangle01", Group = "BoonSelector", X = 182, Y = 160 })
			SetAnimation({ DestinationId = components.BoonIcon.Id, Name = LootData[godName].Icon, Scale = 0.5 })
		end
		SetColor({ Id = components.Lighting.Id, Color = lColor })
		SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
		SetColor({ Id = components.BackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })
		components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "BoonSelector", X = 830, Y = 400})
		components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "BoonSelector", X = 490, Y = 464 })
		components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "BoonSelector", X = 1710, Y = 423 })
		SetScaleY({Id = components.LeftPart.Id, Fraction = 1.3})
		SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.3})
		SetScaleX({Id = components.MiddlePart.Id, Fraction = 10})
		SetScaleY({Id = components.RightPart.Id, Fraction = 1.3})
		--Title
		CreateTextBox({ Id = components.Background.Id, Text = "Codex Menu Boon Selector", FontSize = 34,
		OffsetX = 100, OffsetY = -370, Color = Color.White, Font = "SpectralSCLight",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
		CreateTextBox({ Id = components.Background.Id, Text = "Remember that some boons can't work without others", FontSize = 19,
		OffsetX = 100, OffsetY = -340, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
		--Close button
		components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BoonSelector" })
		Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = ScreenCenterY - 70 })
		components.CloseButton.OnPressedFunctionName = "CloseBoonSelector"
		components.CloseButton.ControlHotkey = "Cancel"
		--Display the boons
		if godName == "WeaponUpgrade" then
			local wp = GetEquippedWeapon()
			Boons = CodexMenuData.WeaponUpgrade[wp]
		end
		for index, boon in ipairs (Boons) do
				local purchaseButtonKey = "PurchaseButton"..index
				local rowoffset = 100
				local columnoffset = 300
				local numperrow = 4
				local offsetX = screen.RowStartX + columnoffset*((index-1) % numperrow)
				local offsetY = screen.RowStartY + rowoffset*(math.floor((index-1)/numperrow))
				local color = lColor
				if CodexMenuData.LegendariesInverted then
					if CodexMenuData.LegendariesInverted[boon] then
						color = Color.BoonPatchLegendary
					end
				end
				components[purchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonSelector", Scale = 0.3, })
				components[purchaseButtonKey].OnPressedFunctionName = "GiveSelectedBoonToPlayer"
				components[purchaseButtonKey].Boon = boon
				Attach({ Id = components[purchaseButtonKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
				CreateTextBox({ Id = components[purchaseButtonKey].Id, Text = boon,
					FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = color, Font = "AlegreyaSansSCLight",
					ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
				})
		end
		--Spawn boon object button
		if spawnBoon then
			components.SpawnButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonSelector", Scale = 0.3, })
			components.SpawnButton.OnPressedFunctionName = "SpawnBoon"
			components.SpawnButton.God = godName
			Attach({ Id = components.SpawnButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = 200 })
			CreateTextBox({ Id = components.SpawnButton.Id, Text = "Spawn regular boon",
				FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
			})
		end
		--Rarity Buttons
		components.CommonButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonSelector", Scale = 0.3, })
		components.CommonButton.OnPressedFunctionName = "ChangeBoonSelectorRarity"
		components.CommonButton.Rarity = "Common"
		Attach({ Id = components.CommonButton.Id, DestinationId = components.Background.Id, OffsetX = -350, OffsetY = 300 })
		CreateTextBox({ Id = components.CommonButton.Id, Text = "Common",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.BoonPatchCommon, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.RareButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonSelector", Scale = 0.3, })
		components.RareButton.OnPressedFunctionName = "ChangeBoonSelectorRarity"
		components.RareButton.Rarity = "Rare"
		Attach({ Id = components.RareButton.Id, DestinationId = components.Background.Id, OffsetX = -50, OffsetY = 300 })
		CreateTextBox({ Id = components.RareButton.Id, Text = "Rare",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.BoonPatchRare, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.EpicButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonSelector", Scale = 0.3, })
		components.EpicButton.OnPressedFunctionName = "ChangeBoonSelectorRarity"
		components.EpicButton.Rarity = "Epic"
		Attach({ Id = components.EpicButton.Id, DestinationId = components.Background.Id, OffsetX = 250, OffsetY = 300 })
		CreateTextBox({ Id = components.EpicButton.Id, Text = "Epic",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.BoonPatchEpic, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.HeroicButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonSelector", Scale = 0.3, })
		components.HeroicButton.OnPressedFunctionName = "ChangeBoonSelectorRarity"
		components.HeroicButton.Rarity = "Heroic"
		Attach({ Id = components.HeroicButton.Id, DestinationId = components.Background.Id, OffsetX = 550, OffsetY = 300 })
		CreateTextBox({ Id = components.HeroicButton.Id, Text = "Heroic",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.BoonPatchHeroic, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		--End
		screen.KeepOpen = true
		--thread(HandleWASDInput, screen)
		HandleScreenInput(screen)
	end
end

function ChangeBoonManagerMode(screen, button)
	if button.Mode == "All" then
		if screen.AllMode == nil or not screen.AllMode then
			screen.AllMode = true
			ModifyTextBox({ Id = button.Id, Text = "All Mode : ON", Color = Color.BoonPatchHeroic })
		else
			screen.AllMode = false
			ModifyTextBox({ Id = button.Id, Text = "All Mode : OFF", Color = Color.BoonPatchEpic })
		end
		return
	end
	if screen.LockedModeButton ~= nil and screen.LockedModeButton ~= button then
		ModifyTextBox({ Id = screen.LockedModeButton.Id, Text = screen.LockedModeButton.Mode.." Mode" })
	end
	screen.Mode = button.Mode
	screen.LockedModeButton = button
	ModifyTextBox({ Id = button.Id, Text = ">>"..button.Mode.." Mode<<" })
end

function HandleBoonManagerClick(screen, button)
	if button.Boon == nil or screen.Mode == nil then
		return
	end
	--All mode
	if screen.AllMode ~= nil and screen.AllMode then
		if screen.Mode == "Level" then
			local upgradableTraits = {}
			local upgradedTraits = {}
			for i, traitData in pairs(CurrentRun.Hero.Traits) do
				if IsGodTrait(traitData.Name) and GetTraitNameCount(CurrentRun.Hero, button.Boon.Name) < 10 and TraitData[traitData.Name] and IsGameStateEligible(CurrentRun, TraitData[traitData.Name]) and traitData.Rarity ~= "Legendary" then
					upgradableTraits[traitData.Name] = true
				end
			end
			while not IsEmpty(upgradableTraits) do
				local name = RemoveRandomKey(upgradableTraits)
				upgradedTraits[name] = true
				AddTraitToHero({ TraitName = name, SkipUIUpdate = true })
			end
			ReloadAllTraits()
			return
		elseif screen.Mode == "Rarity" then
			local upgradableTraits = {}
			local upgradedTraits = {}
			for i, traitData in pairs( CurrentRun.Hero.Traits ) do
				if IsGodTrait(traitData.Name, { ForShop = true }) or IsHermesChaosHammerCharonBoon(traitData.Name) and TraitData[traitData.Name] and traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil then
					if Contains(upgradableTraits, traitData) or traitData.Rarity == "Legendary" then
					else
						table.insert(upgradableTraits, traitData )
					end
				end
			end
			while not IsEmpty(upgradableTraits) do
				local traitData = RemoveRandomValue(upgradableTraits)
				upgradedTraits[traitData.Name] = true
				RemoveWeaponTrait(traitData.Name)
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = "Heroic" }) })
			end
			ReloadAllTraits()
			return
		elseif screen.Mode == "Delete" then
				RemoveAllTraits()
				ReloadEquipment()
				CloseBoonManager(screen, button)
			return
		end
	else
		--Individual mode
		if screen.Mode == "Level" then
			if GetTraitNameCount(CurrentRun.Hero, button.Boon.Name) < 10 then
				AddTraitToHero({ TraitName = button.Boon.Name })
			end
			return
		elseif screen.Mode == "Rarity" then
			if IsGodTrait(button.Boon.Name, { ForShop = true }) and TraitData[button.Boon.Name] and button.Boon.Rarity ~= nil and GetUpgradedRarity(button.Boon.Rarity) ~= nil and button.Boon.RarityLevels[GetUpgradedRarity(button.Boon.Rarity)] ~= nil then
				local numOldTrait = GetTraitNameCount(CurrentRun.Hero, button.Boon.Name)
				if numOldTrait > 10 then
					numOldTrait = 10
				end
				RemoveWeaponTrait(button.Boon.Name)
				button.Boon.Rarity = GetUpgradedRarity(button.Boon.Rarity)
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon.Name, Rarity = button.Boon.Rarity }) })
				for i=1, numOldTrait-1 do
					AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon.Name, Rarity = button.Boon.Rarity }) })
				end
				ReloadAllTraits()
			end
			return
		elseif screen.Mode == "Delete" then
			screen.BoonsList[screen.CurrentPage][button.Index]=nil
			RemoveWeaponTrait(button.Boon.Name)
			Destroy({ Id = button.Id })
			ReloadAllTraits()
			return
		end
	end
end

function BoonManagerChangePage(screen, button)
	if button.Direction == "Left" and screen.CurrentPage > screen.FirstPage then
		screen.CurrentPage = screen.CurrentPage - 1
	elseif button.Direction == "Right" and screen.CurrentPage < screen.LastPage then
		screen.CurrentPage = screen.CurrentPage + 1
	else
		return
	end
	local ids = {}
	for i, component in pairs(screen.Components) do
		if component.Boon ~= nil then
			table.insert(ids, component.Id)
		end
	end
	Destroy({ Ids = ids})
	BoonManagerLoadPage(screen)
end

function BoonManagerLoadPage(screen)
	BoonManagerPageButtons(screen)
  local displayedTraits = {}
  local pageBoons = screen.BoonsList[screen.CurrentPage]
  if pageBoons then
    for i, boonData in pairs(pageBoons) do
      if displayedTraits[boonData.boon.Name] then
      else
        local color = Color.White
        for _,godName in ipairs(CodexMenuData.GodNames) do
          if CodexMenuData[godName.."Inverted"] then
            if CodexMenuData[godName.."Inverted"][boonData.boon.Name] then
              if godName == "Duos" then
                color = Color.Green
							elseif godName == "Legendaries" then
	              color = Color.BoonPatchLegendary
	            end
						if LootData[godName] then
							color = LootData[godName].LootColor
						end
          end
        end
      end
		  displayedTraits[boonData.boon.Name] = true
		  local purchaseButtonKey = "PurchaseButton"..boonData.index
		  screen.Components[purchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonManager", Scale = 0.3, })
		  screen.Components[purchaseButtonKey].OnPressedFunctionName = "HandleBoonManagerClick"
		  screen.Components[purchaseButtonKey].Boon = boonData.boon
		  screen.Components[purchaseButtonKey].Index = boonData.index
		  Attach({ Id = screen.Components[purchaseButtonKey].Id, DestinationId = screen.Components.Background.Id, OffsetX = boonData.offsetX, OffsetY = boonData.offsetY })
		  CreateTextBox({ Id = screen.Components[purchaseButtonKey].Id, Text = boonData.boon.Name,
		      FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = color, Font = "AlegreyaSansSCLight",
		      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		  })
      end
    end
  end
end

function BoonManagerPageButtons(screen)
	local components = screen.Components
	if components.LeftPageButton then
		Destroy({ Ids = {components.LeftPageButton.Id}})
	end
	if components.RightPageButton then
		Destroy({ Ids = {components.RightPageButton.Id}})
	end
	if screen.CurrentPage ~= screen.FirstPage then
		components.LeftPageButton = CreateScreenComponent({ Name = "ButtonCodexLeft", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "BoonManager" })
		Attach({ Id = components.LeftPageButton.Id, DestinationId = components.Background.Id, OffsetX = -480, OffsetY = -350 })
		components.LeftPageButton.OnPressedFunctionName = "BoonManagerChangePage"
		components.LeftPageButton.Direction = "Left"
	end
	if screen.CurrentPage ~= screen.LastPage then
		components.RightPageButton = CreateScreenComponent({ Name = "ButtonCodexRight", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "BoonManager" })
		Attach({ Id = components.RightPageButton.Id, DestinationId = components.Background.Id, OffsetX = 720, OffsetY = -350 })
		components.RightPageButton.OnPressedFunctionName = "BoonManagerChangePage"
		components.RightPageButton.Direction = "Right"
	end
end

function RandomColor(rng)
	local Color_Collapsed = CollapseTable(Color)
   return Color_Collapsed[RandomInt(1, #Color_Collapsed, rng)]
end

function OpenBoonManager()
	OnScreenClosed({Flag = "Codex"})
	wait(0.1)
	ReloadAllTraits()
	if CurrentRun.Hero.Traits ~= nil then
		ScreenAnchors.BoonSelector = DeepCopyTable(CodexMenuData.BoonSelector)
		local screen = ScreenAnchors.BoonSelector
		local components = screen.Components
		screen.Name = "BoonManager"
		screen.FirstPage = 0
		screen.LastPage = 0
		screen.CurrentPage = screen.FirstPage
		screen.RowStartX = -350
		screen.RowStartY = -270
		OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
		SetConfigOption({ Name = "UseOcclusion", Value = false })
		FreezePlayerUnit()
		EnableShopGamepadCursor()
		PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
		--Background
		components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "BoonManager" })
		components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "BoonManager" })
		SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
		SetColor({ Id = components.BackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })
		components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "BoonManager", X = 830, Y = 400})
		components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "BoonManager", X = 490, Y = 464 })
		components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "BoonManager", X = 1710, Y = 423 })
		SetScaleY({Id = components.LeftPart.Id, Fraction = 1.3})
		SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.3})
		SetScaleX({Id = components.MiddlePart.Id, Fraction = 10})
		SetScaleY({Id = components.RightPart.Id, Fraction = 1.3})
		--Title
		CreateTextBox({ Id = components.Background.Id, Text = "Codex Menu Boon Manager", FontSize = 34,
		OffsetX = 100, OffsetY = -370, Color = Color.White, Font = "SpectralSCLight",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
		CreateTextBox({ Id = components.Background.Id, Text = "Does not show Keepsakes, Assists and Weapon aspects", FontSize = 19,
		OffsetX = 100, OffsetY = -340, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
		--Close button
		components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BoonManager" })
		Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = ScreenCenterY - 70 })
		components.CloseButton.OnPressedFunctionName = "CloseBoonManager"
		components.CloseButton.ControlHotkey = "Cancel"
		--Display the boons
		local displayedTraits = {}
		local index = 0
		screen.BoonsList = {}
		for i,boon in ipairs(CurrentRun.Hero.Traits) do
			if IsGodTrait(boon.Name) or IsHermesChaosHammerCharonBoon(boon.Name) then
				local rowOffset = 100
				local columnOffset = 300
				local boonsPerRow = 4
				local rowsPerPage = 4
				local rowIndex = math.floor(index/boonsPerRow)
				local pageIndex = math.floor(rowIndex/rowsPerPage)
				local offsetX = screen.RowStartX + columnOffset*(index % boonsPerRow)
				local offsetY = screen.RowStartY + rowOffset*(rowIndex % rowsPerPage)
				index = index + 1
				screen.LastPage = pageIndex
				if screen.BoonsList[pageIndex] == nil then
				   screen.BoonsList[pageIndex] = {}
				end
				table.insert(screen.BoonsList[pageIndex],{
					index = index,
					boon = boon,
					pageIndex = pageIndex,
					offsetX = offsetX,
					offsetY = offsetY,
				})
			end
		end
		BoonManagerLoadPage(screen)
		--Instructions
		components.ModeDisplay = CreateScreenComponent({ Name = "BlankObstacle", Group = "BoonManager" })
		Attach({ Id = components.ModeDisplay.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = 200 })
		CreateTextBox({ Id = components.ModeDisplay.Id, Text = "Choose a mode",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		--Mode Buttons
		components.LevelModeButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonManager", Scale = 0.3, })
		components.LevelModeButton.OnPressedFunctionName = "ChangeBoonManagerMode"
		components.LevelModeButton.Mode = "Level"
		Attach({ Id = components.LevelModeButton.Id, DestinationId = components.Background.Id, OffsetX = -350, OffsetY = 300 })
		CreateTextBox({ Id = components.LevelModeButton.Id, Text = "Level Mode",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.RarityModeButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonManager", Scale = 0.3, })
		components.RarityModeButton.OnPressedFunctionName = "ChangeBoonManagerMode"
		components.RarityModeButton.Mode = "Rarity"
		Attach({ Id = components.RarityModeButton.Id, DestinationId = components.Background.Id, OffsetX = -50, OffsetY = 300 })
		CreateTextBox({ Id = components.RarityModeButton.Id, Text = "Rarity Mode",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.DeleteModeButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonManager", Scale = 0.3, })
		components.DeleteModeButton.OnPressedFunctionName = "ChangeBoonManagerMode"
		components.DeleteModeButton.Mode = "Delete"
		Attach({ Id = components.DeleteModeButton.Id, DestinationId = components.Background.Id, OffsetX = 250, OffsetY = 300 })
		CreateTextBox({ Id = components.DeleteModeButton.Id, Text = "Delete Mode",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.AllModeButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonManager", Scale = 0.3, })
		components.AllModeButton.OnPressedFunctionName = "ChangeBoonManagerMode"
		components.AllModeButton.Mode = "All"
		Attach({ Id = components.AllModeButton.Id, DestinationId = components.Background.Id, OffsetX = 550, OffsetY = 300 })
		CreateTextBox({ Id = components.AllModeButton.Id, Text = "All Mode : OFF",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.BoonPatchEpic, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		--End
		screen.KeepOpen = true
		thread(HandleWASDInput, screen)
		HandleScreenInput(screen)
	end
end

function CloseBoonManager(screen, button)
	DisableShopGamepadCursor()
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
	SetConfigOption({ Name = "UseOcclusion", Value = true })
	CloseScreen(GetAllIds(screen.Components), 0)
	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	ScreenAnchors.BoonManager = nil
	UnfreezePlayerUnit()
	screen.KeepOpen = false
	screen.BoonsList = {}
	OnScreenClosed({ Flag = screen.Name })
end

function SpawnBoon(screen, button)
	if button.God ~= nil then
		CreateLoot({ Name = button.God, OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
	end
end

function CloseBoonSelector(screen, button)
	DisableShopGamepadCursor()
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
	SetConfigOption({ Name = "UseOcclusion", Value = true })
	CloseScreen(GetAllIds(screen.Components), 0.1)
	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	ScreenAnchors.BoonSelector = nil
	UnfreezePlayerUnit()
	screen.KeepOpen = false
	OnScreenClosed({ Flag = screen.Name })
end

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

function IsHermesBoon(traitName)
	if traitName ~= nil then
		for i, loot in pairs (LootData) do
			if loot.Icon == "BoonSymbolHermes" and loot.TraitIndex[traitName] then
				return true
			end
		end
		return false
	end
end

function IsChaosBoon(traitName)
	if traitName ~= nil then
		for i, loot in pairs (LootData) do
			if loot.Icon == "BoonSymbolChaos" and Contains(loot.PermanentTraits, traitName) then
				return true
			elseif loot.Icon == "BoonSymbolChaos" and Contains(loot.TemporaryTraits, traitName) then
				return true
			end
		end
		return false
	end
end

function IsHammerBoon(traitName)
	if traitName ~= nil then
		for i, loot in pairs (LootData) do
			if loot.Icon == "WeaponUpgradeSymbol" and loot.TraitIndex[traitName] then
				return true
			end
		end
		return false
	end
end

function IsCharonBoon(traitName)
	if traitName ~= nil then
		if Contains(StoreData.RoomShop.Traits, traitName) then
			return true
		else
			for i, option in pairs (StoreData.RoomShop.HealingOffers.Options) do
				if option.Name == traitName then
					return true
				end
			end
		end
		return false
	end
end

function IsHermesChaosHammerCharonBoon(traitName)
	if traitName ~= nil then
		for i, loot in pairs (LootData) do
			--Hermes
			if loot.Icon == "BoonSymbolHermes" and loot.TraitIndex[traitName] then
				return true
			--Chaos
			elseif loot.Icon == "BoonSymbolChaos" and Contains(loot.PermanentTraits, traitName) then
				return true
			elseif loot.Icon == "BoonSymbolChaos" and Contains(loot.TemporaryTraits, traitName) then
				return true
			--Daedalus Hammer
			elseif loot.Icon == "WeaponUpgradeSymbol" and loot.TraitIndex[traitName] then
				return true
			end
		end
		--Charon well
		if Contains(StoreData.RoomShop.Traits, traitName) then
			return true
		else
			for i, option in pairs (StoreData.RoomShop.HealingOffers.Options) do
				if option.Name == traitName then
					return true
				end
			end
		end
		return false
	end
end

function CustomMirrorRefund(screen, button)
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
			if debug then
				ModDebugPrint("Trying to open boon selector : " .. boon)
			end
			OpenBoonSelector(CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName], true)
			return
		end
		--Chaos Boon
		if CodexStatus.SelectedChapterName == "ChthonicGods" and CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName] == "TrialUpgrade" then
			if debug then
				ModDebugPrint("Trying to open boon selector : " .. boon)
			end
			OpenBoonSelector(CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName], true)
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
			elseif item == "WeaponUpgrade" then
				OpenBoonSelector(item, true)
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
			ShowWeaponUpgradeScreen({ WeaponName = weapon })
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
					OpenBoonManager()
				end,
				["NPC_Dusa_01"] = function()
					OpenBoonSelector("Duos")
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
