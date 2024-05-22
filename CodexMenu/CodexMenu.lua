ModUtil.Mod.Register("CodexMenu")
ModUtil.Table.Merge(CodexMenu, {
    BoonData =
    {
        ZeusUpgrade =
        {
            "ZeusWeaponTrait", "ZeusRushTrait", "ZeusRangedTrait", "ZeusSecondaryTrait", "ZeusShoutTrait",
            "RetaliateWeaponTrait", "SuperGenerationTrait", "OnWrathDamageBuffTrait", "ZeusBonusBounceTrait",
            "ZeusLightningDebuff", "ZeusBoltAoETrait", "ZeusBonusBoltTrait", "ZeusChargedBoltTrait",
            "PerfectDashBoltTrait",
        },
        PoseidonUpgrade =
        {
            "PoseidonWeaponTrait", "PoseidonSecondaryTrait", "PoseidonRushTrait", "PoseidonRangedTrait", "PoseidonShoutTrait",
            "RoomRewardBonusTrait", "DefensiveSuperGenerationTrait", "BonusCollisionTrait", "SlamExplosionTrait", "SlipperyTrait", "BossDamageTrait",
            "RandomMinorLootDrop", "DoubleCollisionTrait",
            "PoseidonShoutDurationTrait", "EncounterStartOffenseBuffTrait", "FishingTrait"
        },
        AthenaUpgrade =
        {
            "AthenaWeaponTrait", "AthenaSecondaryTrait", "AthenaRushTrait", "AthenaRangedTrait", "AthenaShoutTrait",
            "TrapDamageTrait", "EnemyDamageTrait", "AthenaRetaliateTrait", "PreloadSuperGenerationTrait",
            "AthenaBackstabDebuffTrait", "AthenaShieldTrait", "LastStandDurationDrop", "LastStandHealDrop", "ShieldHitTrait",
            "LastStandDurationTrait", "LastStandHealTrait"
        },
        AphroditeUpgrade =
        {
            "AphroditeWeaponTrait", "AphroditeRushTrait", "AphroditeRangedTrait", "AphroditeSecondaryTrait", "AphroditeShoutTrait",
            "AphroditeRetaliateTrait", "AphroditeDeathTrait", "ProximityArmorTrait", "HealthRewardBonusTrait",
            "AphroditeDurationTrait", "AphroditeWeakenTrait", "AphroditePotencyTrait", "CharmTrait",
            "AphroditeRangedBonusTrait",
        },
        ArtemisUpgrade =
        {
            "ArtemisWeaponTrait", "ArtemisRushTrait", "ArtemisRangedTrait", "ArtemisSecondaryTrait", "ArtemisShoutTrait",
            "CritBonusTrait", "ArtemisSupportingFireTrait", "CritVulnerabilityTrait", "ArtemisCriticalTrait",
            "CriticalBufferMultiplierTrait", "CriticalSuperGenerationTrait", "ArtemisAmmoExitTrait", "MoreAmmoTrait",
        },
        AresUpgrade =
        {
            "AresWeaponTrait", "AresRushTrait", "AresRangedTrait", "AresSecondaryTrait" , "AresShoutTrait",
            "AresRetaliateTrait", "IncreasedDamageTrait", "OnEnemyDeathDamageInstanceBuffTrait", "AresLongCurseTrait",
            "AresLoadCurseTrait", "AresDragTrait", "AresAoETrait", "AresCursedRiftTrait",
            "LastStandDamageBonusTrait",
        },
        DionysusUpgrade =
        {
            "DionysusWeaponTrait", "DionysusSecondaryTrait", "DionysusRushTrait", "DionysusRangedTrait", "DionysusShoutTrait",
            "DoorHealTrait", "LowHealthDefenseTrait", "DionysusSpreadTrait", "DionysusSlowTrait", "DionysusPoisonPowerTrait",
            "DionysusDefenseTrait", "DionysusGiftDrop", "DionysusComboVulnerability",
            "FountainDamageBonusTrait",
            "GiftHealthTrait",
        },
        HermesUpgrade =
        {
            "AmmoReloadTrait", "HermesShoutDodge", "HermesWeaponTrait", "HermesSecondaryTrait", "RushRallyTrait", "MoveSpeedTrait",
            "RushSpeedBoostTrait", "RapidCastTrait", "BonusDashTrait", "DodgeChanceTrait", "AmmoReclaimTrait", "MagnetismTrait", "UnstoredAmmoDamageTrait",
            "RegeneratingSuperTrait", "ChamberGoldTrait", "SpeedDamageTrait",
        },
        DemeterUpgrade =
        {
            "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait", "DemeterRangedTrait", "DemeterShoutTrait",
            "CastNovaTrait", "ZeroAmmoBonusTrait", "MaximumChillBlast", "MaximumChillBonusSlow", "HealingPotencyDrop", "InstantChillKill",
            "DemeterRangedBonusTrait", "DemeterRetaliateTrait", "HarvestBoonDrop", "HealingPotencyTrait"
        },
        TrialUpgrade =
        {
            "ChaosBlessingMeleeTrait", "ChaosBlessingRangedTrait", "ChaosBlessingAmmoTrait", "ChaosBlessingMaxHealthTrait",
            "ChaosBlessingBoonRarityTrait", "ChaosBlessingMoneyTrait", "ChaosBlessingMetapointTrait", "ChaosBlessingSecondaryTrait",
            "ChaosBlessingDashAttackTrait", "ChaosBlessingExtraChanceTrait", "ChaosBlessingBackstabTrait", "ChaosBlessingAlphaStrikeTrait",
        },
        --Hammer boons
        WeaponUpgrade = {},

        SwordWeapon = { "SwordTwoComboTrait", "SwordSecondaryAreaDamageTrait", "SwordHeavySecondStrikeTrait", "SwordThrustWaveTrait", "SwordSecondaryDoubleAttackTrait", "SwordHealthBufferDamageTrait", "SwordDoubleDashAttackTrait", "SwordCriticalTrait", "SwordBackstabTrait", "SwordCursedLifeStealTrait", "SwordGoldDamageTrait", "SwordBlinkTrait", "SwordConsecrationBoostTrait"},

        BowWeapon = { "BowDoubleShotTrait", "BowLongRangeDamageTrait", "BowSlowChargeDamageTrait", "BowTapFireTrait", "BowPenetrationTrait", "BowPowerShotTrait", "BowSecondaryBarrageTrait", "BowTripleShotTrait", "BowSecondaryFocusedFireTrait", "BowChainShotTrait", "BowConsecutiveBarrageTrait", "BowCloseAttackTrait", "BowBondBoostTrait"},

        ShieldWeapon = { "ShieldDashAOETrait", "ShieldRushProjectileTrait", "ShieldThrowFastTrait", "ShieldThrowCatchExplode", "ShieldChargeHealthBufferTrait", "ShieldChargeSpeedTrait", "ShieldBashDamageTrait", "ShieldPerfectRushTrait", "ShieldThrowElectiveCharge", "ShieldThrowEmpowerTrait", "ShieldBlockEmpowerTrait", "ShieldThrowRushTrait", "ShieldLoadAmmoBoostTrait"},

        SpearWeapon = { "SpearReachAttack", "SpearAutoAttack", "SpearThrowExplode", "SpearThrowBounce", "SpearThrowPenetrate", "SpearThrowCritical", "SpearSpinDamageRadius", "SpearSpinChargeLevelTime", "SpearDashMultiStrike", "SpearThrowElectiveCharge", "SpearSpinChargeAreaDamageTrait", "SpearAttackPhalanxTrait", "SpearSpinTravelDurationTrait"},

        GunWeapon = { "GunSlowGrenade", "GunMinigunTrait", "GunShotgunTrait", "GunExplodingSecondaryTrait", "GunGrenadeFastTrait", "GunArmorPenerationTrait", "GunInfiniteAmmoTrait", "GunConsecutiveFireTrait", "GunGrenadeClusterTrait", "GunGrenadeDropTrait", "GunHeavyBulletTrait", "GunHomingBulletTrait", "GunChainShotTrait", "GunLoadedGrenadeBoostTrait", "GunLoadedGrenadeLaserTrait", "GunLoadedGrenadeSpeedTrait", "GunLoadedGrenadeWideTrait", "GunLoadedGrenadeInfiniteAmmoTrait"},

        FistWeapon = { "FistReachAttackTrait", "FistDashAttackHealthBufferTrait", "FistTeleportSpecialTrait", "FistDoubleDashSpecialTrait", "FistChargeSpecialTrait", "FistKillTrait", "FistSpecialLandTrait", "FistAttackFinisherTrait", "FistConsecutiveAttackTrait", "FistSpecialFireballTrait", "FistHeavyAttackTrait", "FistAttackDefenseTrait", "FistDetonateBoostTrait", "MaimBoostTrait"},

        Legendaries =
        {
            "ZeusChargedBoltTrait", "MoreAmmoTrait", "DionysusComboVulnerability", "InstantChillKill", "DoubleCollisionTrait",
            "ShieldHitTrait", "CharmTrait", "AresCursedRiftTrait", "MagnetismTrait", "UnstoredAmmoDamageTrait",
        },
        Duos =
        {
            "LightningCloudTrait", "AutoRetaliateTrait", "AmmoBoltTrait", "ImpactBoltTrait", 
            "ReboundingAthenaCastTrait", "JoltDurationTrait", "ImprovedPomTrait", "RaritySuperBoost", 
            "BlizzardOrbTrait", "TriggerCurseTrait", "SlowProjectileTrait", "ArtemisReflectBuffTrait", 
            "CurseSickTrait", "HeartsickCritDamageTrait", "DionysusAphroditeStackIncreaseTrait", "AresHomingTrait", 
            "IceStrikeArrayTrait", "HomingLaserTrait", "RegeneratingCappedSuperTrait", "StatusImmunityTrait", 
            "PoseidonAresProjectileTrait", "CastBackstabTrait", "NoLastStandRegenerationTrait", "PoisonTickRateTrait", 
            "StationaryRiftTrait", "SelfLaserTrait", "ArtemisBonusProjectileTrait", "PoisonCritVulnerabilityTrait",
        },
        Consumables =
        {
            "RandomMinorLootDrop", "LastStandDurationDrop", "LastStandHealDrop", "DionysusGiftDrop", "HealingPotencyDrop", "HarvestBoonDrop",
        },
        ConsumableTraits =
        {
            RandomMinorLootDrop = "PoseidonPickedUpMinorLootTrait",
            LastStandDurationDrop = "LastStandDurationTrait",
            LastStandHealDrop = "LastStandHealTrait",
            DionysusGiftDrop = "GiftHealthTrait",
            HealingPotencyDrop = "HealingPotencyTrait",
            HarvestBoonDrop = "HarvestBoonTrait",
        },
        BeowulfTraits =
        {
            ZeusRangedTrait = "ShieldLoadAmmo_ZeusRangedTrait",
            PoseidonRangedTrait = "ShieldLoadAmmo_PoseidonRangedTrait",
            AthenaRangedTrait = "ShieldLoadAmmo_AthenaRangedTrait",
            AphroditeRangedTrait = "ShieldLoadAmmo_AphroditeRangedTrait",
            ArtemisRangedTrait = "ShieldLoadAmmo_ArtemisRangedTrait",
            AresRangedTrait = "ShieldLoadAmmo_AresRangedTrait",
            DionysusRangedTrait = "ShieldLoadAmmo_DionysusRangedTrait",
            DemeterRangedTrait = "ShieldLoadAmmo_DemeterRangedTrait",
        },
    },
    Colors =
    {
        Duos = {210, 255, 97, 255},
        Legendaries = { 255, 144, 0, 255 },
        SwordWeapon = { 176, 196, 222, 255 },
        BowWeapon = { 176, 196, 222, 255 },
        ShieldWeapon = { 176, 196, 222, 255 },
        SpearWeapon = { 176, 196, 222, 255 },
        GunWeapon = { 176, 196, 222, 255 },
        FistWeapon = { 176, 196, 222, 255 },
    },
    RealGodNames =
    {
        "Zeus", "Athena", "Poseidon", "Artemis",
        "Aphrodite", "Ares", "Dionysus", "Demeter"
    },
    -- Any trait that should not be reloaded
    ReloadShouldSkip = {
        FastClearDodgeBonusTrait = true,
        PerfectClearDamageBonusTrait = true,
        RoomRewardMaxHealthTrait = true,
        RoomRewardEmptyMaxHealthTrait = true
    },
    FishTable = CodexOrdering.Fish.Order,
    WeaponTable = CodexOrdering.Weapons.Order,
    BoonTable =
    {
        "TrialUpgrade",
        "ZeusUpgrade",
        "PoseidonUpgrade",
        "AthenaUpgrade",
        "AphroditeUpgrade",
        "ArtemisUpgrade",
        "AresUpgrade",
        "DionysusUpgrade",
        "HermesUpgrade",
        "DemeterUpgrade",
        "WeaponUpgrade",
        NPC_Dusa_01 = "Duos"
    },
    ConsumableTable =
    {
        "RoomRewardMetaPointDrop",
        "AmmoPack",
        "RoomRewardMoneyDrop",
        "RoomRewardMaxHealthDrop",
        "ChaosWeaponUpgrade",
        "LockKeyDrop",
        "SuperLockKeyDrop",
        "GemDrop",
        "SuperGemDrop",
        "GiftDrop",
        "SuperGiftDrop",
        "CharonStoreDiscount",
        "RoomRewardConsolationPrize"
    },
    LootTable =
    {
        "StackUpgrade"
    },
    EnemyTable =
    { "HeavyMelee", "LightRanged", "PunchingBagUnit", "ThiefMineLayer", "WretchAssassinMiniboss", "Swarmer", "LightSpawner", "DisembodiedHand",
    "HeavyRanged", "HeavyRangedSplitterMiniboss", "ShieldRanged", "BloodlessNaked", "BloodlessNakedBerserker", "BloodlessGrenadier", "BloodlessSelfDestruct",
    "BloodlessPitcher", "BloodlessWaveFist", "RangedBurrower", "SpreadShotUnit", "FreezeShotUnit", "CrusherUnit", "HitAndRunUnit", "SplitShotUnit", "Chariot",
    "ChariotSuicide", "ShadeSwordUnit", "ShadeSpearUnit", "ShadeBowUnit", "ShadeShieldUnit", "FlurrySpawner", "Crawler", "RatThug", "CrawlerMiniBoss",
    "ThiefImpulseMineLayer", "HeavyRangedForked", "SatyrRanged"
    },
    BossTable =
    {
        NPC_FurySister_01 = RoomSetData.Tartarus.A_Boss01,
        Harpy2 = RoomSetData.Tartarus.A_Boss02,
        Harpy3 = RoomSetData.Tartarus.A_Boss03,
        HydraHeadImmortal = RoomSetData.Asphodel.B_Boss01,
        Theseus = RoomSetData.Elysium.C_Boss01,
        Minotaur = RoomSetData.Elysium.C_MiniBoss01,
        NPC_Hades_01 = RoomSetData.Styx.D_Boss01,
    },
    CommandTable =
    {
        PlayerUnit = function()
        RemoveAllTraits()
        ReloadEquipment()
        CloseCodexScreen()
        end,
        NPC_Achilles_01 = function()
            if IsSuperValid() then
                CloseCodexScreen()
                wait(1, RoomThreadName)
                BuildSuperMeter(CurrentRun, 100)
                CommenceSuperMove()
                UpdateSuperDamageBonus()
                thread( MarkObjectiveComplete, "EXMove" )
                CloseCodexScreen()
            end
        end,
        NPC_Nyx_01 = function()
            CloseCodexScreen()
            OpenCustomMirror()
        end,
        NPC_Skelly_01 = function(triggerArgs)
            CloseCodexScreen()
            KillHero(CurrentRun.Hero, triggerArgs)
        end,
        NPC_Cerberus_01 = function(triggerArgs)
            CloseCodexScreen()
            UIData.AwardMenu.AvailableKeepsakeTraits = GetAvailableKeepsakeTraits()
            UIData.AwardMenu.AvailableAssistTraits = GetAllAssistTraits()
            ShowAwardMenu()
        end,
        NPC_Charon_01 = function()
            CloseCodexScreen()
            CurrentRun.CurrentRoom.Store = nil
            StartUpStore()
        end,
        NPC_Hypnos_01 = function()
            CloseCodexScreen()
            GenerateSellTraitShop(CurrentRun, CurrentRun.CurrentRoom)
            OpenSellTraitMenu()
        end,
        NPC_Orpheus_01 = function()
            --Save state
            CloseCodexScreen()
            SaveState()
        end,
        NPC_Patroclus_01 = function()
            --Load state
            CloseCodexScreen()
            LoadState()
        end,
        NPC_Eurydice_01 = function()
            OpenBoonManager()
        end,
        NPC_Sisyphus_01 = function ()
            CloseCodexScreen()
            OpenBuildMenu()
        end,
    }
})

