
function KillHero( victim, triggerArgs )
	local killer = triggerArgs.AttackerTable
	local currentRun = CurrentRun
	local killingUnitWeapon = triggerArgs.SourceWeapon
	local killingUnitId = triggerArgs.AttackerId
	local killingUnitName = triggerArgs.AttackerName
	local enemyData = EnemyData[killingUnitName]

	thread( CheckOnDeathPowers, victim, killer, killingUnitWeapon )

	killTaggedThreads( RoomThreadName )
	if currentRun.CurrentRoom.Encounter ~= nil then
		killTaggedThreads( currentRun.CurrentRoom.Encounter.SpawnThreadName )
	end
	killWaitUntilThreads( "RequiredKillEnemyKilledOrSpawned" )
	killWaitUntilThreads( "AllRequiredKillEnemiesDead" )
	killWaitUntilThreads( "RequiredEnemyKilled" )
	killWaitUntilThreads( UIData.BoonMenuId )

	EndAmbience( 0.5 )
	EndMusic( MusicId, MusicName, 0.0 )

	if killer == nil then
		killer = {}
		killer.Name = killingUnitName
		killer.ObjectId = killingUnitId
	end
	if currentRun.DeathFunctionName ~= nil then
		local deathFunction = _G[currentRun.DeathFunctionName]
		deathFunction( currentRun, killer, killingUnitWeapon )
	else
		HandleDeath( currentRun, killer, killingUnitWeapon )
	end
end

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

	InvalidateCheckpoint()

	ZeroSuperMeter()
	FinishTargetMarker( killer )
	--DeathPresentation( currentRun, killer, killingUnitWeapon )

	currentRun.CurrentRoom.EndingHealth = currentRun.Hero.Health
	currentRun.EndingMoney = currentRun.Money
	table.insert( currentRun.RoomHistory, currentRun.CurrentRoom )
	UpdateRunHistoryCache( currentRun, currentRun.CurrentRoom )

	currentRun.Money = 0
	currentRun.NumRerolls = GetNumMetaUpgrades( "RerollMetaUpgrade" )

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

	LoadMap({ Name = deathMap, ResetBinks = true })
end

OnAnyLoad{ "DeathArea",
	function( triggerArgs )

		if GameState == nil then
			StartNewGame()
			CurrentRun.Hero.IsDead = true
		end

		DeathAreaStartTime = _worldTime
		if CurrentDeathAreaRoom ~= nil and CurrentDeathAreaRoom.Name == "DeathAreaBedroom" then
			DeathAreaRoomTransition( nil, { Name = "DeathArea" } )
		else
			StartDeathLoop( CurrentRun )
		end

	end
}

OnAnyLoad{ "DeathAreaBedroom DeathAreaBedroomHades DeathAreaOffice RoomPreRun",
	function( triggerArgs )

		if GameState == nil then
			StartNewGame()
			CurrentRun.Hero.IsDead = true
		end

		DeathAreaStartTime = _worldTime
		DeathAreaRoomTransition( nil, { Name = triggerArgs.name } )

	end
}

function StartDeathLoop( currentRun )

	DisableCombatControls()

	currentRun.BlockDeathAreaTransitions = true
	DeathAreaRoomTransition( nil, { Name = "DeathArea", SkipShowUI = true, } )
	StartDeathLoopPresentation( currentRun )

	local notifyName = "ReattachCameraOnInput"
	NotifyOnPlayerInput({ Notify = notifyName })
	waitUntil( notifyName )
	PanCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0, FromCurrentLocation = true, })

	EnableCombatControls()
	ShowCombatUI()
end

function SetupDeathArea( currentRun )

	StartRoomPreLoadBinks( currentRun, nil )
	RunEvents( CurrentDeathAreaRoom )
	AssignObstacles( CurrentDeathAreaRoom )
	CheckInspectPoints( currentRun, CurrentDeathAreaRoom )
	StartTriggers( CurrentDeathAreaRoom, CurrentDeathAreaRoom.DistanceTriggers )

	if CurrentDeathAreaRoom.RemoveDashFireFx then
		SetWeaponProperty({ WeaponName = "RushWeapon", DestinationId = CurrentRun.Hero.ObjectId, Property = "UnblockedBlinkFx", Value = "null", ValueChangeType = "Absolute" })
	end

end

function DeathAreaSwitchRoom( source, args )

	NextHeroStartPoint = args.HeroStartPoint
	NextHeroEndPoint = args.HeroEndPoint
	LeaveDeathAreaRoomPresentation( CurrentRun, source )
	killTaggedThreads( RoomThreadName )

	if not GameState.Flags.InFlashback then
		SaveCheckpoint({ StartNextMap = args.Name, DevSaveName = CreateDevSaveName( CurrentRun, { StartNextMap = args.Name } ) })
	end
	SetSoundSource({ Id = AmbientMusicId }) -- Remove until new source is created in the next room

	LoadMap({ Name = args.Name, ResetBinks = false })
end

