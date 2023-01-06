if SkipDeathScene.Data.Config.Enabled then
	ModUtil.BaseOverride("HandleDeath", function (currentRun, killer, killingUnitWeapon)
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
		--mod start
		local deathPresentationName = currentRun.DeathPresentationFunctionName or "DeathPresentation"
		if deathPresentationName == "DeathPresentation" then
			deathPresentationName = "SkipDeathScene.DeathPresentationSkip"
		end
		--mod end
		local deathPresentationFunction = _G[deathPresentationName]
		deathPresentationFunction( currentRun, killer, killingUnitWeapon )
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
	end, SkipDeathScene)

	function SkipDeathScene.DeathPresentationSkip(currentRun, killer, killingUnitWeapon)
		AddInputBlock({ Name = "DeathPresentation" })
		ClearCameraClamp({ LerpTime = 0.4 })
		PanCamera({ Id = currentRun.Hero.ObjectId, Duration = 0.4 })
		FocusCamera({ Fraction = 1.1, Duration = 0.4 })
		ZeroMouseTether("DeathPresentation")
		DisableCombatControls()
		DestroyCombatUI( "Death" )
		ClearStoredAmmoHero()
		SetConfigOption({ Name = "UseOcclusion", Value = false })

		if IsScreenOpen("Codex") then
			CloseCodexScreen()
		end

		-- had to move this above CleanUpEnemies() for the RequiredKillEnemies check to work
		local deathPresentation = 0
		if CurrentRun.CurrentRoom.Encounter ~= nil then
			if CurrentRun.CurrentRoom.Encounter.HadesDeathTaunt then
				-- Hades Death Taunt
				deathPresentation = 1
			elseif CurrentRun.CurrentRoom.Encounter.SpurnedGodName ~= nil and not IsEmpty( RequiredKillEnemies ) then
				-- Olympian Death Taunt
				deathPresentation = 2
			elseif CurrentRun.CurrentRoom.Encounter.ThanatosId ~= nil and not not IsEmpty( RequiredKillEnemies ) then
				-- Thanatos Death Taunt
				deathPresentation = 3
			elseif CurrentRun.CurrentRoom.Encounter.TookChaosCurseDamage ~= nil and not IsEmpty( RequiredKillEnemies ) then
				-- Chaos Death Taunt
				deathPresentation = 4
			end
		end

		CleanupEnemies()
		ExpireProjectiles({ })
		ClearEffect({ Id = killer.ObjectId, All = true, BlockAll = true })
		SetThingProperty({ Property = "AllowAnyFire", Value = false, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
		StopAmbientSound({ All = true })
		StopSound({ Id = SecretMusicId, Duration = 0.25 })
		SecretMusicId = nil
		SecretMusicName = nil

		Stop({ Id = currentRun.Hero.ObjectId })
		Halt({ Id = currentRun.Hero.ObjectId })
		SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 0.0, DataValue = false, DestinationNames = { "GroundEnemies", "FlyingEnemies" } })

		RemoveFromGroup({ Id = killer.ObjectId, Names = { "Standing", "GroundEnemies", "FlyingEnemies" } })
		AddToGroup({ Id = killer.ObjectId, Name = "Combat_Menu", DrawGroup = true })

		if currentRun.Hero.AttachedAnimationName ~= nil then
			StopAnimation({ Name = currentRun.Hero.AttachedAnimationName, DestinationId = currentRun.Hero.ObjectId })
		end

		if currentRun.Hero.HitShields ~= nil and currentRun.Hero.HitShields > 0 then
			CurrentRun.Hero.HitShields = 0
			for i, traitData in pairs(currentRun.Hero.Traits) do
				if traitData.BossEncounterShieldHits then
					UpdateTraitNumber( traitData )
				end
			end
		end

		currentRun.Hero.Mute = false
		SetPlayerInvulnerable( "PlayerDeath" )
		PlaySound({ Name = "/SFX/Player Sounds/PlayerDeath" })

		thread( PlayVoiceLines, GlobalVoiceLines.DeathVoiceLines )

		if killer.CauseOfDeathVoiceLines ~= nil then
			thread( PlayVoiceLines, killer.CauseOfDeathVoiceLines, nil, killer )
		elseif currentRun.CurrentRoom.Encounter.CauseOfDeathVoiceLines ~= nil then
			thread( PlayVoiceLines, currentRun.CurrentRoom.Encounter.CauseOfDeathVoiceLines )
		elseif currentRun.CurrentRoom.CauseOfDeathVoiceLines ~= nil then
			thread( PlayVoiceLines, currentRun.CurrentRoom.CauseOfDeathVoiceLines )
		end

		-- black out world
		StopAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessVignetteHold" })
		StopAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessGroundFog" })
		AdjustFrame({ Color = Color.TransparentRed, Duration = 0.0, Fraction = 0 })
		ScreenAnchors.DeathBackground = CreateScreenObstacle({ Name = "rectangle01", Group = "Combat_UI", X = ScreenCenterX, Y = ScreenCenterY })
		SetScale({ Id = ScreenAnchors.DeathBackground, Fraction = 10 })
		SetColor({ Id = ScreenAnchors.DeathBackground, Color = Color.Black })
		SetAlpha({ Id = ScreenAnchors.DeathBackground, Fraction = 1.0, Duration = 0 })

		RemoveFromGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing" })
		thread( DoRumble, currentRun.Hero.HeroFinalHitRumbleParameters )

		-- wait( 0.15 )
		SetAlpha({ Id = killer.ObjectId, Fraction = 0, Duration = 0.3 })

		if CurrentRun.Cleared then
			thread( DisplayLocationText, nil, { Text = "OutroDeathMessageAlt", Delay = 0.95, Color = Color.Red, Layer = "Overlay", AnimationName = "LocationTextBGDeath", AnimationOutName = "LocationTextBGDeathOut", ThreadName = "Outro", Duration = 4.25 } )
		else
			thread( DisplayLocationText, nil, { Text = "DeathMessage", Delay = 0.95, Color = Color.Red, Layer = "Overlay", AnimationName = "LocationTextBGDeath", AnimationOutName = "LocationTextBGDeathOut" } )
		end

		local criticalSlowHoldTime = 0
		FocusCamera({ Fraction = 1.0, Duration = 0.3, ZoomType = "Ease" })
		SetThingProperty({ Property = "Grip", Value = 99999, DestinationId = CurrentRun.Hero.ObjectId })
		SetThingProperty({ Property = "Graphic", Value = "ZagreusOnHitFinal", DestinationId = CurrentRun.Hero.ObjectId })
		Flash({ Id = CurrentRun.Hero.ObjectId, Speed = 1.65, MinFraction = 1.0, MaxFraction = 0.0, Color = Color.Red, Duration = 0.15, ExpireAfterCycle = true })
		thread( DeathFrameHold )

		-- for k, simData in ipairs( CurrentRun.Hero.FinalHitSlowParameters ) do
		-- 	if( damageVulnerability or damageCrit ) then
		-- 		if( k == 2) then
		-- 			criticalSlowHoldTime = 0.04
		-- 		end
		-- 	end
		-- 	waitScreenTime( simData.ScreenPreWait + criticalSlowHoldTime )
		-- 	if simData.Fraction < 1.0 then
		-- 		AddSimSpeedChange( "Death", { Fraction = simData.Fraction, LerpTime = simData.LerpTime } )
		-- 	else
		-- 		RemoveSimSpeedChange( "Death", { LerpTime = simData.LerpTime } )
		-- 	end
		-- end
		-- wait(0.15)
		SetThingProperty({ Property = "Grip", Value = "Default", DestinationId = CurrentRun.Hero.ObjectId })
		StopFlashing({ Id = CurrentRun.Hero.ObjectId })
		local zagreusDeathFlash = CreateScreenComponent({ Name = "rectangle01", Group = "Overlay" })
		SetAnimation({ DestinationId = zagreusDeathFlash.Id, Name = "ZagreusDeathFlash" })

		local deathAnimation = "ZagreusDeathFullscreen"
		if CurrentRun.Cleared then
			deathAnimation = "ZagreusDeathPostEndingFullscreen"
		end
		-- SetThingProperty({ Property = "Graphic", Value = deathAnimation, DestinationId = currentRun.Hero.ObjectId })

		-- wait( 0.3 )
		Teleport({ Id = killer.ObjectId, OffsetX = 0, OffsetY = 0 })
		ClearLootDrops( killer )
		Destroy({ Id = zagreusDeathFlash.Id })

		-- wait(0.55)
		if CurrentRun.Cleared then
			PlaySound({ Name = "/Music/HadesThemeStingerINTENSE" })
		else
			PlaySound({ Name = "/Music/HadesThemeStinger" })
		end

		if ConfigOptionCache.EasyMode and not currentRun.Cleared then
			thread( EasyModeLevelUpPresentation )
			wait( 3.0 )
		end

		if deathPresentation == 1 then
			-- Hades Death Taunt
			thread( HadesSpeakingPresentation, {}, { BlockScreenshake = true, VoiceLines = GlobalVoiceLines.HadesDeathTauntVoiceLines } )
		elseif deathPresentation == 2 then
			-- Olympian Death Taunt
			local spurnedGodName = CurrentRun.CurrentRoom.Encounter.SpurnedGodName
			local spurnedGodData = LootData[spurnedGodName]
			thread( HadesSpeakingPresentation, { SubtitleColor = spurnedGodData.SubtitleColor }, { OverlayAnim = spurnedGodData.OverlayAnim, BlockScreenshake = true, VoiceLines = spurnedGodData.DeathTauntVoiceLines } )
		elseif deathPresentation == 3 then
			-- Thanatos Death Taunt
			thread( HadesSpeakingPresentation, ActiveEnemies[ThanatosId] or { SubtitleColor = Color.ThanatosVoice }, { OverlayAnim = "ThanatosOverlay", BlockScreenshake = true, VoiceLines = GlobalVoiceLines.ThanatosDeathTauntVoiceLines } )
		elseif deathPresentation == 4 then
			-- Chaos Death Taunt
			thread( HadesSpeakingPresentation, { SubtitleColor = LootData.TrialUpgrade.SubtitleColor }, { OverlayAnim = "ChaosOverlay", BlockScreenshake = true, VoiceLines = LootData.TrialUpgrade.DeathTauntVoiceLines } )
		end

		for index, requirements in pairs(GameData.FlashbackRequirements) do
			if IsGameStateEligible( CurrentRun, requirements ) then
				GameState.Flags.AllowFlashback = true
			end
		end

		-- wait(7.2)

		SetThingProperty({ Property = "AllowAnyFire", Value = true, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
		RemoveInputBlock({ Name = "DeathPresentation" })
		UnblockCombatUI("Death")
		SetConfigOption({ Name = "UseOcclusion", Value = true })
	end

	ModUtil.BaseOverride( "EndEarlyAccessPresentation", function ()
		thread( Kill, CurrentRun.Hero )
	end, SkipDeathScene)
end