-- ModUtil part
if ModUtil ~= nil and PQOL == nil then
    local mod = "CodexMenu"

    ModUtil.Path.Wrap( "SetupMap", function(baseFunc)
        DebugPrint({Text = "@"..mod.." Loading all god packages!"})
        LoadPackages({Names = {
            "ZeusUpgrade",
            "PoseidonUpgrade",
            "AthenaUpgrade",
            "AphroditeUpgrade",
            "ArtemisUpgrade",
            "AresUpgrade",
            "DionysusUpgrade",
            "HermesUpgrade",
            "DemeterUpgrade",
            "Chaos"
        }})
        return baseFunc()
    end)
end

CodexMenu.BoonData.GodNames = {}
for key,_ in pairs(CodexMenu.BoonData) do
    table.insert(CodexMenu.BoonData.GodNames,key)
end

function CustomInvertTable(tableArg)
    local inverseTable = {}
    for _,value in pairs(tableArg) do
        inverseTable[value]=true
    end
    return inverseTable
end

for _,value in pairs(CodexMenu.BoonData.GodNames) do
    CodexMenu.BoonData[value.."Inverted"]=CustomInvertTable(CodexMenu.BoonData[value])
end

CodexMenu.BoonData.BoonSelector = { Components = {} }

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
		if IsWeaponTrait(button.Boon) then
			RemoveSameSlotWeapon(button.Boon)
		end
		for i, trait in pairs (CodexMenu.BoonData.Legendaries) do
			if button.Boon == trait then
				isLegendary = true
			end
		end
		if isLegendary then
			AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon, Rarity = "Legendary" }) })
			LockChoice(screen.Components, button)
			return
		end
		for i, trait in pairs (CodexMenu.BoonData.Duos) do
			if button.Boon == trait then
				isDuo = true
			end
		end
		if isDuo then
			AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon, Rarity = "Duo" }) })
            button.DuoScreen = true
			LockChoice(screen.Components, button)
			return
		end
		for i, trait in pairs (CodexMenu.BoonData.Consumables) do
			if button.Boon == trait then
				isConsumable = true
			end
		end
		if isConsumable then
			local consumableData = GetRampedConsumableData(ConsumableData[button.Boon], screen.Rarity)

			if consumableData.UseFunctionArgs ~= nil then
				if consumableData.UseFunctionName ~= nil and consumableData.UseFunctionArgs.TraitName ~= nil then
					local traitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = consumableData.UseFunctionArgs.TraitName, Rarity = screen.Rarity })
					SetTraitTextData( traitData )
					consumableData.UseFunctionArgs.TraitName = nil
					consumableData.UseFunctionArgs.TraitData = traitData
				elseif consumableData.UseFunctionNames ~= nil then
					for i, args in pairs(consumableData.UseFunctionArgs) do
						if args.TraitName ~= nil then
							local processedTraitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = args.TraitName, Rarity = screen.Rarity })
							SetTraitTextData( processedTraitData )
							consumableData.UseFunctionArgs[i].TraitName = nil
							consumableData.UseFunctionArgs[i].TraitData = processedTraitData
						end
					end
				end
			end
			local consumableId = SpawnObstacle({ Name = button.Boon, DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing" })
			local consumable = CreateConsumableItemFromData( consumableId, consumableData, 0 )
			LockChoice(screen.Components, button)
			return
		end
		AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon, Rarity = screen.Rarity }) })
		LockChoice(screen.Components, button)
	end
end

function LockChoice(components, button)
	local purchaseButtonKeyLock = tostring(button).."Lock"
    local group = "BoonSelector"
    if button.DuoScreen then
        group = "BoonManager"
    end
	components[purchaseButtonKeyLock] = CreateScreenComponent({ Name = "BlankObstacle", Group = group, Scale = 0.3 })
	CreateTextBox({ Id = components[purchaseButtonKeyLock].Id, Text = button.Boon,
		FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.DarkGray, Font = "AlegreyaSansSCLight",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
	})
    if button.DuoScreen then
        components[purchaseButtonKeyLock].Boon = button.Boon
    end
	Attach({Id = components[purchaseButtonKeyLock].Id, DestinationId = components.Background.Id, OffsetX = button.X, OffsetY = button.Y })
	Destroy({Id = button.Id})
	SetAnimation({ DestinationId = components[purchaseButtonKeyLock].Id, Name = "BoonSlotLocked" })
end

function HasBeowulf()
	for i, traitData in pairs(CurrentRun.Hero.Traits) do
		if traitData.Name == "ShieldLoadAmmoTrait" or traitData.Name == "UltraShieldTrait" or traitData.Name == "UltraBowTrait" then
			return true
		end
	end
	return false
end

function CheckHadesShout(traits)
  for i, traitData in pairs(traits) do
    if traitData.Name == "HadesShoutTrait" then
      RemoveTrait(CurrentRun.Hero, traitData.Name)
    end
  end
end

