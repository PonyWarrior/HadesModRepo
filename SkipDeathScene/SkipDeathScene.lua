
function HandleDeath( currentRun, killer, killingUnitWeapon )

	if GetConfigOptionValue({ Name = "EditingMode" }) then
		SetAnimation({ Name = "ZagreusDeadStartBlood", DestinationId = currentRun.Hero.ObjectId })
		return
	end

	SendSaveFileEmail({ })

	AddTimerBlock( currentRun, "HandleDeath" )
	if ScreenAnchors.TraitTrayScreen ~= nil then
		CloseAdvancedTooltipScreen()
	end
	ClearHealthShroud()
	CurrentRun.Hero.HandlingDeath = true
	CurrentRun.Hero.IsDead = true
	CurrentRun.ActiveBiomeTimer = false
	if ConfigOptionCache.EasyMode and not currentRun.Cleared then
		GameState.EasyModeLevel = GameState.EasyModeLevel + 1
	end
	if not CurrentRun.Cleared then -- Already recorded if cleared
		RecordRunStats()
	end

	InvalidateCheckpoint()

	ZeroSuperMeter()
	FinishTargetMarker( killer )

	AddInputBlock({ Name = "MapLoad" })

	currentRun.CurrentRoom.EndingHealth = currentRun.Hero.Health
	currentRun.EndingMoney = currentRun.Money
	table.insert( currentRun.RoomHistory, currentRun.CurrentRoom )
	UpdateRunHistoryCache( currentRun, currentRun.CurrentRoom )

	currentRun.Money = 0
	currentRun.NumRerolls = GetNumMetaUpgrades( "RerollMetaUpgrade" ) + GetNumMetaUpgrades("RerollPanelMetaUpgrade")

	ResetObjectives()
	ActiveScreens = {}

	CurrentRun.Hero.HandlingDeath = false
	CurrentRun.Hero.Health = CurrentRun.Hero.MaxHealth

	local currentRoom = currentRun.CurrentRoom
	local deathMap = "DeathArea"
	GameState.LocationName = "Location_Home"
	RandomSetNextInitSeed()
	SaveCheckpoint({ StartNextMap = deathMap, DevSaveName = CreateDevSaveName( currentRun, { StartNextMap = deathMap } ) })
	ClearUpgrades()

	SetConfigOption({ Name = "FlipMapThings", Value = false })

	local runNumber = (GetCompletedRuns()+1)
	local runDepth = GetRunDepth( currentRun )

	LoadMap({ Name = deathMap, ResetBinks = true, ResetWeaponBinks = true })
end
