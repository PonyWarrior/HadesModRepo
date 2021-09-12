--TODO :
--Upgrade system 30%
--Interface 30%
--Give boon to summon 10%
--Give commands to summon 10%
--Disable autolock on summon 0%

ModUtil.RegisterMod("TrueSummoning")

TrueSummoning.SummonUpgradeData =
{
	MegSummon =
	{
		Name = "Megaera",
		LevelUp =
		{
			Health = 50,
			DamageTakenFromPlayerMultiplier = -0.02,
		},
		LevelUnlocks =
		{
			[5] =
			{
				Weapon = "HarpyWhipWhirl"
			},
			[10] = 
			{
				Weapon = "HarpyLightning"
			},
			[15] =
			{
				Weapon = "HarpyBeam"
			},
			[20] =
			{
				Assist =
				{
					Name = "Alecto",
					Weapon = "SummonAlectoWhipShot"
				}
			},
			[25] =
			{
				Assist =
				{
					Name = "Tisiphone",
					Weapon = "SummonTisiphoneBombingRun"
				}
			},
			[30] =
			{
				Assist =
				{
					Name = "Alecto",
					Weapon = "SummonAlectoLightningChase"
				}
			}
		},
		Stats =
		{
			Health = 400,
			DamageTakenFromPlayerMultiplier = 0.5,
		},
		Weapons =
		{
			HarpyLunge =
			{
				Name = "HarpyLunge",
				DisplayName = "Lunge",
				Description = "Megaera rushes forward a medium distance, damaging all enemies in her path."
			},
			HarpyWhipWhirl =
			{
				Name = "HarpyWhipWhirl",
				DisplayName = "Whiplash",
				Description = "Megaera stands still and lashes her whip in an area around her, damaging all enemies hit."
			},
			HarpyLightning =
			{
				Name = "HarpyLightning",
				DisplayName = "Lightning Strikes",
				Description = "Megaera calls down lightning on enemies, striking in groups of 4 anywhere in the room, each lightning strike damaging all enemies in a medium area."
			},
			HarpyBeam =
			{
				Name = "HarpyBeam",
				DisplayName = "Quintuple Energy Beam",
				Description = "Megaera stands still and fires 5 continuous beams of energy spheres in front of her in a cone, each sphere that hits an enemy damages it then dissipates."
			}
		},
		AssistWeapons =
		{
			Tisiphone =
			{
				SummonTisiphoneBombingRun =
				{
					Owner = "Tisiphone",
					Name = "SummonTisiphoneBombingRun",
					DisplayName = "Desolation",
					Description = "Tisiphone flies over enemies and brings down explosions in a massive area, damaging all enemies hit."
				}
			},
			Alecto =
			{
				SummonAlectoWhipShot =
				{
					Owner = "Alecto",
					Name = "SummonAlectoWhipShot",
					DisplayName = "Spike",
					Description = "Alecto summons a spike, damaging enemies in a small area after a short duration.",
				},
				SummonAlectoLightningChase =
				{
					Owner = "Alecto",
					Name = "SummonAlectoLightningChase",
					DisplayName = "Chasing Tornado",
					Description = "Alecto summons a tornado of hate, chasing and repeatedly damaging enemies in a small area."
				}
			},
		}
	},
}

SummonMenuScreen = { Components = {} }

function TrueSummoning.InitializeSummonData()
	TrueSummoning.Data.Summons =
	{
		MegSummon =
		{
			Name = TrueSummoning.SummonUpgradeData.MegSummon.Name,
			Level = 0,
			Health = TrueSummoning.SummonUpgradeData.MegSummon.Stats.Health,
			DamageTakenFromPlayerMultiplier = TrueSummoning.SummonUpgradeData.MegSummon.Stats.DamageTakenFromPlayerMultiplier,
			Weapons = {},
			AssistWeapons = {},
			UnlockedAssists = false,
		}
	}
	table.insert(TrueSummoning.Data.Summons.MegSummon.Weapons, TrueSummoning.SummonUpgradeData.MegSummon.Weapons.HarpyLunge)
end