function OpenBoonSelector(godName, spawnBoon)
	if IsScreenOpen("BoonSelector") then
		return
	end
	OnScreenOpened( { Flag = "BoonSelector", SkipBlockTimer = true } )
	CloseCodexScreen()
	CheckHadesShout(CurrentRun.Hero.Traits)
	
	if godName ~= nil and CodexMenu.BoonData[godName] then
		local Boons = DeepCopyTable(CodexMenu.BoonData[godName])
		if Boons == nil then
			return
		end
		ScreenAnchors.BoonSelector = DeepCopyTable(CodexMenu.BoonData.BoonSelector)
		local screen = ScreenAnchors.BoonSelector
		local components = screen.Components
		screen.Name = "BoonSelector"
		screen.Rarity = "Common"
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
		components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "BoonSelector" })
		components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "BoonSelector" })
		components.Lighting = CreateScreenComponent({ Name = "BoonSelectLighting", Group = "BoonSelector" })
		components.FrontFx = CreateScreenComponent({ Name = "BoonSelectInFrontFx", Group = "BoonSelector" })
		local lColor = Color.White
		if LootData[godName] then
			lColor = LootData[godName].LootColor or CodexMenu.Colors[godName]
			components.BoonIcon = CreateScreenComponent({ Name = "rectangle01", Group = "BoonSelector", X = 182, Y = 160 })
			SetAnimation({ DestinationId = components.BoonIcon.Id, Name = LootData[godName].Icon, Scale = 0.5 })
		else
			lColor = CodexMenu.Colors[godName]
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
			Boons = CodexMenu.BoonData[wp]
			lColor = CodexMenu.Colors[wp]
		end
        if godName == "Duos" then
            local displayedTraits = {}
            local index = 0
            screen.BoonsList = {}
            screen.DuoScreen = true
            for i,boon in pairs(Boons) do
                if Contains(displayedTraits, boon.Name) then
                    --Skip boon
                else
                    local purchaseButtonKey = "PurchaseButton"..index
                    local rowOffset = 100
                    local columnOffset = 300
                    local boonsPerRow = 4
                    local rowsPerPage = 7
                    local rowIndex = math.floor(index/boonsPerRow)
                    local pageIndex = math.floor(rowIndex/rowsPerPage)
                    local offsetX = screen.RowStartX + columnOffset*(index % boonsPerRow)
                    local offsetY = screen.RowStartY + rowOffset*(rowIndex % rowsPerPage)
                    index = index + 1
                    screen.LastPage = pageIndex
                    if screen.BoonsList[pageIndex] == nil then
                        screen.BoonsList[pageIndex] = {}
                    end
                    table.insert(displayedTraits, boon.Name)
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
        else
            for index, boon in pairs (Boons) do
                    if boon == "LastStandDurationTrait" or boon == "LastStandHealTrait" or boon == "GiftHealthTrait" or boon == "HealingPotencyTrait" then
                        --Skip boon
                    else
                        local purchaseButtonKey = "PurchaseButton"..index
                        local rowoffset = 100
                        local columnoffset = 300
                        local numperrow = 4
                        local offsetX = screen.RowStartX + columnoffset*((index-1) % numperrow)
                        local offsetY = screen.RowStartY + rowoffset*(math.floor((index-1)/numperrow))
                        local color = lColor
                        local lockColor = Color.White
                        if HasBeowulf() and CodexMenu.BoonData.BeowulfTraits[boon] ~= nil then
                            boon = CodexMenu.BoonData.BeowulfTraits[boon]
                        end
                        if HeroHasTrait(boon) then
                            components[purchaseButtonKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "BoonSelector", Scale = 0.3, })
                            Attach({ Id = components[purchaseButtonKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
                            CreateTextBox({ Id = components[purchaseButtonKey].Id, Text = boon,
                                FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.DarkGray, Font = "AlegreyaSansSCLight",
                                ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
                            })
                            SetAnimation({DestinationId = components[purchaseButtonKey].Id, Name = "BoonSlotLocked" })
                        else
                            components[purchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonSelector", Scale = 0.3, })
                            components[purchaseButtonKey].OnPressedFunctionName = "GiveSelectedBoonToPlayer"
                            components[purchaseButtonKey].Boon = boon
                            components[purchaseButtonKey].X = offsetX
                            components[purchaseButtonKey].Y = offsetY
                            Attach({ Id = components[purchaseButtonKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
                            CreateTextBox({ Id = components[purchaseButtonKey].Id, Text = boon,
                                FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = color, Font = "AlegreyaSansSCLight",
                                ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
                            })
                        end
                    end
            end
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
        if godName ~= "Duos" then
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
			if godName ~= "TrialUpgrade" then
				components.HeroicButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonSelector", Scale = 0.3, })
				components.HeroicButton.OnPressedFunctionName = "ChangeBoonSelectorRarity"
				components.HeroicButton.Rarity = "Heroic"
				Attach({ Id = components.HeroicButton.Id, DestinationId = components.Background.Id, OffsetX = 550, OffsetY = 300 })
				CreateTextBox({ Id = components.HeroicButton.Id, Text = "Heroic",
					FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.BoonPatchHeroic, Font = "AlegreyaSansSCLight",
					ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
				})
			end
        end
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
		ModifyTextBox({ Id = screen.LockedModeButton.Id, Text = screen.LockedModeButton.Mode.." Mode"..(screen.LockedModeButton.Icon or "") })
	elseif screen.LockedModeButton ~= nil and screen.LockedModeButton == button then
		-- Switch add or subtract submode (does nothing for Delete mode)
		if button.Add == false then
			button.Substract = false
			button.Add = true
			button.Icon = "(+)"
		else
			button.Add = false
			button.Substract = true
			button.Icon = "(-)"
		end
	end
	screen.Mode = button.Mode
	screen.LockedModeButton = button
	ModifyTextBox({ Id = button.Id, Text = ">>"..button.Mode.." Mode"..(button.Icon or "").."<<" })
end

function GetDowngradedRarity(baseRarity)
	local rarityTable =
	{
		Rare = "Common",
		Epic = "Rare",
		Heroic = "Epic",
	}
	return rarityTable[baseRarity]
end

function HandleBoonManagerClick(screen, button)
	if button.Boon == nil or screen.Mode == nil then
		return
	end
	--All mode
	if screen.AllMode ~= nil and screen.AllMode then
		if screen.Mode == "Level" and screen.LockedModeButton.Add == true then
			local upgradableTraits = {}
			local upgradedTraits = {}
			for i, traitData in pairs(CurrentRun.Hero.Traits) do
				screen.Traits = CurrentRun.Hero.Traits
				local numTraits = GetTraitNameCount(screen, traitData.Name)
				if numTraits < 100 and IsGodTrait(traitData.Name) and TraitData[traitData.Name] and IsGameStateEligible(CurrentRun, TraitData[traitData.Name]) and traitData.Rarity ~= "Legendary" then
					upgradableTraits[traitData.Name] = true
					for _, levelbutton in pairs(screen.Components) do
						if not levelbutton.IsBackground and levelbutton.Boon == traitData then
							levelbutton.Boon.Level = levelbutton.Boon.Level + 1
							ModifyTextBox({Id = levelbutton.Background.Id, Text = "Lv. "..levelbutton.Boon.Level})
						end
					end
				end
			end
			while not IsEmpty(upgradableTraits) do
				local name = RemoveRandomKey(upgradableTraits)
				upgradedTraits[name] = true
				AddTraitToHero({ TraitName = name })
			end
			return
		elseif screen.Mode == "Level" and screen.LockedModeButton.Substract == true then
			-- for i, traitData in pairs(CurrentRun.Hero.Traits) do
			-- 	screen.Traits = CurrentRun.Hero.Traits
			-- 	local numTraits = GetTraitNameCount(screen, traitData.Name)
			-- 	if numTraits > 1 and IsGodTrait(traitData.Name) and TraitData[traitData.Name] and IsGameStateEligible(CurrentRun, TraitData[traitData.Name]) and traitData.Rarity ~= "Legendary" then
			-- 		local numOldTrait = GetTraitNameCount(CurrentRun.Hero, traitData.Name)
			-- 		if numOldTrait > 100 then
			-- 			numOldTrait = 100
			-- 		end
			-- 		numOldTrait = numOldTrait - 1
			-- 		while HeroHasTrait(traitData.Name) do
			-- 			RemoveTrait(CurrentRun.Hero, traitData.Name)
			-- 		end
			-- 		while numOldTrait > 0 do
			-- 			AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity }) })
			-- 			numOldTrait = numOldTrait - 1
			-- 		end
			-- 		AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity }) })
			-- 		for _, levelbutton in pairs(screen.Components) do
			-- 			if not levelbutton.IsBackground and levelbutton.Boon == traitData then
			-- 				levelbutton.Boon.Level = levelbutton.Boon.Level - 1
			-- 				ModifyTextBox({Id = levelbutton.Background.Id, Text = "Lv. "..levelbutton.Boon.Level})
			-- 			end
			-- 		end
			-- 	end
			-- end
			-- return
		elseif screen.Mode == "Rarity" then
			local upgradableTraits = {}
			local upgradedTraits = {}
			for i, traitData in pairs( CurrentRun.Hero.Traits ) do
				if IsGodTrait(traitData.Name, { ForShop = true }) or Contains(CodexMenu.BoonData.ConsumableTraits, traitData.Name) or IsHermesChaosHammerCharonBoon(traitData.Name) then
					if TraitData[traitData.Name] and traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil then
						if Contains(upgradableTraits, traitData) or traitData.Rarity == "Legendary" then
						else
							table.insert(upgradableTraits, traitData )
						end
					end
				end
			end
			for _, colorButton in pairs(screen.Components) do
				if colorButton.IsBackground == true and colorButton.Boon.Rarity ~= "Legendary" then
					SetColor({Id = colorButton.Id, Color = Color.BoonPatchHeroic})
				end
			end
			while not IsEmpty(upgradableTraits) do
				local traitData = RemoveRandomValue(upgradableTraits)
				upgradedTraits[traitData.Name] = true
				RemoveTrait(CurrentRun.Hero, traitData.Name)
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = "Heroic" }) })
			end
			return
		elseif screen.Mode == "Delete" then
				RemoveAllTraits()
				ReloadEquipment()
				CloseBoonManager(screen, button)
			return
		end
	else
		--Individual mode
		if screen.Mode == "Level" and screen.LockedModeButton.Add == true then
			if GetTraitNameCount(CurrentRun.Hero, button.Boon.Name) < 100 and TraitData[button.Boon.Name] and IsGameStateEligible(CurrentRun, TraitData[button.Boon.Name]) then
				AddTraitToHero({TraitName = button.Boon.Name})
				button.Boon.Level = button.Boon.Level + 1
				ModifyTextBox({Id = button.Background.Id, Text = "Lv. "..button.Boon.Level})
			end
			return
		elseif screen.Mode == "Level" and screen.LockedModeButton.Substract == true then
			if GetTraitNameCount(CurrentRun.Hero, button.Boon.Name) > 1 and TraitData[button.Boon.Name] and IsGameStateEligible(CurrentRun, TraitData[button.Boon.Name]) then
				local numOldTrait = GetTraitNameCount(CurrentRun.Hero, button.Boon.Name)
				if numOldTrait > 100 then
					numOldTrait = 100
				end
				numOldTrait = numOldTrait - 1
				while HeroHasTrait(button.Boon.Name) do
					RemoveTrait(CurrentRun.Hero, button.Boon.Name)
				end
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon.Name, Rarity = button.Boon.Rarity }) })
				for i=1, numOldTrait-1 do
					AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon.Name, Rarity = button.Boon.Rarity }) })
				end
				button.Boon.Level = button.Boon.Level - 1
				ModifyTextBox({Id = button.Background.Id, Text = "Lv. "..button.Boon.Level})
			end
			return
		elseif screen.Mode == "Rarity" and screen.LockedModeButton.Add == true then
			if IsGodTrait(button.Boon.Name, { ForShop = true }) or Contains(CodexMenu.BoonData.ConsumableTraits, button.Boon.Name) or IsChaosBoon(button.Boon.Name) or IsHermesBoon(button.Boon.Name) then
				if TraitData[button.Boon.Name] and button.Boon.Rarity ~= nil and GetUpgradedRarity(button.Boon.Rarity) ~= nil and button.Boon.RarityLevels[GetUpgradedRarity(button.Boon.Rarity)] ~= nil then
					local numOldTrait = GetTraitNameCount(CurrentRun.Hero, button.Boon.Name)
					if numOldTrait > 100 then
						numOldTrait = 10
					end
					while HeroHasTrait(button.Boon.Name) do
						RemoveTrait(CurrentRun.Hero, button.Boon.Name)
					end
					button.Boon.Rarity = GetUpgradedRarity(button.Boon.Rarity)
					SetColor({Id = button.Background.Id, Color = Color["BoonPatch"..button.Boon.Rarity]})
					AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon.Name, Rarity = button.Boon.Rarity }) })
					for i=1, numOldTrait-1 do
						AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon.Name, Rarity = button.Boon.Rarity }) })
					end
					CheckHadesShout(CurrentRun.Hero.Traits)
					
				end
			end
			return
		elseif screen.Mode == "Rarity" and screen.LockedModeButton.Substract == true then
			if IsGodTrait(button.Boon.Name, { ForShop = true }) or Contains(CodexMenu.BoonData.ConsumableTraits, button.Boon.Name) or IsChaosBoon(button.Boon.Name) or IsHermesBoon(button.Boon.Name) then
				if TraitData[button.Boon.Name] and button.Boon.Rarity ~= nil and GetDowngradedRarity(button.Boon.Rarity) ~= nil and button.Boon.RarityLevels[GetDowngradedRarity(button.Boon.Rarity)] ~= nil then
					local numOldTrait = GetTraitNameCount(CurrentRun.Hero, button.Boon.Name)
					if numOldTrait > 100 then
						numOldTrait = 100
					end
					while HeroHasTrait(button.Boon.Name) do
						RemoveTrait(CurrentRun.Hero, button.Boon.Name)
					end
					button.Boon.Rarity = GetDowngradedRarity(button.Boon.Rarity)
					SetColor({Id = button.Background.Id, Color = Color["BoonPatch"..button.Boon.Rarity]})
					AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon.Name, Rarity = button.Boon.Rarity }) })
					for i=1, numOldTrait-1 do
						AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = button.Boon.Name, Rarity = button.Boon.Rarity }) })
					end
					CheckHadesShout(CurrentRun.Hero.Traits)
					
				end
			end
			return
		elseif screen.Mode == "Delete" then
			screen.BoonsList[screen.CurrentPage][button.Index] = nil
			while HeroHasTrait(button.Boon.Name) do
				RemoveTrait(CurrentRun.Hero, button.Boon.Name)
			end
			Destroy({ Ids = { button.Id, button.Background.Id } })
			CheckHadesShout(CurrentRun.Hero.Traits)
			
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
				if displayedTraits[boonData.boon.Name] or displayedTraits[boonData.boon] then
					--Skip
				else
					local color = Color.White
				for _, godName in pairs(CodexMenu.BoonData.GodNames) do
					if CodexMenu.BoonData[godName.."Inverted"] then
						if CodexMenu.BoonData[godName.."Inverted"][boonData.boon.Name] or CodexMenu.BoonData[godName.."Inverted"][boonData.boon] then
							if LootData[godName] then
								color = CodexMenu.Colors[godName] or LootData[godName].LootColor
							else
								color = CodexMenu.Colors[godName]
								break
							end
						end
					end
				end
				if screen.DuoScreen then
					displayedTraits[boonData.boon] = true
					local purchaseButtonKey = "PurchaseButton"..boonData.index
					if HeroHasTrait(boonData.boon) then
						screen.Components[purchaseButtonKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "BoonManager", Scale = 0.3, })
						screen.Components[purchaseButtonKey].Boon = boonData.boon
						screen.Components[purchaseButtonKey].Index = boonData.index
						screen.Components[purchaseButtonKey].X = boonData.offsetX
						screen.Components[purchaseButtonKey].Y = boonData.offsetY
						Attach({ Id = screen.Components[purchaseButtonKey].Id, DestinationId = screen.Components.Background.Id, OffsetX = boonData.offsetX, OffsetY = boonData.offsetY })
						CreateTextBox({ Id = screen.Components[purchaseButtonKey].Id, Text = boonData.boon,
							FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.DarkGray, Font = "AlegreyaSansSCLight",
							ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
						})
						SetAnimation({DestinationId = screen.Components[purchaseButtonKey].Id, Name = "BoonSlotLocked" })
					else
						screen.Components[purchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonManager", Scale = 0.3, })
						screen.Components[purchaseButtonKey].OnPressedFunctionName = "GiveSelectedBoonToPlayer"
						screen.Components[purchaseButtonKey].Boon = boonData.boon
						screen.Components[purchaseButtonKey].Index = boonData.index
						screen.Components[purchaseButtonKey].X = boonData.offsetX
						screen.Components[purchaseButtonKey].Y = boonData.offsetY
						Attach({ Id = screen.Components[purchaseButtonKey].Id, DestinationId = screen.Components.Background.Id, OffsetX = boonData.offsetX, OffsetY = boonData.offsetY })
						CreateTextBox({ Id = screen.Components[purchaseButtonKey].Id, Text = boonData.boon,
							FontSize = 22, OffsetX = 0, OffsetY = -5, Width = 720, Color = color, Font = "AlegreyaSansSCLight",
							ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
						})
					end
				else
					if boonData.boon.Rarity == nil then
						boonData.boon.Rarity = "Common"
					end
					displayedTraits[boonData.boon.Name] = true
					local purchaseButtonKeyBG = "PurchaseButtonBG"..boonData.index
					screen.Components[purchaseButtonKeyBG] = CreateScreenComponent({ Name = "rectangle01", Group = "BoonManager", Scale = 0.28, })
					screen.Components[purchaseButtonKeyBG].IsBackground = true
					screen.Components[purchaseButtonKeyBG].Boon = boonData.boon
					CreateTextBox({ Id = screen.Components[purchaseButtonKeyBG].Id, Text = "Lv. "..boonData.boon.Level,
						FontSize = 15, OffsetX = 95, OffsetY = 16, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
						ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
					})
					SetColor({ Id = screen.Components[purchaseButtonKeyBG].Id, Color = Color["BoonPatch"..boonData.boon.Rarity]})
					SetScaleX({ Id = screen.Components[purchaseButtonKeyBG].Id, Fraction = 2})
					local purchaseButtonKey = "PurchaseButton"..boonData.index
					screen.Components[purchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonManager", Scale = 0.3, })
					screen.Components[purchaseButtonKey].OnPressedFunctionName = "HandleBoonManagerClick"
					screen.Components[purchaseButtonKey].Boon = boonData.boon
					screen.Components[purchaseButtonKey].Index = boonData.index
					screen.Components[purchaseButtonKey].Background = screen.Components[purchaseButtonKeyBG]
					Attach({ Id = screen.Components[purchaseButtonKey].Id, DestinationId = screen.Components.Background.Id, OffsetX = boonData.offsetX, OffsetY = boonData.offsetY })
					Attach({ Id = screen.Components[purchaseButtonKeyBG].Id, DestinationId = screen.Components[purchaseButtonKey].Id })
					CreateTextBox({ Id = screen.Components[purchaseButtonKey].Id, Text = boonData.boon.Name,
					FontSize = 22, OffsetX = 0, OffsetY = -5, Width = 720, Color = color, Font = "AlegreyaSansSCLight",
					ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
					})
				end
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
		components.LeftPageButton.ControlHotkeys = { "MenuLeft", "Left" }
	end
	if screen.CurrentPage ~= screen.LastPage then
		components.RightPageButton = CreateScreenComponent({ Name = "ButtonCodexRight", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "BoonManager" })
		Attach({ Id = components.RightPageButton.Id, DestinationId = components.Background.Id, OffsetX = 720, OffsetY = -350 })
		components.RightPageButton.OnPressedFunctionName = "BoonManagerChangePage"
		components.RightPageButton.Direction = "Right"
		components.RightPageButton.ControlHotkeys = { "MenuRight", "Right" }
	end
end

function RandomColor(rng)
	local Color_Collapsed = CollapseTable(Color)
   return Color_Collapsed[RandomInt(1, #Color_Collapsed, rng)]
end

function OpenBoonManager()
    if IsScreenOpen("BoonManager") then
		return
	end
	OnScreenOpened( { Flag = "BoonManager", SkipBlockTimer = true } )
	CloseCodexScreen()
	CheckHadesShout(CurrentRun.Hero.Traits)
	if CurrentRun.Hero.Traits ~= nil then
		ScreenAnchors.BoonSelector = DeepCopyTable(CodexMenu.BoonData.BoonSelector)
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
		for i, boon in pairs(CurrentRun.Hero.Traits) do
			if Contains(displayedTraits, boon.Name) or boon.Name == "GodModeTrait" then
			else
				if IsGodTrait(boon.Name) or IsHermesChaosHammerCharonBoon(boon.Name) or Contains(CodexMenu.BoonData.ConsumableTraits, boon.Name) then
					table.insert(displayedTraits, boon.Name)
					local rowOffset = 100
					local columnOffset = 300
					local boonsPerRow = 4
					local rowsPerPage = 4
					local rowIndex = math.floor(index/boonsPerRow)
					local pageIndex = math.floor(rowIndex/rowsPerPage)
					local offsetX = screen.RowStartX + columnOffset*(index % boonsPerRow)
					local offsetY = screen.RowStartY + rowOffset*(rowIndex % rowsPerPage)
					boon.Level = GetTraitNameCount(CurrentRun.Hero, boon.Name)
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
		end
        -- print(ModUtil.ToString.Deep( displayedTraits, nil, nil, '\t' ))
		BoonManagerLoadPage(screen)
		--Instructions
		components.ModeDisplay = CreateScreenComponent({ Name = "BlankObstacle", Group = "BoonManager" })
		Attach({ Id = components.ModeDisplay.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = 200 })
		CreateTextBox({ Id = components.ModeDisplay.Id, Text = "Choose a mode",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		CreateTextBox({ Id = components.ModeDisplay.Id, Text = "Click Level Mode or Rarity Mode again to switch Add(+) and Substract(-) submodes",
		FontSize = 19, OffsetX = 0, OffsetY = 30, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
		--Mode Buttons
		components.LevelModeButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonManager", Scale = 0.3, })
		components.LevelModeButton.OnPressedFunctionName = "ChangeBoonManagerMode"
		components.LevelModeButton.Mode = "Level"
		components.LevelModeButton.Add = true
		components.LevelModeButton.Substract = false
		components.LevelModeButton.Icon = "(+)"
		Attach({ Id = components.LevelModeButton.Id, DestinationId = components.Background.Id, OffsetX = -350, OffsetY = 300 })
		CreateTextBox({ Id = components.LevelModeButton.Id, Text = "Level Mode(+)",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.RarityModeButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "BoonManager", Scale = 0.3, })
		components.RarityModeButton.OnPressedFunctionName = "ChangeBoonManagerMode"
		components.RarityModeButton.Mode = "Rarity"
		components.RarityModeButton.Add = true
		components.RarityModeButton.Substract = false
		components.RarityModeButton.Icon = "(+)"
		Attach({ Id = components.RarityModeButton.Id, DestinationId = components.Background.Id, OffsetX = -50, OffsetY = 300 })
		CreateTextBox({ Id = components.RarityModeButton.Id, Text = "Rarity Mode(+)",
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
	CheckHadesShout(CurrentRun.Hero.Traits)
	OnScreenClosed({ Flag = "BoonManager" })
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
	OnScreenClosed({ Flag = "BoonSelector" })
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
	if true then
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
	for k, upgradeName in pairs( GameState.MetaUpgradesSelected ) do
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
			CreateMetaUpgradeEntry( { Screen = screen, Components = components, Data = upgradeData, Index = k, OffsetY = itemLocationY, Swap = true } )

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

function IsWeaponTrait(traitName)
	if traitName ~= nil and not IsHermesChaosHammerCharonBoon(traitName) then
		if string.match(traitName, "WeaponTrait") then
			return true
		elseif string.match(traitName, "RangedTrait") then
			return true
		elseif string.match(traitName, "SecondaryTrait") then
			return true
		elseif string.match(traitName, "RushTrait") then
			return true
		elseif string.match(traitName, "ShoutTrait") then
			return true
		else
			return false
		end
	end
end

function RemoveSameSlotWeapon(traitName)
	local weaponType
	for _, god in pairs(CodexMenu.RealGodNames) do
		if string.match(traitName, god) then
			if string.match(traitName, "WeaponTrait") then
				weaponType = "WeaponTrait"
			end
		end
	end
	if weaponType == nil then
		if string.match(traitName, "RangedTrait") then
			weaponType = "RangedTrait"
		elseif string.match(traitName, "SecondaryTrait") then
			weaponType = "SecondaryTrait"
		elseif string.match(traitName, "RushTrait") then
			weaponType = "RushTrait"
		elseif string.match(traitName, "ShoutTrait") then
			weaponType = "ShoutTrait"
		else
			return
		end
	end
	for i, traitData in pairs (CurrentRun.Hero.Traits) do
		if string.match(traitData.Name, weaponType) and not IsHermesChaosHammerCharonBoon(traitData.Name) then
			for _, god in pairs(CodexMenu.RealGodNames) do
				if string.match(traitData.Name, god) then
					RemoveWeaponTrait(traitData.Name)
				end
			end
		end
	end
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
			for i, option in pairs (StoreData.RoomShop.HealingOffers.WeightedList) do
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

-- ModUtil.RegisterMod("BuildManager")

-- BuildMenuScreen = { Components = {} }
-- BuildMenuData = {
-- 	BuildMenuScreen =
-- 	{
-- 		Buttons =
-- 		{
-- 			OpenBuildMaker =
-- 			{
-- 				Name = "OpenBuildMakerButton",
-- 				Title = "Open Build Maker",
-- 				Function = "OpenBuildMaker",
-- 				Index = 1,
-- 				Buttons =
-- 				{
-- 					BuildMakerOverview =
-- 					{
-- 						Name = "BuildMakerOverviewButton",
-- 						Title = "Show build overview",
-- 						Function = "BuildMakerOverview",
-- 						Index = 1,
-- 					},
-- 					BuildMakerMirror =
-- 					{
-- 						Name = "BuildMakerMirrorButton",
-- 						Title = "Choose mirror upgrades",
-- 						Function = "BuildMakerMirror",
-- 						Index = 2,
-- 					},
-- 					BuildMakerWeapon =
-- 					{
-- 						Name = "BuildMakerWeaponButton",
-- 						Title = "Choose weapon and aspect",
-- 						Function = "BuildMakerWeapon",
-- 						Index = 3,
-- 					},
-- 					BuildMakerKeepsake =
-- 					{
-- 						Name = "BuildMakerKeepsakeButton",
-- 						Title = "Choose keepsake and summon",
-- 						Function = "BuildMakerKeepsake",
-- 						Index = 4,
-- 					},
-- 					BuildMakerBoons =
-- 					{
-- 						Name = "BuildMakerBoonsButton",
-- 						Title = "Pick boons",
-- 						Function = "BuildMakerBoons",
-- 						Index = 5,
-- 					},
-- 					BuildMakerPact =
-- 					{
-- 						Name = "BuildMakerPactButton",
-- 						Title = "Choose pact options",
-- 						Function = "BuildMakerPact",
-- 						Index = 6,
-- 					},
-- 					BuildMakerContractor = 
-- 					{
-- 						Name = "BuildMakerContractorButton",
-- 						Title = "Choose contractor upgrades",
-- 						Function = "BuildMakerContractor",
-- 						Index = 7,
-- 					},
-- 					BuildMakerImport =
-- 					{
-- 						Name = "BuildMakerImportButton",
-- 						Title = "Import current build",
-- 						Function = "BuildMakerImport",
-- 						Index = 8,
-- 					},
-- 					BuildMakerSave = 
-- 					{
-- 						Name = "BuildMakerSaveButton",
-- 						Title = "Save build",
-- 						Function = "BuildMakerSave",
-- 						Index = 9,
-- 					}
-- 				}
-- 			},
-- 			OpenBuildMenu =
-- 			{
-- 				Name = "OpenBuildViewerButton",
-- 				Title = "View Saved Builds",
-- 				Function = "OpenBuildViewer",
-- 				Index = 2,
-- 			},
-- 		},
-- 	},
-- }

-- function OpenBuildMenu()
-- 	ScreenAnchors.BuildMenu = DeepCopyTable(BuildMenuScreen)
-- 	local screen = ScreenAnchors.BuildMenu
-- 	local components = screen.Components
-- 	screen.Title = "Codex Menu Build Menu"
-- 	screen.Name = "BuildMenuScreen"
--     if BuildManager.Data.SavedBuilds == nil then
--         BuildManager.Data.SavedBuilds = {}
--     end
-- 	OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
-- 	SetConfigOption({ Name = "UseOcclusion", Value = false })
-- 	FreezePlayerUnit()
-- 	EnableShopGamepadCursor()
-- 	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
-- 	--Background
-- 	components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "BuildMenu" })
-- 	components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "BuildMenu" })
-- 	components.TitleAnchor = CreateScreenComponent({ Name = "BlankObstacle", Group = "BuildMenu" })
-- 	SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
-- 	SetColor({ Id = components.BackgroundDim.Id, Color = { 69, 69, 69, 255 } })
-- 	--Title
-- 	CreateTextBox({ Id = components.TitleAnchor.Id, Text = screen.Title, FontSize = 34,
-- 	OffsetX = 0, OffsetY = -500, Color = Color.White, Font = "SpectralSCLight",
-- 	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
-- 	--Close button
-- 	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
-- 	Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 0, OffsetY = 500 })
-- 	components.CloseButton.OnPressedFunctionName = "CloseBuildMenu"
-- 	components.CloseButton.ControlHotkey = "Cancel"
-- 	--Display
-- 	if BuildMenuData[screen.Name] ~= nil then
-- 		if BuildMenuData[screen.Name].Buttons ~= nil then
-- 			for i, button in pairs(BuildMenuData[screen.Name].Buttons) do
-- 				local index = button.Index
-- 				local rowstartX = 0
-- 				local rowstartY = -400
-- 				local rowoffset = 100
-- 				local columnoffset = 300
-- 				local numperrow = 1
-- 				local offsetX = rowstartX + columnoffset*((index-1) % numperrow)
-- 				local offsetY = rowstartY + rowoffset*(math.floor((index-1)/numperrow))

-- 				components[button.Name] = CreateScreenComponent({ Name = "BoonSlot1", Group = "BuildMenu", Scale = 0.3 })
-- 				SetScaleX({Id = components[button.Name].Id, Fraction = 1.5})
-- 				components[button.Name].OnPressedFunctionName = button.Function
-- 				components[button.Name].ToDestroy = true
-- 				Attach({Id = components[button.Name].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
-- 				CreateTextBox({ Id = components[button.Name].Id, Text = button.Title, FontSize = 22,
-- 				OffsetX = 0, OffsetY = 0, Color = Color.White, Font = "AlegreyaSansSCLight", Justification = "Center" })
-- 			end
-- 		end
-- 	end
-- 	--End
-- 	screen.KeepOpen = true
-- 	thread(HandleWASDInput, screen)
-- 	HandleScreenInput(screen)
-- end

-- function OpenBuildMaker(screen, button)
-- 	CleanScreen(screen, button)
-- 	local components = screen.Components
-- 	ModifyTextBox({Id = components.TitleAnchor.Id, Text = "Codex Menu Build Maker"})
-- 	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
-- 	components.ReturnButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
-- 	components.ReturnButton.OnPressedFunctionName = "ReturnToBuildMenu"
-- 	components.ReturnButton.ToDestroy = true
-- 	Attach({ Id = components.ReturnButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = 500 })
-- 	SetColor({Id = components.ReturnButton.Id, Color = Color.LightBlue})

-- 	screen.Build = CreateNewBuild()

-- 	for i, button in pairs(BuildMenuData.BuildMenuScreen.Buttons.OpenBuildMaker.Buttons) do
-- 		local index = button.Index
-- 		local rowstartX = 0
-- 		local rowstartY = -400
-- 		local rowoffset = 100
-- 		local columnoffset = 300
-- 		local numperrow = 1
-- 		local offsetX = rowstartX + columnoffset*((index-1) % numperrow)
-- 		local offsetY = rowstartY + rowoffset*(math.floor((index-1)/numperrow))

-- 		components[button.Name] = CreateScreenComponent({ Name = "BoonSlot1", Group = "BuildMenu", Scale = 0.3 })
-- 		SetScaleX({Id = components[button.Name].Id, Fraction = 1.5})
-- 		components[button.Name].OnPressedFunctionName = button.Function
-- 		components[button.Name].ToDestroy = true
-- 		Attach({Id = components[button.Name].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
-- 		CreateTextBox({ Id = components[button.Name].Id, Text = button.Title, FontSize = 22,
-- 		OffsetX = 0, OffsetY = 0, Color = Color.White, Font = "AlegreyaSansSCLight", Justification = "Center" })
-- 	end
-- end

-- function CreateNewBuild()
-- 	local newBuild =
-- 	{
-- 		Weapon = "",
-- 		Aspect = {},
-- 		Keepsake = "",
-- 		Assist = "",
-- 		MirrorUpgrades = {},
-- 		PactOptions = {},
-- 		Boons = {},
-- 		ContractorUpgrades = {},
-- 	}
-- 	return newBuild
-- end

-- function ReturnToBuildMaker(screen, button)
-- 	CleanScreen(screen, button)
-- 	local components = screen.Components
-- 	ModifyTextBox({Id = components.TitleAnchor.Id, Text = "Codex Menu Build"})
-- 	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
-- 	components.ReturnButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
-- 	components.ReturnButton.OnPressedFunctionName = "ReturnToBuildMenu"
-- 	components.ReturnButton.ToDestroy = true
-- 	Attach({ Id = components.ReturnButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = 500 })
-- 	SetColor({Id = components.ReturnButton.Id, Color = Color.LightBlue})

-- 	for i, button in pairs(BuildMenuData.BuildMenuScreen.Buttons.OpenBuildMaker.Buttons) do
-- 		local index = button.Index
-- 		local rowstartX = 0
-- 		local rowstartY = -400
-- 		local rowoffset = 100
-- 		local columnoffset = 300
-- 		local numperrow = 1
-- 		local offsetX = rowstartX + columnoffset*((index-1) % numperrow)
-- 		local offsetY = rowstartY + rowoffset*(math.floor((index-1)/numperrow))

-- 		components[button.Name] = CreateScreenComponent({ Name = "BoonSlot1", Group = "BuildMenu", Scale = 0.3 })
-- 		SetScaleX({Id = components[button.Name].Id, Fraction = 1.5})
-- 		components[button.Name].OnPressedFunctionName = button.Function
-- 		components[button.Name].ToDestroy = true
-- 		Attach({Id = components[button.Name].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
-- 		CreateTextBox({ Id = components[button.Name].Id, Text = button.Title, FontSize = 22,
-- 		OffsetX = 0, OffsetY = 0, Color = Color.White, Font = "AlegreyaSansSCLight", Justification = "Center" })
-- 	end
-- end

-- function BuildMakerOverview(screen, button)
-- 	CleanScreen(screen, button)
-- 	local components = screen.Components
-- 	ModifyTextBox({Id = components.TitleAnchor.Id, Text = "Codex Menu Build Overview"})
-- 	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
-- 	components.ReturnButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
-- 	components.ReturnButton.OnPressedFunctionName = "ReturnToBuildMaker"
-- 	components.ReturnButton.ToDestroy = true
-- 	Attach({ Id = components.ReturnButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = 500 })
-- 	SetColor({Id = components.ReturnButton.Id, Color = Color.LightBlue})

--     local build = screen.Build

--     if build.Weapon ~= "" then
        
--     end


-- end

-- function BuildMakerMirror(screen, button)

-- end

-- function BuildMakerWeapon(screen, button)

-- end

-- function BuildMakerKeepsake(screen, button)

-- end

-- function BuildMakerBoons(screen, button)
--     CleanScreen(screen, button)
-- 	local components = screen.Components
-- 	ModifyTextBox({Id = components.TitleAnchor.Id, Text = "Boon Picker"})
-- 	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
-- 	components.ReturnButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
-- 	components.ReturnButton.OnPressedFunctionName = "ReturnToBuildMaker"
-- 	components.ReturnButton.ToDestroy = true
-- 	Attach({ Id = components.ReturnButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = 500 })
-- 	SetColor({Id = components.ReturnButton.Id, Color = Color.LightBlue})
    
-- end

-- function BuildMakerPact(screen, button)

-- end

-- function BuildMakerContractor(screen, button)

-- end

-- function BuildMakerImport(screen, button)
-- 	local build = screen.Build

-- 	build.Weapon = GetEquippedWeapon()
-- 	if GameState.LastInteractedWeaponUpgrade ~= nil and GetWeaponUpgradeTrait( GameState.LastInteractedWeaponUpgrade.WeaponName, GameState.LastInteractedWeaponUpgrade.ItemIndex ) ~= nil then
-- 		build.Aspect = { Name = GetWeaponUpgradeTrait(build.Weapon, GameState.LastWeaponUpgradeData[build.Weapon].Index), Rarity = GetRarityKey(GetWeaponUpgradeLevel(build.Weapon, GetEquippedWeaponTraitIndex(build.Weapon))) }
-- 	end
-- 	build.Keepsake = GameState.LastAwardTrait
-- 	build.Assist = GameState.LastAssistTrait

-- 	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
-- 		if traitData.Name ~= build.Weapon and traitData.Name ~= build.Aspect.Name
-- 		and traitData.Name ~= build.Keepsake and traitData.Name ~= build.Assist then
-- 			table.insert(build.Boons, { Name = traitData.Name, Rarity = traitData.Rarity, })
-- 		end
-- 	end

--     screen.Build = build
-- end

-- function BuildMakerSave(screen, button)
--     if screen.Build ~= nil and not Contains(BuildManager.Data.SavedBuilds, screen.Build) then
--         table.insert(BuildManager.Data.SavedBuilds, screen.Build)
--     end
-- end

-- function OpenBuildViewer(screen, button)
-- 	CleanScreen(screen, button)
-- 	local components = screen.Components
-- 	ModifyTextBox({Id = components.TitleAnchor.Id, Text = "Codex Menu Build Viewer"})
-- 	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })

-- 	components.ReturnButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
-- 	components.ReturnButton.OnPressedFunctionName = "ReturnToBuildMenu"
-- 	components.ReturnButton.ToDestroy = true
-- 	Attach({ Id = components.ReturnButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = 500 })
-- 	SetColor({Id = components.ReturnButton.Id, Color = Color.LightBlue})
-- end

-- function ReturnToBuildMenu(screen, button)
-- 	CleanScreen(screen, button)
-- 	local components = screen.Components
-- 	ModifyTextBox({Id = components.TitleAnchor.Id, Text = screen.Title})
-- 	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })

-- 	if BuildMenuData[screen.Name] ~= nil then
-- 		if BuildMenuData[screen.Name].Buttons ~= nil then
-- 			for i, button in pairs(BuildMenuData[screen.Name].Buttons) do
-- 				local index = button.Index
-- 				local rowstartX = 0
-- 				local rowstartY = -400
-- 				local rowoffset = 100
-- 				local columnoffset = 300
-- 				local numperrow = 1
-- 				local offsetX = rowstartX + columnoffset*((index-1) % numperrow)
-- 				local offsetY = rowstartY + rowoffset*(math.floor((index-1)/numperrow))

-- 				components[button.Name] = CreateScreenComponent({ Name = "BoonSlot1", Group = "BuildMenu", Scale = 0.3 })
-- 				SetScaleX({Id = components[button.Name].Id, Fraction = 1.5})
-- 				components[button.Name].OnPressedFunctionName = button.Function
-- 				components[button.Name].ToDestroy = true
-- 				Attach({Id = components[button.Name].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
-- 				CreateTextBox({ Id = components[button.Name].Id, Text = button.Title, FontSize = 22,
-- 				OffsetX = 0, OffsetY = 0, Color = Color.White, Font = "AlegreyaSansSCLight", Justification = "Center" })
-- 			end
-- 		end
-- 	end
-- end

-- function CleanScreen(screen, button)
-- 	if screen == nil then
-- 		return
-- 	end

-- 	local ToDestroy = {}
-- 	for i, component in pairs(screen.Components) do
-- 		if component.ToDestroy then
-- 			table.insert(ToDestroy, component.Id)
-- 		end
-- 	end

-- 	if ToDestroy ~= nil then
-- 		Destroy({Ids = ToDestroy})
-- 	end
-- end

-- function CloseBuildMenu(screen, button)
--   DisableShopGamepadCursor()
--   SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
--   SetConfigOption({ Name = "UseOcclusion", Value = true })
--   CloseScreen(GetAllIds(screen.Components), 0.1)
--   PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
--   ScreenAnchors.BuildMenu = nil
--   UnfreezePlayerUnit()
--   screen.KeepOpen = false
--   OnScreenClosed({ Flag = screen.Name })
-- end

function SaveState()
	if CurrentRun.Hero.Traits ~= nil then
		local wp = GetEquippedWeapon()
		if GameState.LastInteractedWeaponUpgrade ~= nil and GetWeaponUpgradeTrait( GameState.LastInteractedWeaponUpgrade.WeaponName, GameState.LastInteractedWeaponUpgrade.ItemIndex ) ~= nil then
			GameState.CodexMenuSavedState = { Traits = {}, Weapon = wp, Aspect = { Name = GetWeaponUpgradeTrait(wp, GameState.LastWeaponUpgradeData[wp].Index), Rarity = GetRarityKey(GetWeaponUpgradeLevel(wp, GetEquippedWeaponTraitIndex(wp))) }, Keepsake = GameState.LastAwardTrait, Assist = GameState.LastAssistTrait, }
		else
			GameState.CodexMenuSavedState = { Traits = {}, Weapon = wp, Keepsake = GameState.LastAwardTrait, Assist = GameState.LastAssistTrait, }
			GameState.CodexMenuSavedState.Aspect = { Name = nil, Rarity = nil}
		end
		for i, traitData in pairs( CurrentRun.Hero.Traits ) do
			if traitData.Name ~= GameState.CodexMenuSavedState.Weapon and traitData.Name ~= GameState.CodexMenuSavedState.Aspect.Name
			and traitData.Name ~= GameState.CodexMenuSavedState.Keepsake and traitData.Name ~= GameState.CodexMenuSavedState.Assist
			then
				table.insert(GameState.CodexMenuSavedState.Traits, { Name = traitData.Name, Rarity = traitData.Rarity, })
			end
		end
		SaveCheckpoint({ DevSaveName = CreateDevSaveName( CurrentRun )})
	end
end

function LoadState()
	if GameState.CodexMenuSavedState ~= nil then
		RemoveAllTraits()
		if GameState.LastAwardTrait == "ReincarnationTrait" then
			RemoveLastStand( CurrentRun.Hero, "ReincarnationTrait" )
			CurrentRun.Hero.MaxLastStands = CurrentRun.Hero.MaxLastStands - 1
		end
		EquipPlayerWeapon( WeaponData[GameState.CodexMenuSavedState.Weapon], { PreLoadBinks = true } )
		GameState.LastInteractedWeaponUpgrade = { WeaponName = GetEquippedWeapon(), ItemIndex = GetEquippedWeaponTraitIndex( GetEquippedWeapon() ) }
		EquipKeepsake(CurrentRun.Hero, GameState.CodexMenuSavedState.Keepsake)
		EquipAssist(CurrentRun.Hero, GameState.CodexMenuSavedState.Assist)
		if GameState.CodexMenuSavedState.Aspect.Name ~= nil then
			AddTraitToHero({ TraitName = GameState.CodexMenuSavedState.Aspect.Name, Rarity = GameState.CodexMenuSavedState.Aspect.Rarity })
		end
		for i, traitData in pairs( GameState.CodexMenuSavedState.Traits ) do
			AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity }) })
		end
	end
end


OnAnyLoad{"RoomPreRun", function(triggerArgs)
    if GameState.BuildData == nil then
      InitializeBuildData()
    end
end}

function InitializeBuildData()
	GameState.BuildData =
	{
		CustomBuilds = {},
		PreSetBuilds = {},
	}
end

OnControlPressed{ "Confirm",
	function( triggerArgs )
		CodexMain(triggerArgs)
	end
}

function CodexMain(triggerArgs)
	if CodexUI.Screen == nil or not IsScreenOpen("Codex") or IsScreenOpen("BoonInfoScreen") then
		return
	end
	--Prevent early game crash
	if not GameState.Resources.MetaPoints then
		GameState.Resources.MetaPoints = 0
	end

	local selection = CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]

	if Contains(CodexMenu.BoonTable, selection) then
		DebugPrint({Text = "@CodexMenu Trying to open boon : "..selection})
		OpenBoonSelector(selection, true)

	elseif CodexMenu.BoonTable[selection] ~= nil then
		DebugPrint({Text = "@CodexMenu Trying to open boon : "..selection})
		OpenBoonSelector(CodexMenu.BoonTable[selection], false)

	elseif Contains(CodexMenu.ConsumableTable, selection) then
		DebugPrint({Text = "@CodexMenu Trying to spawn consumable : "..selection})
		local consumableId = SpawnObstacle({ Name = selection, DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing", OffsetX = 100 })
		local consumable = CreateConsumableItem( consumableId, selection, 0 )

	elseif Contains(CodexMenu.LootTable, selection) then
		DebugPrint({Text = "@CodexMenu Trying to spawn loot : "..selection})
		CreateLoot({ Name = selection, OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })

	elseif Contains(CodexMenu.FishTable, selection) then
		DebugPrint({Text = "@CodexMenu Trying to spawn fish : "..selection})
		local fishData = FishingData.FishValues[selection]

		RecordFish(selection)
		thread( PlayVoiceLines, fishData.FishIdentifiedVoiceLines )

		DisplayUnlockText({
			Icon = selection,
			TitleText = "Fishing_SuccessGoodTitle",
			SubtitleText = "Fishing_SuccessSubtitle",
			SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = selection }},
			IconOffsetY = 20,
			HighlightIcon = true,
			IconMoveSpeed = 0.1,
			IconScale = 0.64,
			AdditionalAnimation = "FishCatchPresentationSparkles",
			IconBacking = "FishCatchIconBacking",
			AnimationName = "LocationTextBGFish",
			AnimationOutName = "LocationTextBGFishOut",
		})

	elseif Contains(CodexMenu.WeaponTable, selection) then
		DebugPrint({Text = "@CodexMenu Trying to equip weapon : "..selection})
		CloseCodexScreen()
		local weapon = CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]
		EquipPlayerWeapon( WeaponData[weapon], { PreLoadBinks = true } )
		RemoveAllTraits()
		ReloadEquipment()
		ShowWeaponUpgradeScreen({ WeaponName = weapon })
	elseif Contains(CodexMenu.EnemyTable, selection) then
		DebugPrint({Text = "@CodexMenu Trying to spawn enemy : "..selection})
		local enemyData = EnemyData[selection]
		local newEnemy = DeepCopyTable( enemyData )
		newEnemy.AIOptions = enemyData.AIOptions
		newEnemy.BlocksLootInteraction = false
		local invaderSpawnPoint = 40000
		newEnemy.ObjectId = SpawnUnit({
				Name = enemyData.Name,
				Group = "Standing",
				DestinationId = invaderSpawnPoint, OffsetX = 400, OffsetY = 200 })
		SetupEnemyObject( newEnemy, CurrentRun )

	elseif CodexMenu.BossTable[selection] ~= nil then
		DebugPrint({Text = "@CodexMenu Trying to start boss fight : "..selection})
        RemoveAllTraits()
        ReloadEquipment()
		CloseCodexScreen()
		StartNewCustomRun(CodexMenu.BossTable[selection])
		LoadMap({ Name = CurrentRun.CurrentRoom.Name, ResetBinks = true, ResetWeaponBinks = true })

	elseif CodexMenu.CommandTable[selection] ~= nil then
		DebugPrint({Text = "@CodexMenu Trying to execute command : "..selection})
		CodexMenu.CommandTable[selection](triggerArgs)
	elseif Codex.Commands.Entries[selection] ~= nil then
		DebugPrint({Text = "@CodexMenu Trying to execute command : "..selection})
		CodexMenu.UseCommand(selection, triggerArgs)
	else
		DebugPrint({Text = "@CodexMenu Selection did not match any feature : "..selection})
	end
end

function StartNewCustomRun(bossRoom)
	CurrentDeathAreaRoom = nil
	PreviousDeathAreaRoom = nil
	SetupRunData()
	--ResetUI()
	SessionState.NeedWeaponPickupBinkLoad = false
	CurrentRun = {}
	CurrentRun.DamageRecord = {}
	CurrentRun.HealthRecord = {}
	CurrentRun.ConsumableRecord = {}
	CurrentRun.ActualHealthRecord = {}
	CurrentRun.BlockTimerFlags = {}
	CurrentRun.WeaponsFiredRecord = {}
	CurrentRun.Hero = CreateNewHero( prevRun, args )
	if GameState.CodexMenuSavedState == nil then
		EquipKeepsake( CurrentRun.Hero, GameState.LastAwardTrait, { SkipNewTraitHighlight = true })
		EquipAssist( CurrentRun.Hero, GameState.LastAssistTrait, { SkipNewTraitHighlight = true } )
		EquipWeaponUpgrade( CurrentRun.Hero, { SkipTraitHighlight = true } )
	end
	CurrentRun.RoomHistory = {}
	UpdateRunHistoryCache( CurrentRun )
	CheckRunStartFlags( CurrentRun )
	BuildMetaupgradeCache()
	CurrentRun.RoomCreations = {}
	CurrentRun.LootTypeHistory = {}
	CurrentRun.NPCInteractions = {}
	CurrentRun.AnimationState = {}
	CurrentRun.EventState = {}
	CurrentRun.ActivationRecord = {}
	CurrentRun.SpeechRecord = {}
	CurrentRun.TextLinesRecord = {}
	CurrentRun.TriggerRecord = {}
	CurrentRun.UseRecord = {}
	CurrentRun.GiftRecord = {}
	CurrentRun.HintRecord = {}
	CurrentRun.EnemyUpgrades = {}
	CurrentRun.BlockedEncounters = {}
	CurrentRun.InvulnerableFlags = {}
	CurrentRun.PhasingFlags = {}
	CurrentRun.Money = CalculateStartingMoney()
	CurrentRun.MoneySpent = 0
	CurrentRun.MoneyRecord = {}
	CurrentRun.BonusDarknessWeapon = GetRandomUnequippedWeapon()
	CurrentRun.ActiveObjectives = {}
	CurrentRun.RunDepthCache = 11
	CurrentRun.GameplayTime = 0
	CurrentRun.BiomeTime = 0
	CurrentRun.ActiveBiomeTimer = GetNumMetaUpgrades("BiomeSpeedShrineUpgrade") > 0
	CurrentRun.NumRerolls = GetNumMetaUpgrades( "RerollMetaUpgrade" ) + GetNumMetaUpgrades("RerollPanelMetaUpgrade")
	CurrentRun.ThanatosSpawns = 0
	CurrentRun.SupportAINames = {}
	CurrentRun.Hero.TargetMetaRewardsAdjustSpeed = 10.0
	CurrentRun.ClosedDoors = {}
	CurrentRun.CompletedStyxWings = 0
	CurrentRun.TargetShrinePointThreshold = GetCurrentRunClearedShrinePointThreshold( GetEquippedWeapon() )
	CurrentRun.BannedEliteAttributes = {}
	if ConfigOptionCache.EasyMode then
		CurrentRun.EasyModeLevel = GameState.EasyModeLevel
	end
	InitHeroLastStands( CurrentRun.Hero )

	InitializeRewardStores( CurrentRun )
	SelectBannedEliteAttributes( CurrentRun )

	if bossRoom ~= nil then
		CurrentRun.CurrentRoom = CreateRoom( bossRoom )
	else
		CurrentRun.CurrentRoom = ChooseStartingRoom( CurrentRun, "Tartarus" )
	end

	if GameState.CodexMenuSavedState ~= nil then
		RemoveAllTraits()
		if GameState.LastAwardTrait == "ReincarnationTrait" then
				RemoveLastStand( CurrentRun.Hero, "ReincarnationTrait" )
				CurrentRun.Hero.MaxLastStands = CurrentRun.Hero.MaxLastStands - 1
		end
		EquipPlayerWeapon( WeaponData[GameState.CodexMenuSavedState.Weapon], { PreLoadBinks = true } )
		EquipKeepsake(CurrentRun.Hero, GameState.CodexMenuSavedState.Keepsake)
		EquipAssist(CurrentRun.Hero, GameState.CodexMenuSavedState.Assist)
		if GameState.CodexMenuSavedState.Aspect.Name ~= nil then
			AddTraitToHero({ TraitName = GameState.CodexMenuSavedState.Aspect.Name, Rarity = GameState.CodexMenuSavedState.Aspect.Rarity })
		end
		for i, traitData in pairs( GameState.CodexMenuSavedState.Traits ) do
			AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity }) })
		end
	end
	return CurrentRun
