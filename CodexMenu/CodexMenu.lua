function CodexInit()
	CodexStatus = CodexStatus or {}
	CodexStatus.SelectedChapterName = CodexStatus.SelectedChapterName or "Loot"
	CodexStatus.SelectedEntryNames = {}
	UnlockExistingEntries()
end

local updatedUnselectedColor = Color.CodexUnread
local selectedColor = Color.White
local unselectedColor = Color.CodexTitleUnselected
local lockedColor = Color.CodexLocked

local selectedFont = "AlegreyaSansSCBold"
local unselectedFont = "AlegreyaSansSCRegular"

function IncrementCodexValue( chapterName, entryName )
	--[[
	if not CodexStatus.Enabled then
		return
	end
	]]
	if Codex[chapterName] == nil or Codex[chapterName].Entries[entryName] == nil then
		return
	end

	if chapterName == nil or entryName == nil then
		return
	end
	if CodexStatus[chapterName] == nil then
		CodexStatus[chapterName] = {}
	end
	if CodexStatus[chapterName][entryName] == nil then
		CodexStatus[chapterName][entryName] = {}
	end

	IncrementTableValue(CodexStatus[chapterName][entryName], "Amount")
end

function CheckLocationUnlock( eventSource, args )
	local wait = args.Wait or 2.5
	local biome = args.Biome

	CurrentRun.BiomesReached = CurrentRun.BiomesReached or {}
	CurrentRun.BiomesReached [ args.Biome ] = true
	CheckCodexUnlock( "Biomes", args.Biome )
end

function CheckCodexUnlock( chapterName, entryName, skipIncrement )
	if Codex[chapterName] == nil or Codex[chapterName].Entries[entryName] == nil then
		return
	end

	if not skipIncrement then
		IncrementCodexValue( chapterName, entryName )
	end

	if Codex[chapterName].Entries[entryName] ~= nil then
		local threshold = 0
		for index, entry in ipairs( Codex[chapterName].Entries[entryName].Entries ) do
			local nextThreshold = entry.UnlockThreshold or 0
			threshold = threshold + nextThreshold
			if not entry.UnlockGameStateRequirements and ( entry.UnlockThreshold == nil or GetCodexEntryAmount( chapterName, entryName ) >= threshold ) then
				UnlockCodexEntry( chapterName, entryName, index, skipToast )
			elseif entry.UnlockGameStateRequirements and IsGameStateEligible( CurrentRun, entry.UnlockGameStateRequirements ) then
				UnlockCodexEntry( chapterName, entryName, index, skipToast )
			end
		end
	end
end

function GetCodexEntryAmount( chapterName, entryName )
	if chapterName == nil or entryName == nil then
		return
	end
	if CodexStatus[chapterName] == nil then
		CodexStatus[chapterName] = {}
	end
	if CodexStatus[chapterName][entryName] == nil then
		CodexStatus[chapterName][entryName] = {}
	end
	return CodexStatus[chapterName][entryName].Amount or 0
end

function UnlockExistingEntries()
	for chapterName, chapterData in pairs(Codex) do
		for entryName, entryData in pairs(Codex[chapterName].Entries) do
			if entryData.Entries[1].UnlockThreshold == nil and not entryData.Entries[1].UnlockGameStateRequirements then
				UnlockCodexEntry(chapterName, entryName, 1, true )
			end
		end
	end
end

function UnlockCodexEntry( chapterName, entryName, entryIndex, skipToast )

	if chapterName == nil or entryName == nil then
		return
	end

	if CodexStatus[chapterName] == nil then
		CodexStatus[chapterName] = {}
	end
	if CodexStatus[chapterName][entryName] == nil then
		CodexStatus[chapterName][entryName] = {}
	end

	if CodexStatus[chapterName][entryName][entryIndex] == nil or type(CodexStatus[chapterName][entryName][entryIndex]) ~= "table" then
		CodexStatus[chapterName][entryName][entryIndex] = {}
	end

	if CodexStatus[chapterName][entryName][entryIndex].Unlocked then
		-- Already unlocked
		return
	end

	CodexStatus[chapterName][entryName][entryIndex].Unlocked = true
	thread( CheckQuestStatus )

	-- Auto-select
	CodexStatus.SelectedChapterName = chapterName
	CodexStatus.SelectedEntryNames[chapterName] = entryName

	-- New Status
	CodexStatus[chapterName].New = true
	CodexStatus[chapterName][entryName].New = true

	local entryData = Codex[chapterName].Entries[entryName]
	entryData.Message = entryData.UnlockMessage or "Codex_EntryUnlocked"
	if not skipToast and CodexStatus.Enabled then
		if CurrentRun and CurrentRun.CurrentRoom and IsCombatEncounterActive( CurrentRun ) then
			CurrentRun.CurrentRoom.PendingCodexUpdate = true
		else
			thread( ShowCodexUpdate )
		end
	end

end

function HasCodexEntry( selectedEntryName )
	if not CodexStatus.Enabled then
		return false
	end

	for chapterName, chapterData in pairs(Codex) do
		for entryName, entryData in pairs(chapterData.Entries) do
			if entryName == selectedEntryName then
				return true
			end
		end
	end
	return false
end