function TrueSummoning.LevelUp()
	if CurrentRun.CurrentRoom.Summon == nil or GameState.SpentShrinePointsCache == nil then
		return
	end

	local summon = TrueSummoning.Data.Summons[CurrentRun.CurrentRoom.Summon.Name]

	if summon.Level >= GameState.SpentShrinePointsCache then
		return
	end
	
	for _, summonData in pairs (TrueSummoning.SummonUpgradeData) do
		if summonData.Name == summon.Name then
			local lvlcount = (GameState.SpentShrinePointsCache - summon.Level)
			for i = lvlcount, 1, -1 do
				summon.Level = summon.Level + 1
				summon.Health = summon.Health + summonData.LevelUp.Health
				summon.DamageTakenFromPlayerMultiplier = summon.DamageTakenFromPlayerMultiplier + summonData.LevelUp.DamageTakenFromPlayerMultiplier

				if summonData.LevelUnlocks[summon.Level] ~= nil then
					local unlockData = summonData.LevelUnlocks[summon.Level]
					if unlockData.Weapon then
						table.insert(summon.Weapons, summonData.Weapons[unlockData.Weapon])
					end
					if unlockData.Assist then
						table.insert(summon.AssistWeapons, summonData.AssistWeapons[unlockData.Assist.Name][unlockData.Assist.Weapon])
						summon.UnlockedAssists = true
					end
				end
			end
			summon.DamageTakenFromPlayerMultiplier = Clamp(summon.DamageTakenFromPlayerMultiplier, 0, 0.5)
		end
	end
end

function TrueSummoning.MegaeraAssist()
	if IsEmpty(TrueSummoning.Data) then
		TrueSummoning.InitializeSummonData()
	end
    local summondata = EnemyData.MegSummon
    local newSummon = TrueSummoning.SetupNewSummon(summondata)

    newSummon.ObjectId = SpawnUnit({
            Name = newSummon.Name,
            Group = "Standing",
            DestinationId = CurrentRun.Hero.ObjectId, OffsetX = 0, OffsetY = 0 })
    SetupEnemyObject( newSummon, CurrentRun )

	-- local weaponName = "HarpyLunge"
	-- local upgradeData = TraitData.ZeusWeaponTrait
	-- local onFireWeapon = "DemeterAmmoWind"
	-- newSummon.OnFireWeapons = {}
	-- newSummon.OnFireWeapons[weaponName] = {}
	-- newSummon.OnFireWeapons[weaponName][onFireWeapon] = true

	-- TrueSummoning.InheritHeroTraits(CurrentRun.Hero, newSummon)
	
	CurrentRun.CurrentRoom.Summon = { Name = newSummon.Name, ObjectId = newSummon.ObjectId }
    CurrentRun.CurrentRoom.TauntTargetId = newSummon.ObjectId
end

ModUtil.Path.Wrap( "CreateLevelDisplay", function (baseFunc, newEnemy, currentRun)
	if newEnemy.Name == "MegSummon" or newEnemy.Name == "MegSupportUnit" then
		newEnemy.Outline.Id = newEnemy.ObjectId
        AddOutline( newEnemy.Outline )
	end
	return baseFunc(newEnemy, currentRun)
end)

function TrueSummoning.SetupNewSummon(summonData)
	local newSummon = DeepCopyTable(summonData)
	local newSummonData = TrueSummoning.Data.Summons[newSummon.Name]
	newSummon.AIOptions = summonData.AIOptions
    newSummon.BlocksLootInteraction = false
	newSummon.MaxHealth = newSummonData.Health
	newSummon.IncomingDamageModifiers =
	{
        {
            Name = "Innate",
            PlayerMultiplier = newSummonData.DamageTakenFromPlayerMultiplier
        }
    }
	newSummon.WeaponOptions = {}
	for _, weapon in pairs(newSummonData.Weapons) do
		table.insert(newSummon.WeaponOptions, weapon.Name)
	end

	if newSummonData.UnlockedAssists then
		newSummon.SupportAINames = {}
		newSummon.AIStages =
		{
			{
				RandomAIFunctionNames = { "AttackerAI" },
	
				AddSupportAIWeaponOptions =
				{
					Tisiphone = {},
					Alecto = {},
				},
	
				AIData =
				{
					AIEndHealthThreshold = 0.75,
				},
			}
		}
		for _, assistWeapon in pairs(newSummonData.AssistWeapons) do
			if assistWeapon.Owner == "Tisiphone" then
				table.insert(newSummon.AIStages[1].AddSupportAIWeaponOptions.Tisiphone, assistWeapon.Name)
			elseif assistWeapon.Owner == "Alecto" then
				table.insert(newSummon.AIStages[1].AddSupportAIWeaponOptions.Alecto, assistWeapon.Name)
			end
			if not Contains(newSummon.SupportAIWeaponSetOptions, assistWeapon.Owner) then
				table.insert(newSummon.SupportAIWeaponSetOptions, assistWeapon.Owner)
			end
		end
	else
		newSummon.AdditionalEnemySetupFunctionName = nil
		newSummon.SupportAIWeaponSetOptions = nil
		newSummon.SupportUnitName = nil
	end

	return newSummon
