local TextLineGroups =
{
    HiddenAspects =
    {
        "NyxRevealsArthurAspect01",
        "AchillesRevealsGuanYuAspect01",
        "ZeusRevealsLuciferAspect01",
        "ArtemisRevealsRamaAspect01",
        "ChaosRevealsBeowulfAspect01",
        "MinotaurRevealsGilgameshAspect01"
    },
}

local DialogManagerData =
{
    DialogManagerScreen =
    {
        Buttons =
        {
            HiddenAspects =
            {
                Name = "OpenBuildMakerButton",
				Title = "Open Build Maker",
				Function = "OpenBuildMaker",
				Index = 1,
            }
        }
    }
}

-- we can't wrap callbacks so a hack is needed to prevent the game from concatenating a table
local TempForceEvent

DialogManagerScreen = { Components = {} }

SaveIgnores["DialogManagerScreen"] = true

ModUtil.RegisterMod("DialogManager")

OnUsed{"HouseChair01", function (triggerArgs)
    DialogManager.OpenDialogManagerScreen()
end}

function DialogManager.OpenDialogManagerScreen()
	ScreenAnchors.DialogManager = DeepCopyTable(DialogManagerScreen)
	local screen = ScreenAnchors.DialogManager
	local components = screen.Components
	screen.Title = "Dialog Manager"
	screen.Name = "DialogManagerScreen"
    if BuildManager.Data.SavedBuilds == nil then
        BuildManager.Data.SavedBuilds = {}
    end
	OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
	SetConfigOption({ Name = "UseOcclusion", Value = false })
	FreezePlayerUnit()
	EnableShopGamepadCursor()
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
	--Background
	components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "DialogManager" })
	components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "DialogManager" })
	components.TitleAnchor = CreateScreenComponent({ Name = "BlankObstacle", Group = "DialogManager" })
	SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
	SetColor({ Id = components.BackgroundDim.Id, Color = { 69, 69, 69, 255 } })
	--Title
	CreateTextBox({ Id = components.TitleAnchor.Id, Text = screen.Title, FontSize = 34,
	OffsetX = 0, OffsetY = -500, Color = Color.White, Font = "SpectralSCLight",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
	--Close button
	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "DialogManager" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 0, OffsetY = 500 })
	components.CloseButton.OnPressedFunctionName = "DialogManager.CloseDialogManager"
	components.CloseButton.ControlHotkey = "Cancel"
	--Display
    DialogManager.DisplayTextLineGroups(components)
	--End
	screen.KeepOpen = true
	thread(HandleWASDInput, screen)
	HandleScreenInput(screen)
end

