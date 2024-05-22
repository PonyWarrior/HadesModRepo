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
    Keepsakes =
    {
        "AchillesGift01",
        "AchillesGift07_A",
        "SkellyGift01",
        "SkellyGift07",
        "SisyphusGift01",
        "SisyphusGift07_A",
        "MegaeraGift01",
        "MegaeraGift07",
        "ThanatosGift01",
        "ThanatosGift07_A",
        "DusaGift01",
        "DusaGift07",
    },
    NPC_Hades_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    NPC_Sisyphus_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    --Skelly
    TrainingMelee =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    NPC_Achilles_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    --Megaera
    NPC_FurySister_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    Harpy2 =
    {
        "BossPresentationTextLineSets"
    },
    Harpy3 =
    {
        "BossPresentationTextLineSets"
    },
    NPC_Dusa_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"

    },
    NPC_Cerberus_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"

    },
    NPC_Nyx_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"

    },
    NPC_Hypnos_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"

    },
    NPC_Thanatos_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    NPC_Charon_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    TrialUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    ZeusUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    PoseidonUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    AthenaUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    AphroditeUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    ArtemisUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    AresUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    DionysusUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    HermesUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    DemeterUpgrade =
    {
        "SuperPriorityPickupTextLineSets", "PriorityPickupTextLineSets", "PickupTextLineSets", "GiftTextLineSets"
    },
    NPC_Orpheus_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    NPC_Eurydice_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    NPC_Patroclus_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
    Theseus =
    {
        "BossPresentationTextLineSets"
    },
    Minotaur =
    {
        "BossPresentationPriorityIntroTextLineSets", "BossPresentationIntroTextLineSets", "BossPresentationTextLineSets"
    },
    NPC_Persephone_01 =
    {
        "InteractTextLineSets"
    },
    NPC_Persephone_Home_01 =
    {
        "InteractTextLineSets", "GiftTextLineSets"
    },
}

-- we can't wrap callbacks so a hack is needed to prevent the game from concatenating a table
local TempForceEvent

DialogManagerScreen = { Components = {} }

SaveIgnores["DialogManagerScreen"] = true

function CodexMenu.OpenDialogManagerScreen()
	ScreenAnchors.DialogManager = DeepCopyTable(DialogManagerScreen)
	local screen = ScreenAnchors.DialogManager
	local components = screen.Components
	screen.Title = "Dialog Manager"
	screen.Name = "DialogManagerScreen"
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
	components.CloseButton.OnPressedFunctionName = "CodexMenu.CloseDialogManager"
	components.CloseButton.ControlHotkey = "Cancel"
	--Display
    CodexMenu.DisplayTextLineGroups(components)
	--End
	screen.KeepOpen = true
	thread(HandleWASDInput, screen)
	HandleScreenInput(screen)
end