end

function TrueSummoning.InheritHeroTraits(hero, summon)
	if hero == nil or hero.Traits == nil or summon == nil then
		return
	end

	local eligibleTraits = {}
	for i, traitData in pairs(hero.Traits) do
		if traitData.AddOnDamageWeapons
		or traitData.AddOnFireWeapons
		 then
			table.insert(eligibleTraits, traitData)
		end
	end

	if eligibleTraits ~= nil then
		local weaponName = "HarpyLunge"

		for i, traitData in pairs(eligibleTraits) do
			if traitData.AddOnDamageWeapons ~= nil then
				for j, onDamageWeapon in pairs(traitData.AddOnDamageWeapons) do

					if summon.OnDamageWeapons == nil then
						summon.OnDamageWeapons = {}
					end

					if summon.OnDamageWeapons[weaponName] == nil then
						summon.OnDamageWeapons[weaponName] = {}
					end

					summon.OnDamageWeapons[weaponName][onDamageWeapon] = traitData.OnDamageWeaponProperties or true
					DebugPrint({Text = "Inherited "..onDamageWeapon})
				end
			end

			-- if traitData.AddOnFireWeapons ~= nil then
			-- 	for j, onFireWeapon in pairs(traitData.AddOnFireWeapons) do
			-- 		if summon.OnFireWeapons == nil then
			-- 			summon.OnFireWeapons = {}
			-- 		end

			-- 		if summon.OnFireWeapons[weaponName] == nil then
			-- 			summon.OnFireWeapons[weaponName] = {}
			-- 		end

			-- 		if not summon.OnFireWeapons[weaponName][onFireWeapon] then
			-- 			if traitData.AddOnFireWeaponArgs then
			-- 				summon.OnFireWeapons[weaponName][onFireWeapon] = DeepCopyTable( traitData.AddOnFireWeaponArgs )
			-- 			else
			-- 				summon.OnFireWeapons[weaponName][onFireWeapon] = true
			-- 			end
			-- 		end

			-- 		-- summon.OnFireWeapons[weaponName][onFireWeapon] = traitData.OnFireWeaponProperties or true
			-- 		DebugPrint({Text = "Inherited "..onFireWeapon})
			-- 	end

			-- end
		end
	end

end

function TrueSummoning.SelectSupportAIs(summon, currentRun)
	summon.SupportAINames = summon.SupportAINames or {}

	for _, supportAIName in pairs(summon.SupportAIWeaponSetOptions) do
		table.insert(summon.SupportAINames, supportAIName)
		currentRun.SupportAINames[supportAIName] = true
	end
end