end

function CodexMenuReloadAllTraits()
	--Remove all traits, then readd them in order
	local weaponName = GetEquippedWeapon()
	local removedTraitData = {}
	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
		if CodexMenu.ReloadShouldSkip[traitData.Name] ~= true and not string.match(traitData.Name, "Chaos") then
			table.insert(removedTraitData, { Name = traitData.Name, Rarity = traitData.Rarity })
		end
	end

	for i, traitData in pairs(removedTraitData) do
		RemoveTrait( CurrentRun.Hero, traitData.Name )
	end
	-- re-equip all weapons to flush Absolute change values

	UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = weaponName })
	local weaponSetNames = WeaponSets.HeroWeaponSets[weaponName]
	if weaponSetNames ~= nil then
		for k, linkedWeaponName in pairs( weaponSetNames ) do
			UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = linkedWeaponName })
		end
	end
	UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RangedWeapon "})


	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = weaponName })
	if weaponSetNames ~= nil then
		for k, linkedWeaponName in pairs( weaponSetNames ) do
			EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = linkedWeaponName })
		end
	end
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RangedWeapon" })


	for i, traitData in pairs(removedTraitData) do
		if traitData.Name then
			if traitData.Rarity then
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity}) })
			else
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name }) })
			end
		end
	end
	UpdateHeroTraitDictionary()