function DeathAreaRoomTransition( source, args )

	AddInputBlock({ Name = "DeathAreaTransition" })
	CurrentDeathAreaRoom = DeathLoopData[args.Name]

	if GameState ~= nil then
		GameState.SpentShrinePointsCache = GetTotalSpentShrinePoints()
		SetMenuOptions({ Name = "InGameUI", Properties = { Run = "UpdateActiveShrinePoints" } })
	end

	local currentRun = CurrentRun
	SetupHeroObject( currentRun )

	FadeOut({ Color = Color.Black, Duration = 0 })
	if CurrentDeathAreaRoom.CameraZoomWeights ~= nil then
		for id, weight in pairs( CurrentDeathAreaRoom.CameraZoomWeights ) do
			SetCameraZoomWeight({ Id = id, Weight = weight, ZoomSpeed = 1.0 })
		end
	end
	AdjustZoom({ Fraction = CurrentDeathAreaRoom.ZoomFraction or 1.0 })
	LockCamera({ Ids = { currentRun.Hero.ObjectId } })
	SwitchActiveUnit({ Id = currentRun.Hero.ObjectId })

	SetSoundCueValue({ Id = AmbientMusicId, Names = { "LowPass" }, Value = CurrentDeathAreaRoom.AmbientMusicLowPass, Duration = 0.5 })
	SetVolume({ Id = AmbientMusicId, Value = CurrentDeathAreaRoom.AmbientMusicVolume, Duration = 0.5 })

	ResetObjectives()
	RunUnthreadedEvents( CurrentDeathAreaRoom.StartUnthreadedEvents, CurrentDeathAreaRoom )

	local musicTargetIds = GetIdsByType({ Name = "NPC_Orpheus_01" })
	if IsEmpty( musicTargetIds ) then
		musicTargetIds = GetIdsByType({ Name = "HeroStart" })
	end
	SetSoundSource({ Id = AmbientMusicId, DestinationIds = musicTargetIds })
	if AmbientMusicSource ~= nil and not IsEmpty( musicTargetIds ) then
		AmbientMusicSource.ObjectId = musicTargetIds[1]
	end

	SetupDeathArea( currentRun )

	if currentRun.BlockDeathAreaTransitions then
		currentRun.BlockDeathAreaTransitions = false
	else
		StartRoomPresentation( currentRun, CurrentDeathAreaRoom )
		thread( PlayVoiceLines, CurrentDeathAreaRoom.EnteredVoiceLines )
		FadeIn({ Duration = 0.5 })
	end

	RemoveInputBlock({ Name = "DeathAreaTransition" })

	if CurrentDeathAreaRoom.CheckObjectives ~= nil then
		for k, objectiveName in pairs( CurrentDeathAreaRoom.CheckObjectives ) do
			CheckObjectiveSet( objectiveName )
		end
	end

	if not args.SkipShowUI then
		ShowCombatUI()
	end

	CheckAutoObjectiveSets(currentRun, "RoomStart")
end

function UnlockDeathAreaInteractbles()

	local shopIds = { 50056 }
	local fateIds = { 50057 }

	if GetCompletedRuns() >= 2 then
		Activate({ Ids = shopIds })
	end

	if GetCompletedRuns() >= 4 then
		Activate({ Ids = fateIds })
	end

end

function UseEscapeDoor( usee, args )

	if GetNumRunsCleared() > 0 or GameState.Flags.HardMode then
		UseShrineObject( usee, args )
	else
		ClearShrineLoadout()
		StartOver()
	end
end

function StartOver()

	AddInputBlock({ Name = "StartOver" })

	local currentRun = CurrentRun
	EndRun( currentRun )
	CurrentDeathAreaRoom = nil
	currentRun = StartNewRun( currentRun )
	StopSound({ Id = AmbientMusicId, Duration = 1.0 })
	AmbientMusicId = nil
	AmbientTrackName = nil
	ResetObjectives()
	killTaggedThreads( RoomThreadName )

	SetConfigOption({ Name = "FlipMapThings", Value = false })

	AddTimerBlock( currentRun, "StartOver" )
	StartNewRunPresentation( currentRun )
	RemoveInputBlock({ Name = "StartOver" })
	RemoveTimerBlock( currentRun, "StartOver" )
	killTaggedThreads( RoomThreadName )

	LoadMap({ Name = currentRun.CurrentRoom.Name, ResetBinks = true })

end

function FlashbackLeftBedroom( source )
	AdvanceFlashback()
	source.IgnoreClamps = true
	SetCameraClamp({ Ids = { 391571, 391553, } })
	CreateCameraWalls({ })
end

function CheckGiftObjective()
	wait(1.5)
	if HasResource( "GiftPoints", 0 ) then
		CheckObjectiveSet("GiftPrompt")
	end
end

function SpawnSkelly( waitTime )

	GameState.Flags.SkellyUnlocked = true
	wait(waitTime or 3.0)
	ActivatePrePlaced( nil, { LegalTypes = { "TrainingMelee" } } )
	wait(4.2)
	CheckConversations()

end