function GetTargetId( enemy, aiData )
	aiData = aiData or enemy
	local targetId = CurrentRun.Hero.ObjectId
	if aiData.AnchorTargetIdOnPlayer and aiData.AnchorTargetId == nil then
		aiData.AnchorTargetId = SpawnObstacle({ Name = "BlankObstacle", DestinationId = CurrentRun.Hero.ObjectId, Group = "Scripting" })
	end

	if aiData.TargetSelf then
		targetId = enemy.ObjectId

	elseif aiData.TargetId then
		targetId = aiData.TargetId

	elseif aiData.TargetComboPartner then
		targetId = enemy.ComboPartnerId

	elseif aiData.CreateOwnTarget then
		local offsetAngle = 0
		if aiData.RandomTargetAngle then
			offsetAngle = RandomFloat(0, 360)
		elseif aiData.TargetAngleOptions ~= nil then
			offsetAngle = GetRandomValue( aiData.TargetAngleOptions )
		end
		local offsetDistance = aiData.TargetOffsetDistance
		if aiData.TargetOffsetDistanceMin ~= nil and aiData.TargetOffsetDistanceMax ~= nil then
			offsetDistance = RandomFloat(aiData.TargetOffsetDistanceMin, aiData.TargetOffsetDistanceMax)
		end
		local offset = CalcOffset(math.rad(offsetAngle), offsetDistance)
		if aiData.OffsetDistanceScaleY ~= nil then
			offset.Y = offset.Y * aiData.OffsetDistanceScaleY
		end
		local newTargetId = SpawnObstacle({ Name = "BlankObstacle", DestinationId = aiData.AnchorTargetId or enemy.ObjectId, Group = "Scripting", OffsetX = offset.X, OffsetY = offset.Y })
		targetId = newTargetId

	elseif aiData.TargetFriends or IsCharmed({ Id = enemy.ObjectId }) then
		targetId = nil
		local eligibleIds = {}
		for enemyId, requiredKillEnemy in pairs( RequiredKillEnemies ) do
			if requiredKillEnemy ~= enemy then
				if aiData.IgnoreSelfType and requiredKillEnemy.Name == enemy.Name then
					--DebugPrint({ Text = "INGORE" })
				elseif aiData.IgnoreTypes ~= nil and Contains(aiData.IgnoreTypes, requiredKillEnemy.Name) then
					--DebugPrint({ Text = "INGORE" })
				elseif aiData.IngoreCursedByThanatos and HasEffect({ Id = requiredKillEnemy.ObjectId, EffectName = "ThanatosCurse" }) then
					--DebugPrint({ Text = "INGORE" })
				elseif aiData.IgnoreInvulnerable and IsInvulnerable({ Id = requiredKillEnemy.ObjectId }) then
					--DebugPrint({ Text = "INGORE" })
				elseif requiredKillEnemy.InSky then
					--DebugPrint({ Text = "INGORE" })
				elseif not requiredKillEnemy.ActivationFinished then
					--DebugPrint({ Text = "INGORE" })
				elseif aiData.TargetWeak then
					if requiredKillEnemy.Health / requiredKillEnemy.MaxHealth < 1.0 then
						table.insert(eligibleIds, enemyId)
					end
				else
					table.insert(eligibleIds, enemyId)
				end
			end
		end
		if aiData.TargetClosest then
			targetId = GetClosest({ Id = enemy.ObjectId, DestinationIds = eligibleIds, Distance = 1500, IgnoreHomingIneligible = true, IgnoreSelf = true })
		elseif aiData.TargetClosestToPlayer then
			targetId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationIds = eligibleIds, Distance = 1500, IgnoreHomingIneligible = true, IgnoreSelf = true })
		elseif aiData.TargetName ~= nil then
			local ids = GetIdsByType({ Name = aiData.TargetName })
			targetId = GetRandomValue(ids)
		else
			targetId = GetRandomValue(eligibleIds)
		end

		if aiData.TargetPlayerIfNoFriends and targetId == nil then
			targetId = CurrentRun.Hero.ObjectId
		end

	elseif aiData.TargetSpawnPoints then
		targetId = SelectSpawnPoint(CurrentRun.CurrentRoom, { Name = enemy.Name }, { SpawnNearId = CurrentRun.Hero.ObjectId, SpawnRadius = aiData.TargetSpawnPointsPlayerRadius or 1000, SpawnRadiusMin = aiData.TargetSpawnPointsPlayerRadiusMin } )

	elseif aiData.TargetName ~= nil then
		local ids = GetIdsByType({ Name = aiData.TargetName })
		targetId = GetRandomValue(ids)
	elseif CurrentRun.CurrentRoom.TauntTargetId then
        --mod start
		local rng = math.random(1, 3)
		if rng == 1 then
            -- DebugPrint({Text="Targetting Megaera"})
			targetId = CurrentRun.CurrentRoom.TauntTargetId
        elseif rng == 2 then
            -- DebugPrint({Text="Targetting Zagreus"})
			targetId = CurrentRun.Hero.ObjectId
        else
            -- DebugPrint({Text="Targetting Closest"})
            local eligibleIds = {CurrentRun.CurrentRoom.TauntTargetId, CurrentRun.Hero.ObjectId}
            targetId = GetClosest({ Id = enemy.ObjectId, DestinationIds = eligibleIds, Distance = 1500, IgnoreHomingIneligible = true, IgnoreSelf = true })
		end
        --mod end
	elseif targetId == CurrentRun.Hero.ObjectId and CurrentRun.Hero.Invisible and CurrentRun.CurrentRoom.InvisTargetId then
		targetId = CurrentRun.CurrentRoom.InvisTargetId

		if aiData.CancelIfInvisTarget then
			targetId = nil
		end
	end

	if aiData.CreateOwnTargetFromOriginalTarget then
		local offsetAngle = 0
		if aiData.RandomTargetAngle then
			offsetAngle = RandomFloat(0, 360)
		elseif aiData.TargetAngleOptions ~= nil then
			offsetAngle = GetRandomValue( aiData.TargetAngleOptions )
		end
		local offsetDistance = aiData.TargetOffsetDistance
		if aiData.TargetOffsetDistanceMin ~= nil and aiData.TargetOffsetDistanceMax ~= nil then
			offsetDistance = RandomFloat(aiData.TargetOffsetDistanceMin, aiData.TargetOffsetDistanceMax)
		end
		local offset = CalcOffset(math.rad(offsetAngle), offsetDistance)
		local newTargetId = SpawnObstacle({ Name = "BlankObstacle", DestinationId = aiData.AnchorTargetId or targetId, Group = "Scripting", OffsetX = offset.X, OffsetY = offset.Y })
		targetId = newTargetId
	end

	--mod start
	if enemy.ObjectId == CurrentRun.CurrentRoom.TauntTargetId or enemy.SupportUnitName ~= nil then
		DebugPrint({Text = enemy.Name or enemy.SupportUnitName})
		local eligibleIds = {}
		for enemyId, requiredKillEnemy in pairs( RequiredKillEnemies ) do
			if requiredKillEnemy ~= enemy and requiredKillEnemy.StoredAmmo ~= nil and not IsInvulnerable({ Id = requiredKillEnemy.ObjectId }) then
				table.insert(eligibleIds, enemyId)
			end
		end
		if not IsEmpty(eligibleIds) then
			targetId = GetClosest({ Id = enemy.ObjectId, DestinationIds = eligibleIds, Distance = 1500, IgnoreHomingIneligible = true, IgnoreSelf = true, IgnoreInvulnerable = true })
		end
	end
	--mod end

	if aiData.AnchorTargetIdAfterFirstTick and aiData.AnchorTargetId == nil then
		aiData.AnchorTargetId = targetId
	end

	return targetId
