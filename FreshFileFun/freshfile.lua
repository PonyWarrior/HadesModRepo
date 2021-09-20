local shrineUpgrades = {}

local lookUpTable =
{
    HardLabor = "EnemyDamageShrineUpgrade",
    LastingConsequences = "HealingReductionShrineUpgrade",
    ConvenienceFee = "ShopPricesShrineUpgrade",
    JurySummons = "EnemyCountShrineUpgrade",
    ExtremeMeasures = "BossDifficultyShrineUpgrade",
    CalisthenicsProgram = "EnemyHealthShrineUpgrade",
    BenefitsPackage = "EnemyEliteShrineUpgrade",
    MiddleManagement = "MinibossCountShrineUpgrade",
    UnderworldCustoms = "ForceSellShrineUpgrade",
    ForcedOvertime = "EnemySpeedShrineUpgrade",
    HeightenedSecurity = "TrapDamageShrineUpgrade",
    RoutineInspection = "MetaUpgradeStrikeThroughShrineUpgrade",
    DamageControl = "EnemyShieldShrineUpgrade",
    ApprovalProcess = "ReducedLootChoicesShrineUpgrade",
    TightDeadline = "BiomeSpeedShrineUpgrade",
    PersonalLiability = "NoInvulnerabilityShrineUpgrade"
}

function FreshFileFun.LoadShrineUpgrades()
    for upgrade, upgradeData in pairs(FreshFileFun.Config.Pact) do
        if upgradeData.Enabled then
            shrineUpgrades[lookUpTable[upgrade]] = upgradeData.Level
        end
    end

    GameState.MetaUpgrades = shrineUpgrades
end

ModUtil.BaseOverride("StartNewGame", function ()
    DebugAssert({ Condition = GameState == nil, "Overwriting existing game state!" })

	GameState = {}
	GameState.WeaponHistory = {}
	GameState.WeaponsTouched = {}
	GameState.WeaponsUnlocked = {}
	GameState.RunHistory = {}
	GameState.MetaUpgrades = {}
	GameState.WeaponKills = {}
	GameState.LootPickups = {}
	GameState.TraitsTaken = {}
	GameState.QuestsViewed = {}
	GameState.QuestStatus = {}

	GameState.Cosmetics = {}
	GameState.CosmeticsViewed = {}
	GameState.CosmeticsAdded = {}
	GameState.MusicTracksViewed = {}
	-- Default starting cosmetics
	AddCosmetic( "Cosmetic_DrapesRed" )
	AddCosmetic( "Cosmetic_LaurelsRed" )
	AddCosmetic( "Cosmetic_WallWeaponBident" )
	AddCosmetic( "Cosmetic_SouthHallTrimBrown" )
	AddCosmetic( "Cosmetic_HouseCandles01" )
	AddCosmetic( "/Music/MusicPlayer/MainThemeMusicPlayer" )
	AddCosmetic( "/Music/MusicPlayer/MusicExploration4MusicPlayer" )

	GameState.ScreensViewed = {}

	GameState.NPCInteractions = {}
	GameState.ItemInteractions = {}
	GameState.EnemySpawns = {}
	GameState.EnemyKills = {}
	GameState.EnemyEliteAttributeKills = {}
	GameState.EnemyDamage = {}
	GameState.CompletedObjectiveSets = {}
	GameState.ObjectivesCompleted = {}
	GameState.ObjectivesFailed = {}
	GameState.LastObjectiveCompletedRun = {}
	GameState.LastObjectiveFailedRun = {}
	GameState.HintsShown = {}
	GameState.Resources = {}
	GameState.LifetimeResourcesGained = {}
	GameState.LifetimeResourcesSpent = {}
	GameState.ShrinePointClearsComplete = {}
	GameState.HeardGhostLines = {}
	GameState.KeepsakeChambers = {}
	GameState.ActiveMutators = {}
	GameState.Onslaughts = {}
	GameState.EncountersOccurredCache = {}
	GameState.EncountersCompletedCache = {}
	GameState.RoomCountCache = {}
	GameState.WeaponUnlocks = {}
	GameState.AssistUnlocks = {}
	GameState.LastWeaponUpgradeData = {}
	GameState.RecordClearedShrineThreshold = {}
	GameState.RecordLastClearedShrineReward = {}
	GameState.ClearedWithMetaUpgrades = {}
	GameState.SpeechRecordContexts = {}
	GameState.MetaUpgradesUnlocked = {}
	GameState.MetaUpgradeStagesUnlocked = 0
	GameState.MetaUpgradesSelected = {}
	GameState.MetaUpgradeState = {}

	for metaUpgradeName, metaUpgradeData in pairs( MetaUpgradeData ) do
		if metaUpgradeData.Starting then
			GameState.MetaUpgradesUnlocked[metaUpgradeName] = true
		end
	end
	for k, metaUpgradeChoices  in pairs( MetaUpgradeOrder ) do
		GameState.MetaUpgradesSelected[k] = metaUpgradeChoices[1]
	end

	InitializeGiftData()
	GameState.ReturnedRandomEligibleSourceNames = {}
	GameState.PlayedRandomRunIntroData = {}
	GameState.PlayedRandomRunOutroData = {}
	GameState.Flags = {}
	if GetConfigOptionValue({ Name = "KioskMode" }) then
		GameState.Flags.KioskMode = true
	else
		GameState.Flags.DefaultMode = true
	end
	if GetConfigOptionValue({ Name = "HardMode" }) then
		GameState.Flags.HardMode = true
		for name, amount in pairs( HeroData.DefaultHero.HardModeForcedMetaUpgrades ) do
			GameState.MetaUpgrades[name] = amount
		end
		for name, amount in pairs( HeroData.DefaultHero.HardModeStartingResources ) do
			GameState.Resources[name] = (GameState.Resources[name] or 0) + round( amount )
			--AddResource( name, amount, "HardMode", { Silent = true } )
		end
	end
	GameState.EasyModeLevel = 0
    --mod start
    FreshFileFun.LoadShrineUpgrades()
    --mod end
	if CurrentRun == nil then
		StartNewRun()
	end
end)