function SelectCodexEntry( selectedEntryName )
	if not CodexStatus.Enabled then
		return
	end

	for chapterName, chapterData in pairs(Codex) do
		for entryName, entryData in pairs(chapterData.Entries) do
			if entryName == selectedEntryName then
				CodexStatus.SelectedChapterName = chapterName
				if CodexStatus.SelectedEntryNames == nil then
					CodexStatus.SelectedEntryNames = {}
				end
				CodexStatus.SelectedEntryNames[chapterName] = entryName
				return
			end
		end
	end
end

function GetSortedCodex()
	local sortedCodex = {}
	local orphans = {}
	for key in pairs(Codex) do
		if GetKey(CodexOrdering.Order, key) ~= nil then
			sortedCodex[GetKey(CodexOrdering.Order, key)] = key
		else
			table.insert(orphans, key)
		end
	end
	table.sort(orphans)
	for _, key in pairs(orphans) do
		table.insert(sortedCodex, key)
	end
	return sortedCodex
end

function HasNewEntries()
	for chapterName, chapterData in pairs(Codex) do
		for entryName in pairs(Codex[chapterName].Entries) do
			if chapterData.Entries[entryName].New then
				return true
			end
		end
	end
	return false
end

function HasUnlockedEntries( chapterName )
	if not CodexStatus[chapterName] then
		return false
	end

	for entryName in pairs(Codex[chapterName].Entries) do
		if CodexStatus[chapterName] and CodexStatus[chapterName][entryName] and CodexStatus[chapterName][entryName][1] and CodexStatus[chapterName][entryName][1].Unlocked then
			return true
		end
	end

	return false
end

function SelectNearbyUnlockedEntry()
	local nearbyId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationNames = { "NPCs", "ConsumableItems", "Loot", "EnemyTeam" }, Distance = 600 })
	local nearbyGenusName = nil
	if nearbyId ~= nil and ActiveEnemies[nearbyId] ~= nil then
		nearbyGenusName = ActiveEnemies[nearbyId].GenusName
	end

	local nearbyName = nearbyGenusName or GetName({ Id = nearbyId })
	if nearbyName ~= nil then
		for chapterName, chapterData in pairs(Codex) do
			for entryName in pairs(Codex[chapterName].Entries) do
				if entryName == nearbyName and CodexStatus[chapterName] and CodexStatus[chapterName][entryName] and CodexStatus[chapterName][entryName][1] and CodexStatus[chapterName][entryName][1].Unlocked then
					CodexStatus.SelectedChapterName = chapterName
					CodexStatus.SelectedEntryNames[chapterName] = nearbyName
					return
				end
			end
		end
	end
end

--[[
Due to slight differences in organization between chapters and entries
a separate function was created to sort entries. Bug Alice to sweep this up.
]]--
function GetSortedCodexSubcategory(subcategory)
	local sortedSubcategory = {}
	local orphans = {}
	for key in pairs(Codex[subcategory].Entries) do
		if GetKey(CodexOrdering[subcategory].Order, key) ~= nil then
			sortedSubcategory[GetKey(CodexOrdering[subcategory].Order, key)] = key
		else
			table.insert(orphans, key)
		end
	end
	table.sort(orphans)
	for _, key in pairs(orphans) do
		table.insert(sortedSubcategory, key)
	end
	return sortedSubcategory
end

function OpenCodexScreen()
	if not CodexStatus.Enabled then
		return
	end
	if IsScreenOpen("Codex") then
		return
	end

	OnScreenOpened({Flag = "Codex"})

	CancelOpeningCodex()

	FreezePlayerUnit()
	EnableShopGamepadCursor()
	SetConfigOption({ Name = "GamepadCursorFreeFormSelect", Value = false })
	HideCombatUI()

	if not HasNewEntries() then
		SelectNearbyUnlockedEntry()
	end

	CodexUI.Screen = { Name = "Codex", Components = {} }

	local screen = CodexUI.Screen
	local components = screen.Components

	components.BackgroundTint = CreateScreenComponent({ Name = "rectangle01", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
	SetScale({ Id = components.BackgroundTint.Id, Fraction = 10 })
	SetColor({ Id = components.BackgroundTint.Id, Color = Color.Black })
	SetAlpha({ Id = components.BackgroundTint.Id, Fraction = 0.0, Duration = 0 })
	SetAlpha({ Id = components.BackgroundTint.Id, Fraction = 0.75, Duration = 0.5 })


	components.Background = CreateScreenComponent({ Name = "CodexBackground", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
	wait( 0.25, RoomThreadName )
	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Sound = "/SFX/Menu Sounds/GodBoonMenuClose", Group = "Combat_Menu" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 0, OffsetY = 480 })
	components.CloseButton.OnPressedFunctionName = "CloseCodexScreen"
	components.CloseButton.ControlHotkey = "Cancel"

	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })

	-- Title
	CreateTextBox({ Id = components.Background.Id, Text = "Codex_Title",
			Font = "SpectralSCLightTitling", FontSize = "28", Color = Color.White,
			OffsetY = -450, Justification = "Center" })

	local sortedCodex = GetSortedCodex( Codex )
	local entryIndex = -1
	for index in pairs(sortedCodex) do
		local chapterName = sortedCodex[index]
		if chapterName == CodexStatus.SelectedChapterName then
			entryIndex = index - 1
		end
	end
	if entryIndex ~= -1 then
		local pageIndex = math.floor( entryIndex/CodexUI.MaxChapters )
		CodexStatus.ChapterOffset = 1 + pageIndex * CodexUI.MaxChapters
	end

	CodexUpdateChapters()

	screen.KeepOpen = true
	screen.AllowInput = true
	thread( HandleChapterTabInput, screen )
	thread( HandleEntryTabInput, screen )
	HandleScreenInput( screen )