end

OnControlPressed{ "Assist",
	function( triggerArgs )

		if not IsEmpty( ActiveScreens ) or CurrentRun.CurrentRoom.TauntTargetId == nil then
			return
		end

		Move({ Id = CurrentRun.CurrentRoom.TauntTargetId, DestinationId = CurrentRun.Hero.ObjectId, Mode = "Precise" })
	end
}

table.insert(DeathLoopData.DeathAreaBedroom.UnthreadedEvents,
{
    FunctionName = "TrueSummoning.SpawnAltar"
})

function TrueSummoning.SpawnAltar()
    local unlocked = true
    if unlocked then
        CurrentRun.CurrentRoom.BlockKeepsakeMenu = true
        local altar = DeepCopyTable( ObstacleData.GiftRack )
        altar.ObjectId = SpawnObstacle({ Name = "GiftRack", Group = "FX_Terrain", DestinationId = CurrentRun.Hero.ObjectId, AttachedTable = altar, OffsetX = 1350, OffsetY = 350 })
		SetScale({ Id = altar.ObjectId, Fraction = 0.1 })
        SetupObstacle( altar )
        AddToGroup({Id = altar.ObjectId, Name = "TrueSummoning.Altar"})
    end
end

OnUsed{ "TrueSummoning.Altar", function()
    TrueSummoning.OpenSummonMenu()
end}