end

--New codex tab

local Commands = {
	Order = {
		"OpenBoonManager",
		"OpenDuoBoonSelector",
		"ClearAllBoons",
		"UseShout",
		"OpenCustomMirror",
		"KillPlayer",
		"OpenKeepsakeRack",
		"OpenCharonShop",
		"OpenPool",
		"SaveState",
		"LoadState",
	}
}

table.insert(CodexOrdering.Order, "Commands")
CodexOrdering.Commands = Commands

Commands = {
	UnlockType = CodexUnlockTypes.Mystery,
	TitleText = "Commands",
	Entries = {
		OpenBoonManager = {
			Entries = {
				{
					Text = "Opens the boon manager."
				}
			}
		},
		OpenDuoBoonSelector = {
			Entries = {
				{
					Text = "Opens the duo boon selector."
				}
			}
		},
		ClearAllBoons = {
			Entries = {
				{
					Text = "Removes all equipped boons."
				}
			}
		},
		UseShout = {
			Entries = {
				{
					Text = "Uses your shout with max wrath."
				}
			}
		},
		OpenCustomMirror = {
			Entries = {
				{
					Text = "Opens the custom mirror of night."
				}
			}
		},
		KillPlayer = {
			Entries = {
				{
					Text = "Kills you."
				}
			}
		},
		OpenKeepsakeRack = {
			Entries = {
				{
					Text = "Opens the keepsake rack."
				}
			}
		},
		OpenCharonShop = {
			Entries = {
				{
					Text = "Opens the Charon well."
				}
			}
		},
		OpenPool = {
			Entries = {
				{
					Text = "Opens the Pool of purging."
				}
			}
		},
		SaveState = {
			Entries = {
				{
					Text = "Save current state."
				}
			}
		},
		LoadState = {
			Entries = {
				{
					Text = "Load saved state."
				}
			}
		},
		ModList = {
			Entries = {
				{
					Text = ""
				}
			}
		},
		OpenResourceMenu = {
			Entries = {
				{
					Text = "Spawn resources."
				}
			}
		},
		ClearRunHistory = {
			Entries = {
				{
					Text = "Clears all history of previous runs."
				}
			}
		},
		OpenDialogManager = {
			Entries = {
				{
					Text = "Opens the dialog manager. Select a character, a textline set then force or unforce a dialog to play next time you interact with the character by pressing the button. White = unseen dialog, green = seen dialog, blue = dialog is in the forced queue."
				}
			}
		}
	}
}

