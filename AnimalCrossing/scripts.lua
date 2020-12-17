
local mod = "AnimalCrossing"
local package = "AC"

ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
	DebugPrint({Text = "@"..mod.." Trying to load package "..package..".pkg"})
	LoadPackages({Name = package})
	return baseFunc()
end)

--Simplified DisplayUnlockText
function DisplayAnimalCrossingFish(args)
    local backColor = args.Color or Color.LocationTextGold
    local additionalAnimation = args.AdditionalAnimation
    local highlightIcon = args.HighlightIcon
    local iconScale = args.IconScale or 1.0
    local animationName = args.AnimationName or "LocationTextBGGeneric"
    local animationOutName = args.AnimationOutName or "LocationTextBGGenericOut"

    if args.Delay == nil then
        args.Delay = 0.25
    end

    if args.SubtitleData == nil then
        args.SubtitleData = {}
    end
    if args.SupertitleData == nil then
        args.SupertitleData = {}
    end

    local layer = args.Layer or "Combat_Menu_TraitTray_Overlay"

    wait( args.Delay, args.ThreadName or RoomThreadName )

    local iconBackingId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY + 315, Group = layer })
    local iconId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY + 315, Group = layer })
    if args.Icon then
        SetAnimation({ Name = "Portrait_Zag_Default_01", DestinationId = iconBackingId, OffsetY = -500 })
        SetScale({ Id = iconId, Fraction = iconScale })
        SetAnimation({ Name = args.Icon, DestinationId = iconId, OffsetY = -250, OffsetX = 0 })
        if highlightIcon then
            SetThingProperty({ Property = "AddColor", Value = true, DestinationId = iconId })
            SetColor({ Id = iconId, Color = { 255,200,196,0 } })
            SetColor({ Id = iconId, Color = { 0,0,0,255 }, Duration = 1.5 })
            SetAlpha({ Id = iconId, Fraction = 0 })
            SetAlpha({ Id = iconId, Fraction = 1, Duration = 0.125 })
            SetScale({ Id = iconId, Fraction = 0.5 * iconScale })
            SetScale({ Id = iconId, Fraction = 0.6 * iconScale, Duration = 3.5, EaseIn = 0, EaseOut = 1.0})
        end
    end

    local locationTextBG = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY + 320, Group = layer, })
    SetAnimation({ Name = animationName, DestinationId = locationTextBG })

    if args.AdditionalAnimation ~= nil then
        CreateAnimation({ Name = additionalAnimation, DestinationId = locationTextBG })
    end

    ModifyTextBox({ Id = locationTextBG, ScaleTarget = 1.2, ScaleDuration = 60 })

    PlaySound({ Name = "/SFX/Menu Sounds/HadesLocationTextDisappear", Id = promptId })
    wait(3.0)
    SetAnimation({ Name = animationOutName, DestinationId = locationTextBG })
    PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFadeLOCATION" })

    SetAlpha({ Id = iconId, Fraction = 0.0, Duration = 0.5 })
    SetAlpha({ Id = iconBackingId, Fraction = 0.0, Duration = 0.5 })
    SetAlpha({ Id = locationTextBG, Fraction = 0.0, Duration = 0.5 })
    ModifyTextBox({ Id = promptId, FadeTarget = 0.0, FadeDuration = 0.0, ColorTarget = backColor, ColorDuration = 0.5 })
    wait( 1.0, args.ThreadName or RoomThreadName )
    Destroy({ Id = iconBackingId })
    DestroyTextBox({ Id = promptId })
    Destroy({ Ids = { promptId, locationTextBG, iconId }})
end

