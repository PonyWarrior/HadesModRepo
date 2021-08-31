ModUtil.RegisterMod("TrueSummoning")

SaveIgnores["TrueSummoning"] = true

function TrueSummoning.MegaeraAssist()
    local summondata = EnemyData.MegSummon
    local newSummon = DeepCopyTable( summondata )
    newSummon.AIOptions = summondata.AIOptions
    newSummon.BlocksLootInteraction = false
    newSummon.ObjectId = SpawnUnit({
            Name = summondata.Name,
            Group = "Standing",
            DestinationId = CurrentRun.Hero.ObjectId, OffsetX = 0, OffsetY = 0 })
    SetupEnemyObject( newSummon, CurrentRun )

    CurrentRun.CurrentRoom.TauntTargetId = newSummon.ObjectId
end

function TrueSummoning.SelectSupportAIs(summon, currentRun)
    local debug = true
	summon.SupportAINames = summon.SupportAINames or {}

	if debug then
		local supportCount = 2
		for i=1, supportCount, 1 do
			local supportAIName = RemoveRandomValue(summon.SupportAIWeaponSetOptions)
			table.insert(summon.SupportAINames, supportAIName)
			currentRun.SupportAINames[supportAIName] = true
		end
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

	if aiData.AnchorTargetIdAfterFirstTick and aiData.AnchorTargetId == nil then
		aiData.AnchorTargetId = targetId
	end

	return targetId
end