ModUtil.LoadOnce(function ()
    local text = "List of all the mods you have installed. Only mods registered with Mod Utility can be shown. : "
    local tbl = { }
    local n = 0
    for name in pairs( ModUtil.Mods.Data ) do
        n = n + 1
        tbl[n] = name
    end
    local entry = {
        Text = text .. table.concat(tbl, ', ')
    }
    Commands.Entries.ModList.Entries[1] = entry
end)

Codex.Commands = Commands

function CodexMenu.UseCommand(commandName, triggerArgs)
	local command = "CodexMenu." .. commandName
	local commandFunction = _G[command]
	if commandFunction ~= nil then
		CloseCodexScreen()
		commandFunction(triggerArgs)
	end
end

function CodexMenu.OpenBoonManager()
	OpenBoonManager()
end

function CodexMenu.OpenDuoBoonSelector()
	OpenBoonSelector(CodexMenu.BoonTable.NPC_Dusa_01, false)
end

function CodexMenu.ClearAllBoons()
	RemoveAllTraits()
	ReloadEquipment()
end

function CodexMenu.UseShout()
	if IsSuperValid() then
		CloseCodexScreen()
		wait(1, RoomThreadName)
		BuildSuperMeter(CurrentRun, 100)
		CommenceSuperMove()
		UpdateSuperDamageBonus()
		thread( MarkObjectiveComplete, "EXMove" )
	end