function TrueSummoning.OpenSummonMenu()
	ScreenAnchors.SummonMenuScreen = DeepCopyTable(SummonMenuScreen)
	local screen = ScreenAnchors.SummonMenuScreen
	local components = screen.Components
	local title = "Altar of Summoning"
	screen.Name = "SummonMenuScreen"
	OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
	SetConfigOption({ Name = "UseOcclusion", Value = false })
	FreezePlayerUnit()
	EnableShopGamepadCursor()
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })

	if TrueSummoning.Data == nil or IsEmpty(TrueSummoning.Data) then
		TrueSummoning.InitializeSummonData()
	end
	--Background
	components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "SummonMenu" })
	components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "SummonMenu" })
	SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
	SetColor({ Id = components.BackgroundDim.Id, Color = { 69, 69, 69, 255 } })
	--Title
	CreateTextBox({ Id = components.Background.Id, Text = title, FontSize = 34,
	OffsetX = 0, OffsetY = -500, Color = Color.White, Font = "SpectralSCLight",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
	--Close button
	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.6, Group = "SummonMenu" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = -50, OffsetY = 500 })
	components.CloseButton.OnPressedFunctionName = "TrueSummoning.CloseSummonMenu"
	components.CloseButton.ControlHotkey = "Cancel"
	--Display
		local summonData = TrueSummoning.Data.Summons.MegSummon
		components.SummonPortrait = CreateScreenComponent({ Name = "BlankObstacle", Group = "SummonMenu" })
		Attach({Id = components.SummonPortrait.Id, DestinationId = components.Background.Id, OffsetX = -500, OffsetY = 100})
		SetAnimation({DestinationId = components.SummonPortrait.Id, Name = "Portrait_FurySister01_Default_01", Scale = 0.7})

		CreateTextBox({ Id = components.SummonPortrait.Id, Text = "Harpy",
		Font = "CaesarDressing", FontSize = 22, ShadowRed = 0, ShadowBlue = 0, ShadowGreen = 0,
		OutlineColor = {0, 0, 0, 1}, OutlineThickness = 2,
		ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 3, ShadowOffsetX = 0, Justification = "Center", OffsetY = -400,})

		CreateTextBox({ Id = components.Background.Id, Text = "Statistics", FontSize = 24,
		OffsetX = 400, OffsetY = -420, Color = Color.White, Font = "SpectralSCLight", Justification = "Center" })

		CreateTextBox({ Id = components.Background.Id, Text = "Level : "..summonData.Level, FontSize = 21,
		OffsetX = 0, OffsetY = -380, Color = Color.White, Font = "AlegreyaSansSCRegular", Justification = "Left" })

		CreateTextBox({ Id = components.Background.Id, Text = "Health : "..summonData.Health, FontSize = 21,
		OffsetX = 0, OffsetY = -350, Color = Color.White, Font = "AlegreyaSansSCRegular", Justification = "Left" })

		CreateTextBox({ Id = components.Background.Id, Text = "Damage received from Zagreus : "..(summonData.DamageTakenFromPlayerMultiplier * 100).."%", FontSize = 21,
		OffsetX = 0, OffsetY = -320, Color = Color.White, Font = "AlegreyaSansSCRegular", Justification = "Left" })

		CreateTextBox({ Id = components.Background.Id, Text = "Techniques", FontSize = 24,
		OffsetX = 400, OffsetY = -240, Color = Color.White, Font = "SpectralSCLight", Justification = "Center" })

		local index = 0
		local offsetY
		local techniques = {}
		for _, weapon in pairs(summonData.Weapons) do
			table.insert(techniques, weapon)
		end
		for _, assistWeapon in pairs(summonData.AssistWeapons) do
			table.insert(techniques, assistWeapon)
		end
		for _, technique in pairs(techniques) do
			local incrementY = 40
			offsetY = -200 + (index * 110)
			index = index + 1

			CreateTextBox({ Id = components.Background.Id, Text = technique.DisplayName, FontSize = 21,
			OffsetX = 0, OffsetY = offsetY, Color = Color.White, Font = "AlegreyaSansSCRegular", Justification = "Left" })

			CreateTextBox({ Id = components.Background.Id, Text = technique.Description, FontSize = 19,
			OffsetX = 0, OffsetY = offsetY + incrementY, Color = Color.White, Font = "AlegreyaSansSCRegular", Justification = "Left", Width = 900 })
		end

	--End
	screen.KeepOpen = true
	thread(HandleWASDInput, screen)
	HandleScreenInput(screen)
end

function TrueSummoning.CloseSummonMenu(screen, button)
	DisableShopGamepadCursor()
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
	SetConfigOption({ Name = "UseOcclusion", Value = true })
	CloseScreen(GetAllIds(screen.Components), 0.1)
	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	ScreenAnchors.SummonMenuScreen = nil
	UnfreezePlayerUnit()
	screen.KeepOpen = false
	OnScreenClosed({ Flag = screen.Name })
  end