function CodexMenu.DisplayTextLineGroups(components)
    local index = 1
    for name, textlines in pairs(TextLineGroups) do
        local rowstartX = -650
        local rowstartY = -400
        local rowoffset = 100
        local columnoffset = 325
        local numperrow = 5
        local offsetX = rowstartX + columnoffset*((index-1) % numperrow)
        local offsetY = rowstartY + rowoffset*(math.floor((index-1)/numperrow))
        index = index + 1

        components[name] = CreateScreenComponent({ Name = "BoonSlot1", Group = "DialogManager", Scale = 0.3 })
        SetScaleX({Id = components[name].Id, Fraction = 1.2})
        components[name].OnPressedFunctionName = "CodexMenu.ShowTextlinesScreen"
        components[name].ToDestroy = true
        components[name].TextLines = textlines
        if UnitSetData.NPCs[name] or UnitSetData.Enemies[name] or LootData[name] then
            components[name].Name = name
        end
        Attach({Id = components[name].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
        CreateTextBox({ Id = components[name].Id, Text = name, FontSize = 22,
        OffsetX = 0, OffsetY = 0, Color = Color.White, Font = "AlegreyaSansSCLight", Justification = "Center" })
    end
end

function CodexMenu.ShowTextlinesScreen(screen, button)
    CodexMenu.CleanScreen(screen, button)
	local components = screen.Components
	ModifyTextBox({Id = components.TitleAnchor.Id, Text = ""})
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
    if components.ReturnButton ~= nil then
        Destroy({Id = components.ReturnButton.Id})
    end
	components.ReturnButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
	components.ReturnButton.OnPressedFunctionName = "CodexMenu.ReturnToDialogManagerScreen"
	Attach({ Id = components.ReturnButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = 500 })
	SetColor({Id = components.ReturnButton.Id, Color = Color.LightBlue})

    screen.CurrentTextLines = button.TextLines
    CodexMenu.ShowTextlines(components, button.TextLines, button.Name)
end

function CodexMenu.ShowTextlines(components, textlines, name)
    local index = 1
    if name ~= nil then
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

            local data
            if UnitSetData.NPCs[name] then
                data = UnitSetData.NPCs[name][textline]
            elseif UnitSetData.Enemies[name] then
                data = UnitSetData.Enemies[name][textline]
            else
                data = LootData[name][textline]
            end

            components[textline] = CreateScreenComponent({ Name = "BoonSlot1", Group = "DialogManager", Scale = 0.3 })
            SetScaleX({Id = components[textline].Id, Fraction = 1.5})
            components[textline].OnPressedFunctionName = "CodexMenu.ShowTextlinesScreenAlt"
            components[textline].ToDestroy = true
            components[textline].TextLines = data
            Attach({Id = components[textline].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
            CreateTextBox({ Id = components[textline].Id, Text = textline, FontSize = 22,
            OffsetX = 0, OffsetY = 0, Color = color, Font = "AlegreyaSansSCLight", Justification = "Center" })
        end
    else
        for _, textline in pairs(textlines) do
            local color = Color.White
            local rowstartX = -700
            local rowstartY = -400
            local rowoffset = 50
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
            components[textline].OnPressedFunctionName = "CodexMenu.MakeTextLineForced"
            components[textline].ToDestroy = true
            components[textline].TextLine = textline
            Attach({Id = components[textline].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
            CreateTextBox({ Id = components[textline].Id, Text = textline, FontSize = 22,
            OffsetX = 0, OffsetY = 0, Color = color, Font = "AlegreyaSansSCLight", Justification = "Center" })
        end
    end
end

function CodexMenu.ShowTextlinesScreenAlt(screen, button)
    CodexMenu.CleanScreen(screen, button)
	local components = screen.Components
	ModifyTextBox({Id = components.TitleAnchor.Id, Text = ""})
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
    if components.ReturnButton ~= nil then
        Destroy({Id = components.ReturnButton.Id})
    end
	components.ReturnButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
	components.ReturnButton.OnPressedFunctionName = "CodexMenu.ReturnToDialogManagerScreen"
	Attach({ Id = components.ReturnButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = 500 })
	SetColor({Id = components.ReturnButton.Id, Color = Color.LightBlue})

    screen.StartingIndex = 1
    screen.MaxIndex = 69
    screen.CurrentTextLines = button.TextLines
    CodexMenu.ShowTextlinesAlt(screen, button.TextLines)
end

function CodexMenu.ShowTextlinesAlt(screen , textlines)
    local components = screen.Components

    if TableLength(textlines) > screen.MaxIndex then
        components.PageButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "BuildMenu" })
        components.PageButton.OnPressedFunctionName = "CodexMenu.SwitchPage"
        components.PageButton.ToDestroy = true
        Attach({ Id = components.PageButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = 500 })
        SetColor({Id = components.PageButton.Id, Color = Color.LightGreen})
    end

    local index = 1
    local count = 1
    for textline, _ in pairs(textlines) do
        if count >= screen.StartingIndex then
            if index >= screen.MaxIndex then
                break
            end
            local color = Color.White
            local rowstartX = -700
            local rowstartY = -400
            local rowoffset = 50
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
            SetScaleY({Id = components[textline].Id, Fraction = 0.8})
            components[textline].OnPressedFunctionName = "CodexMenu.MakeTextLineForced"
            components[textline].ToDestroy = true
            components[textline].TextLine = textline
            components[textline].Alt = true
            Attach({Id = components[textline].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
            CreateTextBox({ Id = components[textline].Id, Text = textline, FontSize = 19,
            OffsetX = 0, OffsetY = 0, Color = color, Font = "AlegreyaSansSCLight", Justification = "Center" })
        end
        count = count + 1
    end
end

function CodexMenu.SwitchPage(screen, button)
    CodexMenu.CleanScreen(screen)
    if screen.StartingIndex == 1 then
        screen.StartingIndex = 69
    else
        screen.StartingIndex = 1
    end
    CodexMenu.ShowTextlinesAlt(screen, screen.CurrentTextLines)
end

function CodexMenu.ReturnToDialogManagerScreen(screen, button)
	CodexMenu.CleanScreen(screen, button)
	local components = screen.Components
	ModifyTextBox({Id = components.TitleAnchor.Id, Text = screen.Title})
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
    if components.ReturnButton ~= nil then
        Destroy({Id = components.ReturnButton.Id})
    end
    
    screen.CurrentTextLines = nil
    CodexMenu.DisplayTextLineGroups(components)
end

function CodexMenu.CloseDialogManager(screen)
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

function CodexMenu.CleanScreen(screen)
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

function CodexMenu.MakeTextLineForced(screen, button)
    if ForceEvent == nil then
        ForceEvent = {}
    end

    local textline = button.TextLine
    if ForceEvent[textline] then
        ForceEvent[textline] = nil
    else
        ForceEvent[textline] = true
    end

    CodexMenu.CleanScreen(screen)
    if button.Alt then
        CodexMenu.ShowTextlinesAlt(screen, screen.CurrentTextLines)
    else
        CodexMenu.ShowTextlines(screen.Components, screen.CurrentTextLines)
    end
end

ModUtil.Path.Override("ForcePlayTextLines", function (source, textLinesName )
    local possibleSets =
	{
		"OnUsedTextLineSets", "InteractTextLineSets", "RepeatableTextLineSets", "SuperPriorityPickupTextLineSets",
		"PriorityPickupTextLineSets", "PickupTextLineSets", "RejectionTextLines", "MakeUpTextLines", "BoughtTextLines", "GiftTextLineSets",
		"BossPresentationIntroTextLineSets", "BossPresentationTextLineSets", "BossPresentationRepeatableTextLineSets", "BossPresentationPriorityIntroTextLineSets"
	}
    for textline, i in pairs (textLinesName)do
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

ModUtil.Path.Override("PlayTextLines", function (source, textLines, textline)
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
        thread(CodexMenu.RemoveForcedTextLine, textline)
    end
    --mod end

	return playedSomething
end, DialogManager)

function CodexMenu.RemoveForcedTextLine(textline)
    wait(1)
    ForceEvent = TempForceEvent
    TempForceEvent = nil
    ForceEvent[textline] = nil
end