end

function CodexMenu.OpenCustomMirror()
	OpenCustomMirror()
end

function CodexMenu.KillPlayer(triggerArgs)
	KillHero(CurrentRun.Hero, triggerArgs)
end

function CodexMenu.OpenKeepsakeRack()
	UIData.AwardMenu.AvailableKeepsakeTraits = GetAvailableKeepsakeTraits()
	UIData.AwardMenu.AvailableAssistTraits = GetAllAssistTraits()
	ShowAwardMenu()
end

function CodexMenu.OpenCharonShop()
	CurrentRun.CurrentRoom.Store = nil
	StartUpStore()
end

function CodexMenu.OpenPool()
	GenerateSellTraitShop(CurrentRun, CurrentRun.CurrentRoom)
	OpenSellTraitMenu()
end

function CodexMenu.SaveState()
	SaveState()
end

function CodexMenu.LoadState()
	LoadState()
end

ResourceMenu = { Components = {} }

function CodexMenu.OpenResourceMenu()
	if IsScreenOpen("ResourceMenu") then
		return
	end
	OnScreenOpened( { Flag = "ResourceMenu", SkipBlockTimer = true } )
	CloseCodexScreen()
	ScreenAnchors.ResourceMenu = DeepCopyTable(ResourceMenu)
	local screen = ScreenAnchors.ResourceMenu
	local components = screen.Components
	local title = "Resource Spawner"
	local subtitle = "Choose which resource and how much you want to spawn."
	screen.Name = "ResourceMenu"
	screen.Resource = "None"
	screen.Amount = 0
	OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
	SetConfigOption({ Name = "UseOcclusion", Value = false })
	FreezePlayerUnit()
	EnableShopGamepadCursor()
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
	--Background
	-- components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "ResourceMenu" })
	components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "ResourceMenu" })
	-- SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
	-- SetColor({ Id = components.BackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })
	components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "ResourceMenu", X = 775, Y = 350})
	components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "ResourceMenu", X = 415, Y = 419 })
	components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "ResourceMenu", X = 1435, Y = 374 })
	SetScaleY({Id = components.LeftPart.Id, Fraction = 1.4})
	SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.4})
	SetScaleX({Id = components.MiddlePart.Id, Fraction = 8})
	SetScaleY({Id = components.RightPart.Id, Fraction = 1.4})
	--Title
	CreateTextBox({ Id = components.Background.Id, Text = title, FontSize = 34,
	OffsetX = -50, OffsetY = -390, Color = Color.White, Font = "SpectralSCLight",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
	--SubTitle
	CreateTextBox({ Id = components.Background.Id, Text = subtitle, FontSize = 19,
	OffsetX = -50, OffsetY = -345, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
	--Close button
	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "ResourceMenu" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = -50, OffsetY = ScreenCenterY - 120 })
	components.CloseButton.OnPressedFunctionName = "CodexMenu.CloseResourceMenu"
	components.CloseButton.ControlHotkey = "Cancel"
	--Display
		--Resource buttons
		components.DarknessButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.DarknessButton.OnPressedFunctionName = "CodexMenu.ChangeTargetResource"
		components.DarknessButton.Resource = "MetaPoints"
		components.DarknessButton.ResourceDisplay = "Darkness"
		Attach({ Id = components.DarknessButton.Id, DestinationId = components.Background.Id, OffsetX = -450, OffsetY = -250 })
		CreateTextBox({ Id = components.DarknessButton.Id, Text = "Darkness",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.KeyButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.KeyButton.OnPressedFunctionName = "CodexMenu.ChangeTargetResource"
		components.KeyButton.Resource = "LockKeys"
		components.KeyButton.ResourceDisplay = "Chthonic Key"
		Attach({ Id = components.KeyButton.Id, DestinationId = components.Background.Id, OffsetX = -180, OffsetY = -250 })
		CreateTextBox({ Id = components.KeyButton.Id, Text = "Chthonic Key",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.BloodButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.BloodButton.OnPressedFunctionName = "CodexMenu.ChangeTargetResource"
		components.BloodButton.Resource = "SuperLockKeys"
		components.BloodButton.ResourceDisplay = "Titan Blood"
		Attach({ Id = components.BloodButton.Id, DestinationId = components.Background.Id, OffsetX = 90, OffsetY = -250 })
		CreateTextBox({ Id = components.BloodButton.Id, Text = "Titan Blood",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.GemButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.GemButton.OnPressedFunctionName = "CodexMenu.ChangeTargetResource"
		components.GemButton.Resource = "Gems"
		components.GemButton.ResourceDisplay = "Gems"
		Attach({ Id = components.GemButton.Id, DestinationId = components.Background.Id, OffsetX = 360, OffsetY = -250 })
		CreateTextBox({ Id = components.GemButton.Id, Text = "Gems",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.DiamondButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.DiamondButton.OnPressedFunctionName = "CodexMenu.ChangeTargetResource"
		components.DiamondButton.Resource = "SuperGems"
		components.DiamondButton.ResourceDisplay = "Diamond"
		Attach({ Id = components.DiamondButton.Id, DestinationId = components.Background.Id, OffsetX = -450, OffsetY = -180 })
		CreateTextBox({ Id = components.DiamondButton.Id, Text = "Diamond",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.NectarButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.NectarButton.OnPressedFunctionName = "CodexMenu.ChangeTargetResource"
		components.NectarButton.Resource = "GiftPoints"
		components.NectarButton.ResourceDisplay = "Nectar"
		Attach({ Id = components.NectarButton.Id, DestinationId = components.Background.Id, OffsetX = -180, OffsetY = -180 })
		CreateTextBox({ Id = components.NectarButton.Id, Text = "Nectar",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.AmbrosiaButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.AmbrosiaButton.OnPressedFunctionName = "CodexMenu.ChangeTargetResource"
		components.AmbrosiaButton.Resource = "SuperGiftPoints"
		components.AmbrosiaButton.ResourceDisplay = "Ambrosia"
		Attach({ Id = components.AmbrosiaButton.Id, DestinationId = components.Background.Id, OffsetX = 90, OffsetY = -180 })
		CreateTextBox({ Id = components.AmbrosiaButton.Id, Text = "Ambrosia",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})

		--Amount buttons

		components.IncreaseButton1 = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.IncreaseButton1.OnPressedFunctionName = "CodexMenu.ChangeTargetResourceAmount"
		components.IncreaseButton1.Amount = 1
		Attach({ Id = components.IncreaseButton1.Id, DestinationId = components.Background.Id, OffsetX = -450, OffsetY = -40 })
		CreateTextBox({ Id = components.IncreaseButton1.Id, Text = "+1",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.IncreaseButton2 = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.IncreaseButton2.OnPressedFunctionName = "CodexMenu.ChangeTargetResourceAmount"
		components.IncreaseButton2.Amount = 10
		Attach({ Id = components.IncreaseButton2.Id, DestinationId = components.Background.Id, OffsetX = -180, OffsetY = -40 })
		CreateTextBox({ Id = components.IncreaseButton2.Id, Text = "+10",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.IncreaseButton3 = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.IncreaseButton3.OnPressedFunctionName = "CodexMenu.ChangeTargetResourceAmount"
		components.IncreaseButton3.Amount = 100
		Attach({ Id = components.IncreaseButton3.Id, DestinationId = components.Background.Id, OffsetX = 90, OffsetY = -40 })
		CreateTextBox({ Id = components.IncreaseButton3.Id, Text = "+100",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.IncreaseButton4 = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.IncreaseButton4.OnPressedFunctionName = "CodexMenu.ChangeTargetResourceAmount"
		components.IncreaseButton4.Amount = 1000
		Attach({ Id = components.IncreaseButton4.Id, DestinationId = components.Background.Id, OffsetX = 360, OffsetY = -40 })
		CreateTextBox({ Id = components.IncreaseButton4.Id, Text = "+1000",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})

		components.DecreaseButton1 = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.DecreaseButton1.OnPressedFunctionName = "CodexMenu.ChangeTargetResourceAmount"
		components.DecreaseButton1.Amount = -1
		Attach({ Id = components.DecreaseButton1.Id, DestinationId = components.Background.Id, OffsetX = -450, OffsetY = 30 })
		CreateTextBox({ Id = components.DecreaseButton1.Id, Text = "-1",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.DecreaseButton2 = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.DecreaseButton2.OnPressedFunctionName = "CodexMenu.ChangeTargetResourceAmount"
		components.DecreaseButton2.Amount = -10
		Attach({ Id = components.DecreaseButton2.Id, DestinationId = components.Background.Id, OffsetX = -180, OffsetY = 30 })
		CreateTextBox({ Id = components.DecreaseButton2.Id, Text = "-10",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.DecreaseButton3 = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.DecreaseButton3.OnPressedFunctionName = "CodexMenu.ChangeTargetResourceAmount"
		components.DecreaseButton3.Amount = -100
		Attach({ Id = components.DecreaseButton3.Id, DestinationId = components.Background.Id, OffsetX = 90, OffsetY = 30 })
		CreateTextBox({ Id = components.DecreaseButton3.Id, Text = "-100",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})
		components.DecreaseButton4 = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
		components.DecreaseButton4.OnPressedFunctionName = "CodexMenu.ChangeTargetResourceAmount"
		components.DecreaseButton4.Amount = -1000
		Attach({ Id = components.DecreaseButton4.Id, DestinationId = components.Background.Id, OffsetX = 360, OffsetY = 30 })
		CreateTextBox({ Id = components.DecreaseButton4.Id, Text = "-1000",
			FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
		})

	components.ResourceTextbox = CreateScreenComponent({ Name = "BlankObstacle", Group = "ResourceMenu" })
	Attach({ Id = components.ResourceTextbox.Id, DestinationId = components.Background.Id, OffsetX = -150, OffsetY = 250 })
	CreateTextBox({ Id = components.ResourceTextbox.Id, Text = screen.Resource,
		FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
	})
	components.ResourceAmountTextbox = CreateScreenComponent({ Name = "BlankObstacle", Group = "ResourceMenu" })
	Attach({ Id = components.ResourceAmountTextbox.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = 250 })
	CreateTextBox({ Id = components.ResourceAmountTextbox.Id, Text = screen.Amount,
		FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
	})
	components.SpawnButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ResourceMenu", Scale = 0.3, })
	components.SpawnButton.OnPressedFunctionName = "CodexMenu.SpawnResource"
	Attach({ Id = components.SpawnButton.Id, DestinationId = components.Background.Id, OffsetX = -50, OffsetY = 300 })
	CreateTextBox({ Id = components.SpawnButton.Id, Text = "Spawn resource",
		FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
	})


	--End
	screen.KeepOpen = true
	HandleScreenInput(screen)
end

function CodexMenu.CloseResourceMenu(screen, button)
	DisableShopGamepadCursor()
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
	SetConfigOption({ Name = "UseOcclusion", Value = true })
	CloseScreen(GetAllIds(screen.Components), 0.1)
	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	ScreenAnchors.ResourceMenu = nil
	UnfreezePlayerUnit()
	screen.KeepOpen = false
	OnScreenClosed({ Flag = screen.Name })
end

function CodexMenu.ChangeTargetResource(screen, button)
	screen.Resource = button.Resource
	ModifyTextBox({Id = screen.Components.ResourceTextbox.Id, Text = button.ResourceDisplay} )
end

function CodexMenu.ChangeTargetResourceAmount(screen, button)
	local amount = screen.Amount + button.Amount
	if amount < 0 then
		amount = 0
	end
	screen.Amount = amount
	ModifyTextBox({Id = screen.Components.ResourceAmountTextbox.Id, Text = screen.Amount} )
end

function CodexMenu.SpawnResource(screen, button)
	if screen.Resource == "None" or screen.Amount == 0 then
		return
	end

	AddResource(screen.Resource, screen.Amount)
end

function CodexMenu.ClearRunHistory(screen, button)
	GameState.RunHistory = {}
end

function CodexMenu.OpenDialogManager(screen, button)
	CodexMenu.OpenDialogManagerScreen()
end