function DialogManager.DisplayTextLineGroups(components)
    local index = 1
    for name, textlines in pairs(TextLineGroups) do
        local rowstartX = -700
        local rowstartY = -400
        local rowoffset = 100
        local columnoffset = 300
        local numperrow = 7
        local offsetX = rowstartX + columnoffset*((index-1) % numperrow)
        local offsetY = rowstartY + rowoffset*(math.floor((index-1)/numperrow))
        index = index + 1

        components[name] = CreateScreenComponent({ Name = "BoonSlot1", Group = "DialogManager", Scale = 0.3 })
        SetScaleX({Id = components[name].Id, Fraction = 1.5})
        components[name].OnPressedFunctionName = "DialogManager.ShowTextlinesScreen"
        components[name].ToDestroy = true
        components[name].TextLines = textlines
        Attach({Id = components[name].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
        CreateTextBox({ Id = components[name].Id, Text = name, FontSize = 22,
        OffsetX = 0, OffsetY = 0, Color = Color.White, Font = "AlegreyaSansSCLight", Justification = "Center" })
    end
end

function DialogManager.ShowTextlinesScreen(screen, button)
    DialogManager.CleanScreen(screen, button)
	local components = screen.Components
	ModifyTextBox({Id = components.TitleAnchor.Id, Text = ""})
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
	components.ReturnButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
	components.ReturnButton.OnPressedFunctionName = "DialogManager.ReturnToDialogManagerScreen"
	components.ReturnButton.ToDestroy = true
	Attach({ Id = components.ReturnButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = 500 })
	SetColor({Id = components.ReturnButton.Id, Color = Color.LightBlue})

    screen.CurrentTextLines = button.TextLines
    DialogManager.ShowTextlines(components, button.TextLines)
end

function DialogManager.ShowTextlines(components, textlines)
    local index = 1
    for _, textline in pairs(textlines) do
        local color = Color.White
        local rowstartX = -700
        local rowstartY = -400
        local rowoffset = 100
        local columnoffset = 450
        local numperrow = 4
        local offsetX = rowstartX + columnoffset*((index-1) % numperrow)
        local offsetY = rowstartY + rowoffset*(math.floor((index-1)/numperrow))
        index = index + 1

        -- Already seen dialog
        if TextLinesRecord[textline] then
            color = Color.LightGreen
        end

        -- Dialog is in the forced pool
        if ForceEvent ~= nil and ForceEvent[textline] then
            color = Color.LightBlue
        end

        components[textline] = CreateScreenComponent({ Name = "BoonSlot1", Group = "DialogManager", Scale = 0.3 })
        SetScaleX({Id = components[textline].Id, Fraction = 1.5})
        components[textline].OnPressedFunctionName = "DialogManager.MakeTextLineForced"
        components[textline].ToDestroy = true
        components[textline].TextLine = textline
        Attach({Id = components[textline].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
        CreateTextBox({ Id = components[textline].Id, Text = textline, FontSize = 22,
        OffsetX = 0, OffsetY = 0, Color = color, Font = "AlegreyaSansSCLight", Justification = "Center" })
    end
end

function DialogManager.ReturnToDialogManagerScreen(screen, button)
	DialogManager.CleanScreen(screen, button)
	local components = screen.Components
	ModifyTextBox({Id = components.TitleAnchor.Id, Text = screen.Title})
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })

    screen.CurrentTextLines = nil
    DialogManager.DisplayTextLineGroups(components)
end

function DialogManager.CloseDialogManager(screen)
    DisableShopGamepadCursor()
    SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
    SetConfigOption({ Name = "UseOcclusion", Value = true })
    CloseScreen(GetAllIds(screen.Components), 0.1)
    PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
    ScreenAnchors.DialogManager = nil
    UnfreezePlayerUnit()
    screen.KeepOpen = false
    OnScreenClosed({ Flag = screen.Name })
end

function DialogManager.CleanScreen(screen)
	if screen == nil then
		return
	end

	local ToDestroy = {}
	for i, component in pairs(screen.Components) do
		if component.ToDestroy then
			table.insert(ToDestroy, component.Id)
		end
	end

	if ToDestroy ~= nil then
		Destroy({Ids = ToDestroy})
	end
end

function DialogManager.MakeTextLineForced(screen, button)
    if ForceEvent == nil then
        ForceEvent = {}
    end

    local textline = button.TextLine
    if ForceEvent[textline] then
        -- table.remove(ForceEvent, textline)
        ForceEvent[textline] = nil
    else
        -- table.insert(ForceEvent, textline)
        ForceEvent[textline] = true
    end

    DialogManager.CleanScreen(screen)
    DialogManager.ShowTextlines(screen.Components, screen.CurrentTextLines)
end

ModUtil.BaseOverride("ForcePlayTextLines", function (source, textLinesName )
    local possibleSets =
	{
		"OnUsedTextLineSets", "InteractTextLineSets", "RepeatableTextLineSets",
		"PriorityPickupTextLineSets", "PickupTextLineSets", "RejectionTextLines", "MakeUpTextLines", "BoughtTextLines", "GiftTextLineSets",
		"BossPresentationIntroTextLineSets", "BossPresentationTextLineSets", "BossPresentationRepeatableTextLineSets",
	}
    for textline, i in pairs (textLinesName)do
        DebugPrint({Text=textline})
        for k, possibleSet in pairs( possibleSets ) do
            local set = source[possibleSet]
            if set ~= nil then
                local event = set[textline]
                if event ~= nil then
                    event.Force = true
                    -- hack to prevent concatenating a table
                    TempForceEvent = ForceEvent
                    ForceEvent = textline
                    PlayTextLines( source, event, textline )
                    event.Force = false
                    return true
                end
            end
        end
    end


	return false
end, DialogManager)

ModUtil.BaseOverride("PlayTextLines", function (source, textLines, textline)
    if textLines == nil then
		return
	end
    --mod start
	if not IsTextLineEligible( CurrentRun, textLines ) and not textLines.Force then
    --mod end
		-- First check requirements of the whole set
		return
	end

	if PlayingTextLines then
		table.insert( QueuedTextLines, textLines )
		return
	end

	if GetConfigOptionValue({ Name = "EditingMode" }) then
		waitUntil( "EditingModeOff" )
	end

	local playedSomething = false
	local parentLine = textLines

	UnblockCombatUI("Speech")
	CombatUI.HiddenBySpeechPanel = false
	AddInputBlock({ Name = "PlayTextLines" })
	FreezePlayerUnit( "PlayTextLines", { DisableTray = false, StopRotation = false } )
	SetPlayerInvulnerable( "PlayTextLines" )
	local startTime = _worldTime

	wait( textLines.PreEventWait )
	if textLines.PreEventFunctionName ~= nil then
		local preEventFunction = _G[textLines.PreEventFunctionName]
		preEventFunction( source, textLines.PreEventFunctionArgs, textLines )
	end
	StartedTextLinesPresentation( source, textLines )

	PlayingTextLines = true
	OnScreenOpened({Flag = "Dialog"})
	local screen = {}
	if PlayTextLine( screen, textLines, nil, nil, source ) then
		playedSomething = true
	end
	if screen.CurrentPortrait ~= nil then
		SetAnimation({ DestinationId = screen.PortraitId, Name = screen.CurrentPortrait.."_Exit" })
		wait(0.3)
		Destroy({ Id = screen.PortraitId })
	end
	if parentLine.AttachedDim and _G["Dim"..parentLine.AttachedDim] then
		_G["Dim"..parentLine.AttachedDim]()
	end
	OnScreenClosed({Flag = "Dialog"})
	FinishedTextLinesPresentation( source, textLines )
	if not source.TextLinesIgnoreQuests then
		thread( CheckQuestStatus )
	end
	RemoveInputBlock({ Name = "PlayTextLines" })
	UnfreezePlayerUnit( "PlayTextLines" )
	SetPlayerVulnerable( "PlayTextLines" )
	PlayingTextLines = false
    
    -- mod start
	if textLines.UseableOffSource and not textLines.Force then
    --mod end
		source.NextInteractLines = nil
		UseableOff({ Id = source.ObjectId })
		StopStatusAnimation( source, StatusAnimations.WantsToTalk )
	end

	if CombatUI.HiddenBySpeechPanel then
		ShowCombatUI("Speech")
	end
	if CombatUI.ShowUIForDecision then
		CombatUI.ShowUIForDecision = nil
	end

	wait( textLines.EndWait )

	local args = {}
	args.ElapsedTime = _worldTime - startTime
	DebugPrint({ Text = "args.ElapsedTime = "..args.ElapsedTime })

	if textLines.EndCue ~= nil and (textLines.EndCueCooldownName == nil or CheckCooldown( textLines.EndCueCooldownName, textLines.EndCueCooldownTime ) ) then
		-- These EndCue lines should not repeat per run
		if not CurrentRun.SpeechRecord[textLines.EndCue] then
			-- EndCue always plays from the player
			local source = CurrentRun.Hero
			if textLines.EndCueSourceName ~= nil then
				local typeIds = GetIdsByType({ Name = textLines.EndCueSourceName })
				local objectId = typeIds[1]
				source = ActiveEnemies[objectId]
				if source == nil then
					source = {}
					source.ObjectId = objectId
				end
			end
			thread( PlayVoiceLines, { Cue = textLines.EndCue }, nil, source, args )
		end
	end
	if textLines.EndVoiceLines ~= nil then
		thread( PlayVoiceLines, textLines.EndVoiceLines, nil, source, args )
	end
	if textLines.EndGlobalVoiceLines ~= nil then
		thread( PlayVoiceLines, GlobalVoiceLines[textLines.EndGlobalVoiceLines], nil, source, args )
	end

	if not IsEmpty( QueuedTextLines ) then
		local nextTextLines = RemoveFirstValue( QueuedTextLines )
		if PlayTextLines( source, nextTextLines ) then
			playedSomething = true
		end
	end

    --mod start
    if playedSomething and textLines.Force then
        thread(DialogManager.RemoveForcedTextLine, textline)
    end
    --mod end

	return playedSomething
end, DialogManager)

function DialogManager.RemoveForcedTextLine(textline)
    wait(1)
    ForceEvent = TempForceEvent
    TempForceEvent = nil
    ForceEvent[textline] = nil
end