--Wrap
function FishingEndPresentation( fishingAnimationPointId )
	CreateAnimation({ Name = "FishingSplashB", DestinationId = fishingAnimationPointId })
	SetAlpha({ Id = fishingAnimationPointId, Fraction = 0, Duration = 0 })

	CurrentRun.Hero.FishingInput = true
	killTaggedThreads( "Fishing")
	local fishingState = CurrentRun.Hero.FishingState
	local fishName = nil
	local biomeName = CurrentRun.CurrentRoom.FishBiome or CurrentRun.CurrentRoom.RoomSetName or "None"
	fishName = GetFish( biomeName, fishingState )
	local fishData = FishingData.FishValues[fishName]

	if fishName then
		thread( MarkObjectiveComplete, "Fishing" )
		thread( PlayVoiceLines, fishData.FishCaughtVoiceLines )

		--Shake({ Id = CurrentRun.Hero.ObjectId, Distance = 2, Speed = 200, Duration = 0.35 })
		PlaySound({ Name = "/SFX/CriticalHit" })
		PlaySound({ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Sword" })
		thread( DoRumble, { { ScreenPreWait = 0.04, RightFraction = 0.28, Duration = 0.4 }, } )
		wait(0.1)
		PlaySound({ Name = "/SFX/Player Sounds/ZagreusWhooshDropIn" })
		wait(0.2)
		--Shake({ Id = CurrentRun.Hero.ObjectId, Distance = 2, Speed = 200, Duration = 0.35 })
		PlaySound({ Name = "/SFX/Enemy Sounds/Megaera/MegDeathSplash", Id = fishingAnimationPointId })
		PlaySound({ Name = "/VO/ZagreusEmotes/EmoteRanged" })
		SetAnimation({ Name = "ZagreusInteractionFishing_PullSuccess", DestinationId = CurrentRun.Hero.ObjectId })
		thread( DoRumble, { { ScreenPreWait = 0.7, LeftFraction = 0.35, Duration = 0.4 }, } )

		RecordFish(fishName)

		PlaySound({ Name = "/Leftovers/SFX/VictoryScreenUpdateSFX", Delay = 1 })

		local fishingText = "Fishing_SuccessGoodTitle"
		if fishingState == "Perfect" then
			fishingText = "Fishing_SuccessPerfectTitle"
		end

		thread( PlayVoiceLines, fishData.FishIdentifiedVoiceLines )

		DisplayAnimalCrossingFish({
			Icon = fishName,
			SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = fishName }},
			IconOffsetY = 20,
			HighlightIcon = true,
			IconScale = 1.0,
			AdditionalAnimation = "FishCatchPresentationSparkles",
			AnimationName = "AnimalCrossingTextboxIn",
			AnimationOutName = "AnimalCrossingTextboxOut",
		})

		CheckCodexUnlock( "Fish", fishName )

	else
		thread( MarkObjectiveFailed, "Fishing" )
		--Shake({ Id = CurrentRun.Hero.ObjectId, Distance = 2, Speed = 200, Duration = 0.35 })
		SetAnimation({ Name = "ZagreusInteractionFishing_PullFailure", DestinationId = CurrentRun.Hero.ObjectId })
		PlaySound({ Name = "/Leftovers/SFX/BigSplashRing", Delay = 0.3 })
		PlaySound({ Name = "/SFX/CrappyRewardDrop", Delay = 0.5 })

		PlaySound({ Name = "/Leftovers/SFX/ImpCrowdLaugh" })
		thread( DoRumble, { { ScreenPreWait = 0.02, RightFraction = 0.17, Duration = 0.7 }, } )

		if CurrentRun.Hero.FishingState == "TooEarly" then
			thread( PlayVoiceLines, HeroVoiceLines.FishNotCaughtVoiceLines, true )

			thread( DisplayUnlockText, {
			TitleText = "Fishing_FailedTitle",
			SubtitleText = "Fishing_FailedEarly",
			})

		else
			if CurrentRun.Hero.FishingState == "TooLate" then
				thread( PlayVoiceLines, HeroVoiceLines.FishNotCaughtVoiceLines, true )
			elseif CurrentRun.Hero.FishingState == "WayLate" then
				thread( PlayVoiceLines, HeroVoiceLines.FishNotCaughtTooLateVoiceLines, true )
			end

			thread( DisplayUnlockText, {
			TitleText = "Fishing_FailedTitle",
			SubtitleText = "Fishing_FailedLate",
			})
		end
		wait( 2 )
	end
	CurrentRun.CurrentRoom.CompletedFishing = true
	CurrentRun.Hero.FishingStarted = false
	RemoveTimerBlock( CurrentRun, "Fishing" )
	UnfreezePlayerUnit("Fishing")
	UnblockCombatUI("Fishing")

	if CurrentRun.CurrentRoom.ZoomFraction ~= nil then
		AdjustZoom({ Fraction = CurrentRun.CurrentRoom.ZoomFraction, LerpTime = 1.5 })
	else
		AdjustZoom({ Fraction = 1.0, LerpTime = 1.5 })
	end
end