end

function CodexUpdateChapters()

	local chapterSpacing = 225
	local chapterX = 480
	local chapterY = 205
	local screen = CodexUI.Screen
	local components = screen.Components
	local sortedCodex = GetSortedCodex( Codex )
	local numEntries = TableLength( sortedCodex )
	local minEntry = 1
	local maxEntry = numEntries
	if CodexStatus.ChapterOffset then
		minEntry = CodexStatus.ChapterOffset
	end

	if screen.Components.CodexSelectionLeft then
		Destroy({ Id = screen.Components.CodexSelectionLeft.Id })
	end

	if screen.Components.CodexSelectionRight then
		Destroy({ Id = screen.Components.CodexSelectionRight.Id })
	end

	if minEntry ~= 1 then
		screen.Components.CodexSelectionLeft = CreateScreenComponent({ Name = "ButtonCodexLeft", X = chapterX - CodexUI.ArrowLeftSpacerX, Y = chapterY , Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
		screen.Components.CodexSelectionLeft.OnPressedFunctionName = "CodexScrollChaptersLeft"
		screen.Components.CodexSelectionLeft.ScrollChapterName = sortedCodex[minEntry - 1]

	end

	if numEntries - minEntry >= CodexUI.MaxChapters then
		screen.Components.CodexSelectionRight = CreateScreenComponent({ Name = "ButtonCodexRight", X = chapterX + CodexUI.ArrowRightSpacerX + (CodexUI.MaxChapters - 1) * chapterSpacing, Y = chapterY, Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
		screen.Components.CodexSelectionRight.OnPressedFunctionName = "CodexScrollChaptersRight"
		maxEntry = math.min(numEntries, minEntry + CodexUI.MaxChapters - 1)
		screen.Components.CodexSelectionRight.ScrollChapterName = sortedCodex[maxEntry + 1]
	end

	Destroy({ Ids = screen.ChapterButtonIds })
	screen.ChapterButtonIds = {}
	for index = minEntry, maxEntry do
		local chapterName = sortedCodex[index]
		local chapterData = Codex[chapterName]
		components[chapterName] = CreateScreenComponent({ Name = "ButtonCodexTab", X = chapterX, Y = chapterY, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
		components[chapterName].ChapterName = chapterName
		components[chapterName].ChapterData = chapterData
		components[chapterName].ChapterXLocation = chapterX
		components[chapterName].ChapterYLocation = chapterY
		components[chapterName].OnPressedFunctionName = "CodexOpenChapter"
		table.insert( screen.ChapterButtonIds, components[chapterName].Id )
		SetAlpha({ Id = components[chapterName].Id, Fraction = 0.01})

		local textColor = unselectedColor
		local textFont = unselectedFont
		if chapterName == CodexStatus.SelectedChapterName then
			textColor = selectedColor
			textFont = selectedFont
			CodexOpenChapter( screen, components[chapterName], { FirstOpen = true })
			TeleportCursor({ OffsetX = chapterX, OffsetY = chapterY })
		end
		if chapterData.New then
			textColor = updatedUnselectedColor
		end

		local text = chapterData.TitleText
		if not HasUnlockedEntries( chapterName ) then
			text = "UknownCodexChapter"
		end
		CreateTextBox(MergeTables({
			Id = components[chapterName].Id,
			Text = text,
			FontSize = 22,
			Color = textColor,
			Font = textFont,
			ShadowBlur = 0,
			ShadowColor = {0,0,0,1},
			ShadowOffset = {3, 3},
		}, LocalizationData.CodexScripts.ChapterName ))

		chapterX = chapterX + chapterSpacing

	end
end

function CodexOpenChapter( screen, button, args )
	if not args then
		args = {}
	end
	local firstOpen = args.FirstOpen or false
	local selectLast = args.SelectLast or false

	if not IsScreenOpen( "Codex" ) then
		return
	end

	if button.ChapterName == CodexStatus.SelectedChapterName and not firstOpen then
		-- Already open
		return
	end
	CodexCloseChapter( screen, CodexStatus.SelectedChapterName, Codex[CodexStatus.SelectedChapterName] )
	CodexStatus.SelectedChapterName = button.ChapterName

	ModifyTextBox({ Id = screen.Components[button.ChapterName].Id, Color = selectedColor, Font = selectedFont })
	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU", Id = button.Id })

	local entryX = CodexUI.EntryX
	local startingEntryY = CodexUI.StartingEntryY
	local entryYSpacer = CodexUI.EntryYSpacer
	local entryY = CodexUI.EntryY

	button.EntryButtonIds = {}
	local sortedCategory = GetSortedCodexSubcategory( button.ChapterName )
	local numEntries = TableLength( sortedCategory )
	local minEntry = 1
	local maxEntry = numEntries
	if CodexStatus.EntryOffset and CodexStatus.EntryOffset[button.ChapterName] then
		minEntry = CodexStatus.EntryOffset[button.ChapterName]
	end

	if minEntry ~= 1 then
		screen.Components.CodexSelectionUp = CreateScreenComponent({ Name = "ButtonCodexUp", X = entryX, Y = startingEntryY + entryY - entryYSpacer, Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
		screen.Components.CodexSelectionUp.ChapterName = button.ChapterName
		screen.Components.CodexSelectionUp.OnPressedFunctionName = "CodexScrollChapterUp"
		table.insert( button.EntryButtonIds, screen.Components.CodexSelectionUp.Id )
	end

	if numEntries - minEntry >= CodexUI.MaxEntries then
		screen.Components.CodexSelectionDown = CreateScreenComponent({ Name = "ButtonCodexDown", X = entryX, Y = startingEntryY + entryY + (CodexUI.MaxEntries) * entryYSpacer, Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
		screen.Components.CodexSelectionDown.ChapterName = button.ChapterName
		screen.Components.CodexSelectionDown.OnPressedFunctionName = "CodexScrollChapterDown"
		table.insert( button.EntryButtonIds, screen.Components.CodexSelectionDown.Id )

		maxEntry = math.min(numEntries, minEntry + CodexUI.MaxEntries - 1)
	end

	if CodexStatus.SelectedEntryNames and CodexStatus.SelectedEntryNames[button.ChapterName] then
		local index = GetKey(sortedCategory, CodexStatus.SelectedEntryNames[button.ChapterName])
		if index ~= nil and (index < minEntry or index > maxEntry) then
			CodexStatus.SelectedEntryNames[button.ChapterName]  = nil
		end
	end

	local selectedEntryName = nil
	for i = minEntry, maxEntry do
		local entryName = sortedCategory[i]
		local entryData = button.ChapterData.Entries[entryName]
		if not entryName then
		break
		end
		screen.Components[entryName] = CreateScreenComponent({ Name = "ButtonCodexTab", X = entryX, Y = startingEntryY + entryY, Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu" })
		screen.Components[entryName].ChapterName = button.ChapterName
		screen.Components[entryName].EntryName = entryName
		screen.Components[entryName].EntryData = entryData
		screen.Components[entryName].OnPressedFunctionName = "CodexOpenEntry"
		screen.Components[entryName].Sound = "/SFX/Menu Sounds/GeneralWhooshMENU"
		screen.Components[entryName].EntryXLocation = entryX
		screen.Components[entryName].EntryYLocation = startingEntryY + entryY
		table.insert( button.EntryButtonIds, screen.Components[entryName].Id )

		SetAlpha({ Id = screen.Components[entryName].Id, Fraction = 0.01 })

		local textColor = unselectedColor
		local textFont = unselectedFont

		if entryName == CodexStatus.SelectedEntryNames[button.ChapterName] then
			entryData.New = nil
			CodexOpenEntry( screen, screen.Components[entryName] )
			textColor = selectedColor
			textFont = selectedFont
		end

		local chapterStatus = CodexStatus[button.ChapterName]
		local text = nil
		-- If one entry is unlocked, then the button is clickable
		for index, unlockPortion in pairs(entryData.Entries) do
			if text == nil and chapterStatus ~= nil and
				chapterStatus[entryName] ~= nil and
				chapterStatus[entryName][index] ~= nil and
				chapterStatus[entryName][index].Unlocked then
					text = entryName
			end
		end

		if chapterStatus == nil or chapterStatus[entryName] == nil or text == nil then
			text = "Codex_EntryLocked"
			textColor = lockedColor
			UseableOff({ Id = screen.Components[entryName].Id })
		else
			if chapterStatus[entryName].New then
				screen.Components[entryName].UnreadStarId = CreateScreenObstacle({ Name = "CodexUnreadStar", X = entryX + 10, Y = startingEntryY + entryY, Group = "Combat_Menu" })
				textColor = updatedUnselectedColor
			end
			if CodexStatus.SelectedEntryNames == nil then
				CodexStatus.SelectedEntryNames = {}
			end
			if chapterStatus[entryName][1].Unlocked and ( selectLast or ( CodexStatus.SelectedEntryNames[button.ChapterName] == nil and selectedEntryName == nil )) then
				selectedEntryName = entryName
			end
		end

		CreateTextBox(MergeTables({
			Id = screen.Components[entryName].Id,
			Text = text,
			FontSize = 20,
			Color = textColor,
			Font = textFont,
			ShadowBlur = 0,
			ShadowColor = {0,0,0,1},
			ShadowOffset = {3, 3},
			Justification = "Right"
		}, LocalizationData.CodexScripts.EntryNameText))

		entryY = entryY + entryYSpacer

	end

	if selectedEntryName then
		CodexOpenEntry( screen, screen.Components[selectedEntryName] )
		ModifyTextBox({ Id = screen.Components[selectedEntryName].Id, Color = selectedColor, Font = selectedFont })
	elseif not CodexStatus.SelectedEntryNames[button.ChapterName] then
		CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName] = sortedCategory[minEntry]
	end
	UpdateChapterEntryArrows( screen )
end

function CodexOpenEntry( screen, button )
	if not IsScreenOpen( "Codex" ) then
		return
	end

	if button.EntryName == CodexStatus.SelectedEntryNames[button.ChapterName] and screen.Components.EntryText ~= nil or not CodexStatus[button.ChapterName] or not CodexStatus[button.ChapterName][button.EntryName] then
		-- Already open
		return
	end
	CodexCloseEntry( screen, CodexStatus.SelectedEntryNames[button.ChapterName] )
	CodexStatus.SelectedEntryNames[button.ChapterName] = button.EntryName

	local chapterStatus = CodexStatus[button.ChapterName]
	chapterStatus[button.EntryName].New = false
	Destroy({ Id = screen.Components[button.EntryName].UnreadStarId })
	screen.Components[button.EntryName].UnreadStarId = nil

	ModifyTextBox({ Id = screen.Components[button.EntryName].Id, Color = selectedColor, Font = selectedFont })

	local entryTextOffsetY = 60
	if GameState.Gift[button.EntryName] == nil then
		-- no relationship bar for this entry
		entryTextOffsetY = 0
	end

	screen.Components.Image = CreateScreenComponent({ Name = "BlankObstacle", X = 670, Y = 616 + entryTextOffsetY, Scale = 1.0, Group = "Combat_Menu" })
	SetAlpha({ Id = screen.Components.Image.Id, Fraction = 1 })
	if button.EntryData.Image ~= nil then
		SetAnimation({ DestinationId = screen.Components.Image.Id, Name = button.EntryData.Image })
	end

	screen.Components.EntryTitle = CreateScreenComponent({ Name = "BlankObstacle", X = 600, Y = 285, Group = "Combat_Menu" })
	screen.Components.EntryText = CreateScreenComponent({ Name = "BlankObstacle", X = 770, Y = 370 + entryTextOffsetY, Group = "Combat_Menu" })
	CreateRelationshipBar( screen, button.EntryName )
	HandleRelationshipChanged( screen, button.ChapterName, button.EntryName )

	local text = ""
	local complete = true
	local threshold = 0
	local uniqueThresholdText = nil
	local currentUnlockAmount = GetCodexEntryAmount( button.ChapterName, button.EntryName ) or 0
	for index, unlockPortion in ipairs(button.EntryData.Entries) do
		if chapterStatus ~= nil and
			chapterStatus[button.EntryName] ~= nil and
			chapterStatus[button.EntryName][index] ~= nil then
				if chapterStatus[button.EntryName][index].Unlocked then
					text = GetDisplayName({ Text = unlockPortion.HelpTextId or unlockPortion.Text }) .. " "
					if Codex[button.ChapterName].Entries[button.EntryName].Entries[index].UnlockThreshold then
						currentUnlockAmount = currentUnlockAmount - Codex[button.ChapterName].Entries[button.EntryName].Entries[index].UnlockThreshold
					end
				elseif Codex[button.ChapterName].Entries[button.EntryName].Entries[index].UnlockGameStateRequirements and
					IsGameStateEligible( CurrentRun, Codex[button.ChapterName].Entries[button.EntryName].Entries[index].UnlockGameStateRequirements) then
						text = GetDisplayName({ Text = unlockPortion.HelpTextId or unlockPortion.Text }) .. " "
				end

		else
			-- displays next unlock threshold rather than final unlock threshold
			if Codex[button.ChapterName].Entries[button.EntryName].Entries[index].UnlockThreshold then
				threshold = Codex[button.ChapterName].Entries[button.EntryName].Entries[index].UnlockThreshold - currentUnlockAmount
				complete = false
				break
			elseif complete and Codex[button.ChapterName].Entries[button.EntryName].Entries[index].UnlockGameStateRequirements and not IsGameStateEligible( CurrentRun, Codex[button.ChapterName].Entries[button.EntryName].Entries[index].UnlockGameStateRequirements ) then
				uniqueThresholdText = Codex[button.ChapterName].Entries[button.EntryName].Entries[index].CustomUnlockText
				complete = false
			end
		end
	end

	if complete then
		text = text .. " \\n " .. GetDisplayName({Text = "Codex_Complete"})
	else
		if uniqueThresholdText then
			text = text .. " \\n " .. GetDisplayName({Text = uniqueThresholdText})
		else
			local unlockType = Codex[button.ChapterName].Entries[button.EntryName].UnlockType
			if unlockType == nil then
				unlockType = Codex[button.ChapterName].UnlockType
			end
			text = text .. " \\n " .. GetDisplayName({Text = "Codex_"..tostring(unlockType).."_Locked"})
		end
	end
	if threshold <= 0 then
		threshold = 1
	end

	CreateTextBox(MergeTables({
		Id = screen.Components.EntryText.Id,
		Text = text,
		Color = Color.CodexText,
		Font = "AlegreyaSansRegular",
		FontSize = 20,
		LuaKey = "TempTextData",
		LuaValue = { Amount = threshold, Name = button.EntryName},
		ShadowBlur = 0,
		ShadowColor = {0,0,0,1},
		ShadowOffset = {0, 2},
		Justification = "Left",
		VerticalJustification = "Top",
		Width = 820,
		LineSpacingBottom = 10,
	}, LocalizationData.CodexScripts.EntryText ))

	CreateTextBox({
		Id = screen.Components.EntryTitle.Id,
		Text = button.EntryName,
		FontSize = 38,
		Color = Color.Black,
		Font = "AlegreyaSansSCRegular",
		ShadowColor = {0,0,0,0},
		Justification = "LEFT",
	})

	UpdateChapterEntryArrows( screen )

	if button.EntryData.EntryReadVoiceLines ~= nil then
		thread( PlayVoiceLines, button.EntryData.EntryReadVoiceLines )
	end
end

function CodexCloseChapter( screen, chapterName, chapterData )

	for entryName, entryData in pairs( chapterData.Entries ) do
		if screen.Components[entryName] ~= nil then
			if screen.Components[entryName].UnreadStarId then
				Destroy({ Id = screen.Components[entryName].UnreadStarId })
				screen.Components[entryName].UnreadStarId = nil
			end
			Destroy({ Id = screen.Components[entryName].Id })
			screen.Components[entryName] = nil
		end
	end
	if screen.Components.CodexSelectionUp then
		Destroy({ Id = screen.Components.CodexSelectionUp.Id })
		screen.Components.CodexSelectionUp = nil
	end
	if screen.Components.CodexSelectionDown then
		Destroy({ Id = screen.Components.CodexSelectionDown.Id })
		screen.Components.CodexSelectionDown = nil
	end
	if screen.Components[chapterName] then
		ModifyTextBox({ Id = screen.Components[chapterName].Id, Color = unselectedColor, Font = unselectedFont })
	end
	CodexCloseEntry( screen )
end

function CodexCloseEntry( screen, entryName )

	if screen.Components.EntryText ~= nil then
		Destroy({ Id = screen.Components.EntryText.Id })
		screen.Components.EntryText = nil
	end

	if screen.Components.EntryTitle ~= nil then
		Destroy({ Id = screen.Components.EntryTitle.Id })
		screen.Components.EntryText = nil
	end

	if screen.Components.RelationshipBar ~= nil then
		Destroy({ Id = screen.Components.RelationshipBar.Id })
		screen.Components.RelationshipBar = nil
	end

	if screen.Components.RelationshipIcons then
		for i, componentId in pairs(screen.Components.RelationshipIcons) do
			Destroy({Id = componentId })
		end
		screen.Components.RelationshipIcons = nil
	end

	if screen.Components.Image ~= nil then
		Destroy({ Id = screen.Components.Image.Id })
		screen.Components.Image = nil
	end

	if entryName ~= nil and screen.Components[entryName] ~= nil then
		ModifyTextBox({ Id = screen.Components[entryName].Id, Color = unselectedColor, Font = unselectedFont })
	end

end

function CloseCodexScreen( screen, button )
	if screen == nil then
		screen = CodexUI.Screen
	end
	if not screen.AllowInput then
		return
	end

	OnScreenClosed({Flag = "Codex"})
	screen.AllowInput = false
	Destroy({ Id = CodexUI.ChapterArrowId })
	CodexUI.ChapterArrowId = nil
	Destroy({ Id = CodexUI.EntryArrowId })
	CodexUI.EntryArrowId = nil

	local destroyIds = GetAllIds( screen.Components )
	if screen.Components.RelationshipIcons then
		for i, componentId in pairs(screen.Components.RelationshipIcons) do
			table.insert(destroyIds, componentId )
		end
	end
	for _, entry in pairs(screen.Components) do
		if entry.UnreadStarId then
			table.insert(destroyIds, entry.UnreadStarId )
		end
	end
	UseableOff({ Ids = destroyIds })

	CloseScreen( destroyIds , 0.15 )

	SetAnimation({ DestinationId = screen.Components.Background.Id, Name = "CodexBackgroundOut"})

	wait( 0.125, RoomThreadName )

	DisableShopGamepadCursor()
	SetConfigOption({ Name = "GamepadCursorFreeFormSelect", Value = true })

	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	UnfreezePlayerUnit()
	ShowCombatUI()
	screen.KeepOpen = false
	notify("ChapterTabInput")
	notify("EntryTabInput")
	CodexUI.Screen = nil
end

function UpdateChapterEntryArrows( screen )
	if CodexStatus.SelectedChapterName == nil or CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName] == nil then
		return
	end

	if CodexUI.ChapterArrowId == nil then
		CodexUI.ChapterArrowId = CreateScreenObstacle({ Name = "BlankObstacle", X = -100, Y = -100, Group = "Combat_Menu" })
		SetAnimation({ DestinationId = CodexUI.ChapterArrowId, Name = "CodexChapterArrow"})
	end

	if CodexUI.EntryArrowId == nil then
		CodexUI.EntryArrowId = CreateScreenObstacle({ Name = "BlankObstacle", X = -100, Y = -100, Group = "Combat_Menu" })
		SetAnimation({ DestinationId = CodexUI.EntryArrowId, Name = "CodexEntryArrow"})
	end

	if CodexStatus.SelectedChapterName == nil then
		return
	end

	Teleport({Id = CodexUI.ChapterArrowId, OffsetX = screen.Components[CodexStatus.SelectedChapterName].ChapterXLocation, OffsetY = screen.Components[CodexStatus.SelectedChapterName].ChapterYLocation + 20})

	local entry = screen.Components[CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]]
	if entry then
		Teleport({Id = CodexUI.EntryArrowId, OffsetX = entry.EntryXLocation + 40, OffsetY = entry.EntryYLocation})
	end
end

function CodexScrollChaptersLeft( screen, button )
	if not screen or not CodexUI.Screen or not IsScreenOpen( "Codex" ) then
		return
	end

	if CodexStatus.ChapterOffset == nil then
		CodexStatus.ChapterOffset = 1
	else
		CodexStatus.ChapterOffset = CodexStatus.ChapterOffset - CodexUI.MaxChapters
	end
	CodexUpdateChapters()
	CodexOpenChapter( screen, CodexUI.Screen.Components[button.ScrollChapterName], { FirstOpen = true } )
end


function CodexScrollChaptersRight( screen, button )
	if not screen or not CodexUI.Screen or not IsScreenOpen( "Codex" ) then
		return
	end

	if CodexStatus.ChapterOffset == nil then
		CodexStatus.ChapterOffset = 1
	end
	CodexStatus.ChapterOffset = CodexStatus.ChapterOffset + CodexUI.MaxChapters
	CodexUpdateChapters()
	CodexOpenChapter( screen, CodexUI.Screen.Components[button.ScrollChapterName], { FirstOpen = true } )
end

function CodexScrollChapterUp( screen, button )
	if not screen or not CodexUI.Screen or not IsScreenOpen( "Codex" ) then
		return
	end

	if CodexStatus.EntryOffset == nil then
		CodexStatus.EntryOffset = {}
	end

	if CodexStatus.EntryOffset[button.ChapterName] == nil then
		CodexStatus.EntryOffset[button.ChapterName] = 1
	end

	CodexStatus.EntryOffset[button.ChapterName] = CodexStatus.EntryOffset[button.ChapterName] - CodexUI.MaxEntries
	CodexStatus.SelectedEntryNames[button.ChapterName] = nil
	CodexOpenChapter( screen, CodexUI.Screen.Components[button.ChapterName], { FirstOpen = true, SelectLast = true } )
end

function CodexScrollChapterDown( screen, button )
	if not screen or not CodexUI.Screen or not IsScreenOpen( "Codex" ) then
		return
	end

	if CodexStatus.EntryOffset == nil then
		CodexStatus.EntryOffset = {}
	end

	if CodexStatus.EntryOffset[button.ChapterName] == nil then
		CodexStatus.EntryOffset[button.ChapterName] = 1
	end

	CodexStatus.EntryOffset[button.ChapterName] = CodexStatus.EntryOffset[button.ChapterName] + CodexUI.MaxEntries
	CodexStatus.SelectedEntryNames[button.ChapterName] = nil
	CodexOpenChapter( screen, CodexUI.Screen.Components[button.ChapterName], { FirstOpen = true } )
end

function HandleChapterTabInput( screen )

	while screen.KeepOpen and screen.AllowInput do
		local notifyName = "ChapterTabInput"

		NotifyOnControlPressed({ Names = { "Left", "Right" }, Notify = notifyName })
		waitUntil( notifyName )
		if screen.KeepOpen and screen.AllowInput then
			local angle = 0
			local direction = NotifyResultsTable[notifyName]
			if direction == "Left" then
				angle = 180
			end
			SetConfigOption({ Name = "UseMouse", Value = false })
			local selectionIds = ShallowCopyTable( screen.ChapterButtonIds )
			if screen.Components.CodexSelectionRight ~= nil then
				table.insert( selectionIds, screen.Components.CodexSelectionRight.Id )
			end
			if screen.Components.CodexSelectionLeft ~= nil then
				table.insert( selectionIds, screen.Components.CodexSelectionLeft.Id )
			end
			CursorSelectInDirection({ Id = screen.Components[CodexStatus.SelectedChapterName].Id, DestinationIds = selectionIds, Angle = angle })
		end
		wait( 0.01, RoomThreadName )
	end

end


function HandleEntryTabInput( screen )

	while screen.KeepOpen and screen.AllowInput do
		local notifyName = "EntryTabInput"

		NotifyOnControlPressed({ Names = { "Up", "Down" }, Notify = notifyName })
		waitUntil( notifyName )
		if screen.KeepOpen and screen.AllowInput then
			local angle = 90
			local direction = NotifyResultsTable[notifyName]
			if direction == "Down" then
				angle = 270
			end
			SetConfigOption({ Name = "UseMouse", Value = false })
			local chapterButton = screen.Components[CodexStatus.SelectedChapterName]
			local currentEntryButton = screen.Components[CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]]
			if chapterButton ~= nil and currentEntryButton ~= nil then
				CursorSelectInDirection({ Id = currentEntryButton.Id, DestinationIds = chapterButton.EntryButtonIds, Angle = angle })
			else
				if direction == "Down" and screen.Components.CodexSelectionDown then
					TeleportCursor({ OffsetX = CodexUI.EntryX, OffsetY = CodexUI.StartingEntryY + CodexUI.EntryY + (CodexUI.MaxEntries) * CodexUI.EntryYSpacer })
				elseif direction == "Up" and screen.Components.CodexSelectionUp then
					TeleportCursor({ OffsetX = CodexUI.EntryX, OffsetY = CodexUI.StartingEntryY + CodexUI.EntryY - CodexUI.EntryYSpacer })
				end
			end
		end
		wait( 0.01, RoomThreadName )
	end
end

function CreateRelationshipBar( screen, entryName )
	if GameState.Gift[entryName] == nil then
		return
	end
	if screen.Components.RelationshipBar == nil then
		screen.Components.RelationshipBar = CreateScreenComponent({ Name = "BlankObstacle", X = 500, Y = 385, Group = "Combat_Menu" })
	end

	screen.Components.RelationshipIcons = {}

	local locked = false
	local iconXSpacer = CodexUI.SpacerX
	local barOffsetX = 0
	local baseOffsetX = CodexUI.BaseIconOffsetX
	local createdIds = CreateGiftTrack( { Name = entryName, LocationX = baseOffsetX + barOffsetX, LocationY = 0})

	for i, iconId in pairs(createdIds) do
		table.insert(screen.Components.RelationshipIcons, iconId )
		Attach({ Id = iconId, DestinationId = screen.Components.RelationshipBar.Id })
	end
end

function HandleRelationshipChanged( screen, chapterName, entryName )
	if GameState.Gift[entryName] == nil then
		return
	end

	local currentGiftLevel = GameState.Gift[entryName].Value
	local previousGiftLevel = CodexStatus[chapterName][entryName].LastCodexGiftLevel or 0
	if currentGiftLevel ~= previousGiftLevel then
		thread( RelationshipChangedPresentation, entryName, screen.Components.RelationshipIcons, currentGiftLevel )
	end
	CodexStatus[chapterName][entryName].LastCodexGiftLevel = GameState.Gift[entryName].Value
end

local codexHeld = false
local codexOpenAnims = { "PortraitRespawnFillHalfSec", "PortraitRespawnComplete" }
function BeginOpeningCodex()

	if not CanOpenCodex() then
		if CheckCooldown( "CanOpenCodex", 5 ) then
			thread( InCombatTextArgs, { Text = "CodexNotFoundMessage", TargetId = CurrentRun.Hero.ObjectId, SkipRise = true, SkipFlash = true, Duration = 1.25, OffsetY = -160 } )
			-- thread( PlayVoiceLines, HeroVoiceLines.InteractionBlockedVoiceLines, true )
		end
		return
	end
	if codexHeld then
		return
	end

	codexHeld = true
	local codexTicks = 0
	local codexDisplayOffsetY = -190

	ScreenAnchors.CodexDisplayId = ScreenAnchors.CodexDisplayId or SpawnObstacle({ Name = "BlankObstacle", Group = "Events", DestinationId = CurrentRun.Hero.ObjectId })
	Attach({ Id = ScreenAnchors.CodexDisplayId, DestinationId = CurrentRun.Hero.ObjectId })

	while codexHeld and CanOpenCodex() do

		codexTicks = codexTicks + 1
		if codexTicks == 1 then
			CreateAnimation({ Name = "PortraitRespawnFillHalfSec", DestinationId = ScreenAnchors.CodexDisplayId, OffsetX = 0, OffsetY = codexDisplayOffsetY, Scale = 0.5 })

			CreateTextBox({ Id = ScreenAnchors.CodexDisplayId, Text = "Codex_Opening", FontSize = 16, OffsetX = 0, OffsetY = codexDisplayOffsetY + 40, Color = Color.Gold, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center", OutlineThickness = 12, OutlineColor = {0,0,0,1} })

			PlaySound({ Name = "/Leftovers/Menu Sounds/RobesInteract", Id = ScreenAnchors.CodexDisplayId })

		elseif codexTicks == 7 then

			PlaySound({ Name = "/SFX/Menu Sounds/ObjectiveActivateShk2", Id = ScreenAnchors.CodexDisplayId })
			CreateAnimation({ Name = "PortraitRespawnComplete", DestinationId = ScreenAnchors.CodexDisplayId, Scale = 1.0, OffsetX = 0, OffsetY = codexDisplayOffsetY, Scale = 0.5 })

			wait( 0.32, RoomThreadName )
			if CanOpenCodex() then
				OpenCodexScreen()
			end

			break
		end

		if CanOpenCodex() then
			wait( 0.1, RoomThreadName )
		end
	end
	if not CanOpenCodex() then
		CancelOpeningCodex()
	end
end

function CanOpenCodex()
	if not CodexStatus.Enabled or GameState.Flags.Overlook then
		return
	end
	if not CurrentRun.Hero.IsDead then
		if CurrentRun.CurrentRoom.Encounter ~= nil and not CurrentRun.CurrentRoom.Encounter.Completed then
			return false
		end
		if CurrentRun.CurrentRoom.StartedChallengeEncounter and not CurrentRun.CurrentRoom.ChallengeEncounter.Completed then
			return false
		end
	end
	return not AreScreensActive() and IsInputAllowed({})
end

function CancelOpeningCodex()
	if codexHeld then
		codexHeld = false
		StopAnimation({ DestinationId = ScreenAnchors.CodexDisplayId, Names = codexOpenAnims, PreventChain = true })
		ModifyTextBox({ Ids = ScreenAnchors.CodexDisplayId, FadeTarget = 0.0, Duration = 0.25 })
	end
end

OnControlPressed{ "Codex",
	function( triggerArgs )
		if CodexUI.Screen and CodexUI.Screen.AllowInput then
			CloseCodexScreen(CodexUI.Screen)
			return
		end
		BeginOpeningCodex()
	end
}

OnControlReleased{ "Codex",
	function( triggerArgs )
		CancelOpeningCodex()
	end
}

function GetWeaponCodexImage( weaponName )
	if Codex.Weapons.Entries[weaponName] then
		return Codex.Weapons.Entries[weaponName].Image
	end
end

function CalcNumCodexEntiresUnlocked()
	local unlockCount = 0
	for chapterName, chapterData in pairs( Codex ) do
		for entryName, entryData in pairs( Codex[chapterName].Entries ) do
			if CodexStatus[chapterName] ~= nil and CodexStatus[chapterName][entryName] ~= nil and CodexStatus[chapterName][entryName][1] ~= nil and CodexStatus[chapterName][entryName][1].Unlocked then
				unlockCount = unlockCount + 1
			end
		end
	end
	return unlockCount
end
