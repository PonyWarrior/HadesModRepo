OnAnyLoad{
	function (triggerArgs)
		-- Instance limit certain presentation functions
		CombatPresentationCaps = {
			-- Experimental number to wait() in presentation functions after creating an animation
			CreateAnimationMagicWaitTime = 0.6,
			GeneralCap = 20,
			DoImpactSound = 5,
			DisplayDamageText = ConstantsData.MaxActiveEnemyCount,
			ProfilingHistogram = {}
		}

		CombatPresentationDeferredHealthBars = {}
	end
}

function DeferredCombatPresentation()
	thread(function (list)
		for index, args in pairs(list) do
			UpdateHealthBarReal( args )
		end
	end, CombatPresentationDeferredHealthBars)
	CombatPresentationDeferredHealthBars = {}
end

function CanStartBudgetedPresentation( name )
	if name == nil or CombatPresentationCaps[name] == nil then
		if CombatPresentationCaps["GeneralCap"] > 0 then
			CombatPresentationCaps["GeneralCap"] = CombatPresentationCaps["GeneralCap"] - 1
			CombatPresentationCaps.ProfilingHistogram[name] = (CombatPresentationCaps.ProfilingHistogram[name] or 0) + 1
			return true
		else
			--DebugAssert({ Condition = false, Text = "Over CombatPresentation budget for "..tostring(name).."!" }) -- Profiling
			return false
		end
	elseif CombatPresentationCaps[name] > 0 then
		CombatPresentationCaps[name] = CombatPresentationCaps[name] - 1
		CombatPresentationCaps.ProfilingHistogram[name] = (CombatPresentationCaps.ProfilingHistogram[name] or 0) + 1 -- debug
		return true
	else
		--DebugAssert({ Condition = false, Text = "Over CombatPresentation budget for "..tostring(name).."!" }) -- Profiling
		return false
	end
end

function ExitBudgetedPresentation( name )
	if name == nil or CombatPresentationCaps[name] == nil then
		CombatPresentationCaps["GeneralCap"] = CombatPresentationCaps["GeneralCap"] + 1
	else
		CombatPresentationCaps[name] = CombatPresentationCaps[name] + 1
	end
	CombatPresentationCaps.ProfilingHistogram[name] = (CombatPresentationCaps.ProfilingHistogram[name] or 1) - 1 -- Profiling
end

function GetNumBossHealthBars()
	local bars = 0
	for enemyId, enemy in pairs( ActiveEnemies ) do
		if enemy.UseBossHealthBar then
			bars = bars + 1
		end
	end
	return bars
end

function CreateHealthBar( newEnemy )

	if newEnemy == nil then
		return
	end
	if newEnemy.HideHealthBar or newEnemy.HasHealthBar then
		return
	end
	if not ConfigOptionCache.ShowUIAnimations then
		return
	end

	if newEnemy.UseBossHealthBar then
		if not newEnemy.HasHealthBar then
			CreateBossHealthBar( newEnemy )
		end
		return
	end

	newEnemy.HasHealthBar = true

	local offsetY = -155
	if newEnemy.Scale ~= nil then
		offsetY = offsetY * newEnemy.Scale
	end
	if newEnemy.HealthBarOffsetY then
		offsetY = newEnemy.HealthBarOffsetY
	end

	local backingId = SpawnObstacle({ Name = "EnemyHealthBar", Group = "Combat_UI_World_Backing", DestinationId = newEnemy.ObjectId, Attach = true, OffsetY = offsetY, TriggerOnSpawn = false })
	EnemyHealthDisplayAnchors[newEnemy.ObjectId.."back"] = backingId

	if newEnemy.HealthBuffer and newEnemy.HealthBuffer > 0 then
		SetAnimation({ DestinationId = backingId, Name = "EnemyHealthBarArmor" })
	else
		SetAnimation({ DestinationId = backingId, Name = "EnemyHealthBar" })
	end


	-- falloff  health bar
	local backingScreenId = SpawnObstacle({ Name = "EnemyHealthBarFillSlow", Group = "Combat_UI_World_Backing", DestinationId = newEnemy.ObjectId, Attach = true, OffsetY = offsetY, TriggerOnSpawn = false })
	EnemyHealthDisplayAnchors[newEnemy.ObjectId.."falloff"] = backingScreenId
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillSlow", Fraction = 0, DestinationId = backingScreenId })
	SetColor({ Id = backingScreenId, Color = Color.HealthFalloff })

	-- red health bar
	local screenId = SpawnObstacle({ Name = "EnemyHealthBarFill", Group = "Combat_UI_World", DestinationId = newEnemy.ObjectId, Attach = true, OffsetY = offsetY, TriggerOnSpawn = false })
	EnemyHealthDisplayAnchors[newEnemy.ObjectId] = screenId

	local maxHealth = newEnemy.MaxHealth
	if newEnemy.HealthBuffer and newEnemy.HealthBuffer > 0 then
		newEnemy.MaxHealthBuffer = newEnemy.HealthBuffer
	end

	newEnemy.DisplayedHealthFraction = 1

	if newEnemy.HealthBarScale ~= nil then
		newEnemy.BarXScale = newEnemy.HealthBarScale
	elseif newEnemy.HealthBarType ~= nil then
		if newEnemy.HealthBarType == "Small" then
			newEnemy.BarXScale = CombatUI.SmallHealthBarScale
		elseif newEnemy.HealthBarType == "Medium" then
			newEnemy.BarXScale = CombatUI.MediumHealthBarScale
		elseif newEnemy.HealthBarType == "MediumLarge" then
			newEnemy.BarXScale = CombatUI.MediumLargeHealthBarScale
		elseif newEnemy.HealthBarType == "ExtraLarge" then
			newEnemy.BarXScale = CombatUI.ExtraLargeHealthBarScale
		else
			newEnemy.BarXScale = CombatUI.LargeHealthBarScale
		end
	elseif maxHealth ~= nil then
		if maxHealth <= CombatUI.SmallHeathBarThreshold then
			newEnemy.BarXScale = CombatUI.SmallHealthBarScale
		elseif maxHealth <= CombatUI.MediumHealthBarThreshold then
			newEnemy.BarXScale = CombatUI.MediumHealthBarScale
		elseif maxHealth <= CombatUI.MediumLargeHealthBarThreshold then
			newEnemy.BarXScale = CombatUI.MediumLargeHealthBarScale
		else
			newEnemy.BarXScale = CombatUI.LargeHealthBarScale
		end
	end

	local healthBarLength = newEnemy.BarXScale * 98

	if newEnemy.EliteIcon then
		if newEnemy.EliteAttributes ~= nil and not IsEmpty(newEnemy.EliteAttributes) then
			local attributeCount = 0
			for k, attributeName in pairs(newEnemy.EliteAttributes) do
				attributeCount = attributeCount + 1
				local attributeBadgeId = EnemyHealthDisplayAnchors[newEnemy.ObjectId.."elitebadge"..attributeName]
				if attributeBadgeId ~= nil then
					Destroy({ Id = attributeBadgeId })
				end
				attributeBadgeId = SpawnObstacle({ Name = "HealthElite", Group = "Combat_UI_World_Backing", TriggerOnSpawn = false })
				Attach({ Id = attributeBadgeId, DestinationId = screenId, OffsetX = -1 * healthBarLength/2 - 20 - (35 * (attributeCount - 1)), OffsetY = 0})
				local iconName = "EliteAttribute"..attributeName
				SetAnimation({ DestinationId = attributeBadgeId, Name = iconName })
				EnemyHealthDisplayAnchors[newEnemy.ObjectId.."elitebadge"..attributeName] = attributeBadgeId
			end
		else
			local eliteBadgeId = EnemyHealthDisplayAnchors[newEnemy.ObjectId.."elitebadge"]
			if eliteBadgeId ~= nil then
				Destroy({ Id = eliteBadgeId })
			end
			eliteBadgeId = SpawnObstacle({ Name = "HealthElite", Group = "Combat_UI_World_Backing", TriggerOnSpawn = false })
			Attach({ Id = eliteBadgeId, DestinationId = screenId, OffsetX = -1 * healthBarLength/2 - 20, OffsetY = 0})
			EnemyHealthDisplayAnchors[newEnemy.ObjectId.."elitebadge"] = eliteBadgeId
		end
	end

	--[[if newEnemy.EliteAttributes ~= nil then
		local attributeString = ""
		for k, attributeName in pairs(newEnemy.EliteAttributes) do
			attributeString = attributeString..attributeName.." "
		end
		local eliteAttributesLabelId = EnemyHealthDisplayAnchors[newEnemy.ObjectId.."attributes"]
		if eliteAttributesLabelId ~= nil then
			Destroy({ Id = eliteAttributesLabelId })
		end

		CreateTextBox({ Id = EnemyHealthDisplayAnchors[newEnemy.ObjectId], Text = attributeString,
			Font = "AlegreyaSansSCBold", FontSize = 20, ShadowRed = 0, ShadowBlue = 0, ShadowGreen = 0,
			OutlineColor = {0, 0, 0, 1}, OutlineThickness = 2,
			ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 3, ShadowOffsetX = 0, Justification = "Center", OffsetY = -23,
			OpacityWithOwner = true,
			AutoSetDataProperties = true,
			})
	end]]

	EnemyHealthDisplayAnchors[newEnemy.ObjectId.."scale"] = newEnemy.BarXScale
	SetScaleX({ Ids = { backingScreenId, screenId, backingId }, Fraction = newEnemy.BarXScale })

	UpdateHealthBarIcons( newEnemy )
end

function UpdatePoisonEffectStacks( args )
	local stacks = args.Stacks
	local unitId = args.triggeredById
	local unit = args.TriggeredByTable
	local startIconScale = 1.3

	local poisonColorA = { 121, 22, 243, 255 }
	local poisonColorB = { 255, 255, 255, 255 }
	local poisonStatusFontColor = Color.Lerp(poisonColorB, poisonColorA, (5 - stacks) / 5)

	if not EnemyHealthDisplayAnchors[unitId] then
		CreateHealthBar( unit )
		UpdateHealthBar( unit, 0, { Force = true })
	end

	if not EnemyHealthDisplayAnchors[ unitId .. "poisonstatus" ] then

		local backingId = nil
		local scale = 1
		if unit.BarXScale then
			scale = unit.BarXScale
		end
		if unit and unit.UseBossHealthBar then
			backingId = CreateScreenObstacle({ Name = "PoisonSmall", Group = "Combat_UI_Menu", DestinationId = EnemyHealthDisplayAnchors[unitId] })
			startIconScale = 1.3
			CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 17, OffsetY = 0,
				Font = "AlegreyaSansSCExtraBold",
				Justification = "Left",
				ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
				OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
			})
		else
			backingId = SpawnObstacle({ Name = "PoisonSmall", Group = "Combat_UI_World", DestinationId = unitId, TriggerOnSpawn = false })
			CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 14, OffsetY = 0,
				Font = "AlegreyaSansSCExtraBold",
				Justification = "Left",
				ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
				OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
			})
		end
		EnemyHealthDisplayAnchors[ unitId .. "poisonstatus" ] = backingId
	end

	local scaleTarget = 1.0

	SetScale({ Id = EnemyHealthDisplayAnchors[ unitId .. "poisonstatus" ], Fraction = startIconScale })
	ModifyTextBox({ Id = EnemyHealthDisplayAnchors[ unitId .. "poisonstatus" ], Text = tostring( stacks ), ScaleTarget = scaleTarget, Color = poisonStatusFontColor })
	PositionEffectStacks( unitId )
end

function ClearPoisonEffectStacks( args )
	Destroy({ Id = EnemyHealthDisplayAnchors[ args.triggeredById .. "poisonstatus" ] })
	EnemyHealthDisplayAnchors[ args.triggeredById .. "poisonstatus" ] = nil
	PositionEffectStacks( args.triggeredById )
end

function UpdateChillEffectStacks( unit, unitId, stacks )
	if not EnemyHealthDisplayAnchors[unitId] then
		CreateHealthBar( unit )
		UpdateHealthBar( unit, 0, { Force = true })
	end

	local startIconScale = 1
	local freezeColorA = {61, 118, 184, 255}
	local freezeColorB = {75, 234, 255, 255}
	local freezeColorC = {255, 255, 255, 255}
	local freezeStatusFontColor = Color.Lerp(freezeColorB, freezeColorA, (5 - stacks) / 5)

	local scaleTarget = 1
	if stacks >= 5 then
		freezeStatusFontColor = Color.Lerp(freezeColorC, freezeColorB, (10 - stacks) / 5)
	end

	if not EnemyHealthDisplayAnchors[ unitId .. "freezestatus" ] then

		local backingId = nil
		local scale = 1
		if unit.BarXScale then
			scale = unit.BarXScale
		end

		if unit and unit.UseBossHealthBar then
			backingId = CreateScreenObstacle({ Name = "ChillSmall", Group = "Combat_UI_Menu", DestinationId = EnemyHealthDisplayAnchors[unitId] })
			startIconScale = 1.5
			CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 17, OffsetY = 0,
				Font = "AlegreyaSansSCExtraBold",
				Color = freezeStatusFontColor,
				Justification = "Left",
				ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
				OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
			})
		else
			backingId = SpawnObstacle({ Name = "ChillSmall", Group = "Combat_UI_World", DestinationId = unitId, TriggerOnSpawn = false })
			CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 14, OffsetY = 0,
				Font = "AlegreyaSansSCExtraBold",
				Color = freezeStatusFontColor,
				Justification = "Left",
				ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
				OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
			})
		end
		EnemyHealthDisplayAnchors[ unitId .. "freezestatus" ] = backingId
	end


	SetScale({ Id = EnemyHealthDisplayAnchors[ unitId .. "freezestatus" ], Fraction = startIconScale })
	ModifyTextBox({ Id = EnemyHealthDisplayAnchors[ unitId .. "freezestatus" ], Text = tostring( stacks ), ScaleTarget = scaleTarget, Color = freezeStatusFontColor})
	PositionEffectStacks( unitId )
end
function ClearChillEffectStacks( id )
	Destroy({ Id = EnemyHealthDisplayAnchors[ id .. "freezestatus" ] })
	EnemyHealthDisplayAnchors[ id .. "freezestatus" ] = nil
	PositionEffectStacks( id )
end

function PositionEffectStacks( id )
	local unit = ActiveEnemies[id]
	if not EnemyHealthDisplayAnchors[id] or not unit then
		return
	end

	local effects = {}
	if EnemyHealthDisplayAnchors[ id .. "freezestatus" ] then
		table.insert( effects, EnemyHealthDisplayAnchors[ id .. "freezestatus" ])
	end
	if EnemyHealthDisplayAnchors[ id .. "poisonstatus" ] then
		table.insert( effects, EnemyHealthDisplayAnchors[ id .. "poisonstatus" ])
	end

	local spacing = 27
	if unit.UseBossHealthBar then
		spacing = 60
	end
	local width = (TableLength( effects ) - 1) * spacing
	local scale = unit.BarXScale or 1

	for i, effectId in pairs( effects ) do
		if unit.UseBossHealthBar then
			Attach({ Id = effectId, DestinationId = EnemyHealthDisplayAnchors[id], OffsetY = 25, OffsetX = ((i - 1) * spacing - width/2) })
		else
			Attach({ Id = effectId, DestinationId = EnemyHealthDisplayAnchors[id], OffsetY = 20, OffsetX = ((i - 1) * spacing - width/2) * scale })
		end
	end
end
function PoseidonLegendaryPresentation( triggerArgs )
	PlaySound({ Name = "/SFX/Player Sounds/PoseidonWaterImpactDetonate", Id = triggerArgs.triggeredById })
	CreateAnimation({ Name = "PoseidonDoubleCollisionFx", DestinationId = triggerArgs.triggeredById })
end

function AddVulnerabilityIndicator( unit )
	if EnemyHealthDisplayAnchors[unit.ObjectId.."vulnerabilityIndicator"] ~= nil or GetNumMetaUpgrades("VulnerabilityEffectBonusMetaUpgrade") == 0 then
		return
	end

	local offsetX = 0
	local offsetY = 0
	if unit.UseBossHealthBar then
		offsetX = 360
		if unit.BarXScale then
			offsetX = offsetX * unit.BarXScale
		end
		offsetY = 0
		EnemyHealthDisplayAnchors[unit.ObjectId.."vulnerabilityIndicator"] = CreateScreenObstacle({ Name = "HealthbarVulnerability", Group = "Combat_UI_Menu", DestinationId = EnemyHealthDisplayAnchors[unit.ObjectId] })
		Attach({ Id = EnemyHealthDisplayAnchors[unit.ObjectId.."vulnerabilityIndicator"], DestinationId = EnemyHealthDisplayAnchors[unit.ObjectId], OffsetX = offsetX, OffsetY = offsetY })

	elseif EnemyHealthDisplayAnchors[unit.ObjectId] then
		local barScale = unit.BarXScale or 1
		offsetX = barScale * 98 /2 + 25
		offsetY = 3
		EnemyHealthDisplayAnchors[unit.ObjectId.."vulnerabilityIndicator"] = SpawnObstacle({ Name = "HealthbarVulnerability", Group = "Combat_UI_World", DestinationId = EnemyHealthDisplayAnchors[unit.ObjectId] })
		Attach({ Id = EnemyHealthDisplayAnchors[unit.ObjectId.."vulnerabilityIndicator"], DestinationId = EnemyHealthDisplayAnchors[unit.ObjectId], OffsetX = offsetX, OffsetY = offsetY })
	end
end

function RemoveVulnerabilityIndicator( unit )
	if EnemyHealthDisplayAnchors[unit.ObjectId.."vulnerabilityIndicator"] == nil then
		return
	end
	Destroy({ Id = EnemyHealthDisplayAnchors[unit.ObjectId.."vulnerabilityIndicator"] })
	EnemyHealthDisplayAnchors[unit.ObjectId.."vulnerabilityIndicator"] = nil
end

function AddStoredAmmoIcon( storeInUnit )
	if EnemyHealthDisplayAnchors[storeInUnit.ObjectId] == nil then
		return
	end

	EnemyHealthDisplayAnchors[storeInUnit.ObjectId.."storedAmmo"] = EnemyHealthDisplayAnchors[storeInUnit.ObjectId.."storedAmmo"] or {}
	local screenId = SpawnObstacle({ Name = "AmmoSmall", Group = "Combat_UI_World", DestinationId = EnemyHealthDisplayAnchors[storeInUnit.ObjectId] })
	SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = screenId })
	Attach({ Id = screenId, DestinationId = EnemyHealthDisplayAnchors[storeInUnit.ObjectId], OffsetX = RandomInt(-100, 100), OffsetY = RandomInt(-100, 100)})
	table.insert( EnemyHealthDisplayAnchors[storeInUnit.ObjectId.."storedAmmo"], screenId )

	local numAmmo = #EnemyHealthDisplayAnchors[storeInUnit.ObjectId.."storedAmmo"]
	local spacing = CombatUI.AmmoPipSpacing
	local totalWidth = numAmmo * spacing
	if totalWidth > CombatUI.AmmoPipMaxWidth then
		totalWidth = CombatUI.AmmoPipMaxWidth
		spacing = totalWidth / numAmmo
	end

	for i = 1, numAmmo do
		local offsetX = storeInUnit.BarXScale * 98 / 2 - i * spacing
		local offsetY = -30

		Attach({ Id = EnemyHealthDisplayAnchors[storeInUnit.ObjectId.."storedAmmo"][i], DestinationId = EnemyHealthDisplayAnchors[storeInUnit.ObjectId], OffsetX = offsetX, OffsetY = offsetY })
	end
end

function UpdateHealthBarIcons( enemy )
	local hitShields = enemy.HitShields or 0
	local maxHitShields = enemy.MaxHitShields
	local shieldIcons = EnemyHealthDisplayAnchors[enemy.ObjectId.."shieldIcons"]
	local displayedShields = TableLength(shieldIcons) or 0

	local healthBarLength = 620
	local shieldIconSpacer = 20
	local armorIconOffsetX = 0
	local bossHealthBarOffsetX = 0
	local bossHealthBarOffsetY = 0

	local targetLayer = "Combat_UI_World"
	local iconScale = 1
	if enemy.UseBossHealthBar then
		targetLayer = "Combat_UI_Menu"
		iconScale = 1.5
		shieldIconSpacer = 32
		if enemy.BarXScale then
			healthBarLength = healthBarLength * enemy.BarXScale
		end
	else
		if enemy.BarXScale then
			healthBarLength = 98 * enemy.BarXScale
		end
	end

	if enemy.HealthBuffer and enemy.HealthBuffer > 0 then
		if EnemyHealthDisplayAnchors[enemy.ObjectId.."armorIcon"] == nil then
			local barPipId = SpawnObstacle({ Name = "BlankObstacle", Group = "Combat_UI_World" })
			SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = barPipId })
			local healthBarLength = 98 * enemy.BarXScale
			Attach({ Id = barPipId, DestinationId = EnemyHealthDisplayAnchors[enemy.ObjectId], OffsetX = -healthBarLength/2 + 5, OffsetY = -15})
			SetScale({ Id = barPipId, Fraction = 1 })
			SetAnimation({ Name = "HealthArmored", DestinationId = barPipId })
			EnemyHealthDisplayAnchors[enemy.ObjectId.."armorIcon"] = barPipId
			armorIconOffsetX = 20
		end
	else
		local armorId = EnemyHealthDisplayAnchors[enemy.ObjectId.."armorIcon"]
		if armorId ~= nil then
			Destroy({ Id = armorId, TriggerOnDestroy = false, })
		end
	end

	if displayedShields ~= hitShields then
		if displayedShields < hitShields then
			if not shieldIcons then
				EnemyHealthDisplayAnchors[enemy.ObjectId.."shieldIcons"] = {}
				shieldIcons = EnemyHealthDisplayAnchors[enemy.ObjectId.."shieldIcons"]
			end
			for i = displayedShields + 1, hitShields do
				local barPipId = nil
				if not enemy.UseBossHealthBar then
					barPipId = SpawnObstacle({ Name = "BlankObstacle", Group = targetLayer })
					SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = barPipId })
				else
					barPipId = CreateScreenComponent({ Name = "BlankObstacle", Group = targetLayer}).Id
					bossHealthBarOffsetX = -20
					bossHealthBarOffsetY = -23
				end
				Attach({ Id = barPipId, DestinationId = EnemyHealthDisplayAnchors[enemy.ObjectId], OffsetX = -healthBarLength/2 + (i - 0.5) * shieldIconSpacer + armorIconOffsetX + bossHealthBarOffsetX, OffsetY = -15 + bossHealthBarOffsetY })
				SetScale({ Id = barPipId, Fraction = iconScale })
				SetAnimation({ Name = "HealthShielded_Small", DestinationId = barPipId })
				table.insert(shieldIcons, barPipId)
			end
		else
			for i = hitShields + 1, displayedShields do
				RemoveHitShieldPresentation( shieldIcons[i] )
				Destroy({Id = shieldIcons[i]})
				shieldIcons[i] = nil
			end
		end
	end
end


function CurseHealthBar( victim )
	victim.CursedHealthBarEffect = true
	UpdateHealthBar( victim, 0, { Force = true })
end

function UpdateHealthBar( enemy, damageAmount, damageEventArgs )
	if damageAmount == nil then
		damageAmount = 0
	end
	if damageAmount == 0 and not damageEventArgs.Force then
		return
	end
	local objectId = enemy.ObjectId
	local screenId = EnemyHealthDisplayAnchors[objectId]
	if screenId == nil then
		return
	end

	-- NOTE(Dexter) Performance: Queue this up to DeferredCombatPresentation()
	CombatPresentationDeferredHealthBars[objectId] = { enemy, screenId }
	--table.insert(CombatPresentationDeferredHealthBars, { enemy, screenId })
end

function UpdateHealthBarReal( args )

	local enemy = args[1]
	local screenId = args[2]
	local backingScreenId = EnemyHealthDisplayAnchors[enemy.ObjectId.."falloff"]

	if enemy.IsDead then
		SetAnimationFrameTarget({ Name = "EnemyHealthBarFillSlow", Fraction = 1, DestinationId = EnemyHealthDisplayAnchors[enemy.ObjectId .. "falloff"] })
		SetAnimationFrameTarget({ Name = enemy.HealthBarFill or "EnemyHealthBarFill", Fraction = 1, DestinationId = screenId, Instant = true })
		return
	end

	local maxHealth = enemy.MaxHealth
	local currentHealth = enemy.Health

	UpdateHealthBarIcons( enemy )

	if enemy.UseBossHealthBar then
		SetAnimationFrameTarget({ Name = enemy.HealthBarFill or "EnemyHealthBarFill", Fraction = 1 - ( currentHealth / maxHealth ), DestinationId = screenId, Instant = true  })
		if enemy.HitShields > 0 then
			SetColor({ Id = screenId, Color = Color.HitShield})
		else
			SetColor({ Id = screenId, Color = Color.Red })
		end
		thread( UpdateBossHealthBarFalloff, enemy, newBar )
		return
	end

	local displayedHealthPercent = 1

	if enemy.CursedHealthBarEffect then
		if enemy.HitShields ~= nil and enemy.HitShields > 0 then
			SetColor({ Id = screenId, Color = Color.CurseHitShield })
		elseif enemy.HealthBuffer ~= nil and enemy.HealthBuffer > 0 then
			SetColor({ Id = screenId, Color = Color.CurseHealthBuffer })
		else
			SetColor({ Id = screenId, Color = Color.CurseHealth })
		end
		SetColor({ Id = backingScreenId, Color = Color.CurseFalloff })
	elseif enemy.Charmed then
		SetColor({ Id = screenId, Color = Color.CharmHealth })
		SetColor({ Id = backingScreenId, Color = Color.HealthBufferFalloff })
	else
		if enemy.HitShields ~= nil and enemy.HitShields > 0 then
			SetColor({ Id = screenId, Color = Color.HitShield })
		elseif enemy.HealthBuffer ~= nil and enemy.HealthBuffer > 0 then
			SetColor({ Id = screenId, Color = Color.HealthBuffer })
			SetColor({ Id = backingScreenId, Color = Color.HealthBufferFalloff })
		else
			SetColor({ Id = screenId, Color = Color.Red })
			SetColor({ Id = backingScreenId, Color = Color.HealthFalloff })
		end
	end

	if enemy.HitShields ~= nil and enemy.HitShields > 0 then
		displayedHealthPercent = 1
	elseif enemy.HealthBuffer ~= nil and enemy.HealthBuffer > 0 then
		displayedHealthPercent = enemy.HealthBuffer / enemy.MaxHealthBuffer
	else
		displayedHealthPercent = currentHealth / maxHealth
	end

	local newBar = false
	if enemy.DisplayedHealthFraction < displayedHealthPercent then
		newBar = true
	end

	enemy.DisplayedHealthFraction = displayedHealthPercent
	SetAnimationFrameTarget({ Name = enemy.HealthBarFill or "EnemyHealthBarFill", Fraction = 1 - displayedHealthPercent, DestinationId = screenId, Instant = true })
	thread( UpdateEnemyHealthBarFalloff, enemy, newBar )
end

function UpdateBossHealthBarFalloff( enemy )
	if SetThreadWait( "EnemyHealthBarFalloff"..enemy.ObjectId, CombatUI.HealthBarFalloffDelay ) then
		return
	end
	wait( CombatUI.HealthBarFalloffDelay, "EnemyHealthBarFalloff"..enemy.ObjectId )
	if enemy and not enemy.IsDead then
		SetAnimationFrameTarget({ Name = "EnemyHealthBarFillSlowBoss", Fraction = 1 - enemy.Health / enemy.MaxHealth, DestinationId = EnemyHealthDisplayAnchors[enemy.ObjectId .. "falloff"] })
	end
end

function UpdateEnemyHealthBarFalloff( enemy, newBar )
	if newBar and enemy and not enemy.IsDead then
		SetAnimationFrameTarget({ Name = "EnemyHealthBarFillSlow", Fraction = 0, DestinationId = EnemyHealthDisplayAnchors[enemy.ObjectId .. "falloff"], Instant = true })
		return
	end

	if SetThreadWait( "EnemyHealthBarFalloff"..enemy.ObjectId, CombatUI.HealthBarFalloffDelay ) then
		return
	end
	wait( CombatUI.HealthBarFalloffDelay, "EnemyHealthBarFalloff"..enemy.ObjectId )
	if enemy and not enemy.IsDead then
		SetAnimationFrameTarget({ Name = "EnemyHealthBarFillSlow", Fraction = 1 - enemy.DisplayedHealthFraction, DestinationId = EnemyHealthDisplayAnchors[enemy.ObjectId .. "falloff"] })
	end
end

function EnemyHealthBarLost( enemy, targetId )
	local healthBarId = EnemyHealthDisplayAnchors[enemy.ObjectId]
	local target = SpawnObstacle({ Name = "BlankObstacle", Group = "Combat_UI_World" })
	Attach({ Id = target, DestinationId = targetId })
	CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = target, GroupName = "Overlay" })
	wait(0.25)
	Destroy({ Id = target })
end

function RemoveHitShieldPresentation( iconId )
	CreateAnimation({ Name = "SkillProcFeedbackFx_HitShieldRemoved", DestinationId = iconId, GroupName = "Overlay" })
end

function EnemyHealthBarGained( enemy, targetId )
	local healthBarId = EnemyHealthDisplayAnchors[enemy.ObjectId]
	local target = SpawnObstacle({ Name = "BlankObstacle", Group = "Combat_UI_World" })
	Attach({ Id = target, DestinationId = targetId })
	CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = target, GroupName = "Overlay" })
	wait(0.25)
	Destroy({ Id = target })
end

function RemoveEnemyUI( enemy )

	local enemyId = enemy.ObjectId

	thread( RemoveEnemyText, enemyId )
	thread( RemoveEnemyHealthBar, enemy )

	if enemy.UseBossHealthBar and ScreenAnchors.BossHealthTitles ~= nil then
		DestroyTextBox({ Id = ScreenAnchors.BossHealthTitles[enemy.ObjectId] })
		ScreenAnchors.BossHealthTitles[ enemy.ObjectId ] = nil
		if enemy.RageBarFill ~= nil then
			Destroy({ Id = ScreenAnchors.BossRageTitle })
			Destroy({ Id = ScreenAnchors.BossRageBack })
			Destroy({ Id = ScreenAnchors.BossRageFill })
		end
	end

end

function RemoveEnemyText( enemyId )
	if EnemyDisplayAnchors[enemyId] ~= nil then
		local fadeDuration = 0.25
		ModifyTextBox({ Id = EnemyDisplayAnchors[enemyId], FadeTarget = 0.0, FadeDuration = fadeDuration, AutoSetDataProperties = false })
		wait( fadeDuration, RoomThreadName )
		if EnemyDisplayAnchors[enemyId] ~= nil then
			Destroy({ Id = EnemyDisplayAnchors[enemyId] })
			EnemyDisplayAnchors[enemyId] = nil
		end
	end
end

function RemoveEnemyHealthBar( enemy )
	if enemy.RemovingHealthBar then
		return
	end
	enemy.RemovingHealthBar = true

	local enemyId = enemy.ObjectId
	if EnemyHealthDisplayAnchors[enemyId.."elitebadge"] then
		Destroy({ Id = EnemyHealthDisplayAnchors[enemyId.."elitebadge"]})
	end
	if enemy.EliteAttributes ~= nil then
		for k, attributeName in pairs(enemy.EliteAttributes) do
			if EnemyHealthDisplayAnchors[enemyId.."elitebadge"..attributeName] then
				Destroy({ Id = EnemyHealthDisplayAnchors[enemyId.."elitebadge"..attributeName]})
			end
		end
	end

	local toDestroy = {}
	table.insert( toDestroy, EnemyHealthDisplayAnchors[enemyId] )
	table.insert( toDestroy, EnemyHealthDisplayAnchors[enemyId.."back"] )
	table.insert( toDestroy, EnemyHealthDisplayAnchors[enemyId.."health"] )
	table.insert( toDestroy, EnemyHealthDisplayAnchors[enemyId.."armorIcon"] )
	table.insert( toDestroy, EnemyHealthDisplayAnchors[enemyId.."vulnerabilityIndicator"] )
	table.insert( toDestroy, EnemyHealthDisplayAnchors[enemyId.."falloff"] )
	table.insert( toDestroy, EnemyHealthDisplayAnchors[enemyId.."freezestatus"] )
	if EnemyHealthDisplayAnchors[enemyId.."status"] ~= nil then
		for k, v in pairs( EnemyHealthDisplayAnchors[enemyId.."status"] ) do
			table.insert( toDestroy, v )
		end
	end

	if EnemyHealthDisplayAnchors[enemyId.."storedAmmo"] ~= nil then
		Destroy({ Ids = EnemyHealthDisplayAnchors[enemyId.."storedAmmo"], TriggerOnDestroy = false })
	end

	if EnemyHealthDisplayAnchors[enemyId.."shieldIcons"] ~= nil then
		for k, v in pairs( EnemyHealthDisplayAnchors[enemyId.."shieldIcons"] ) do
			table.insert( toDestroy, v )
		end
	end

	--if not enemy.UseBossHealthBar then
		--CreateAnimation({ Name = "EnemyHealthBarDepleted", DestinationId = EnemyHealthDisplayAnchors[enemyId.."back"], Group = "Combat_Menu_Additive", Scale = 1 })
	--end
	wait( CombatUI.DeathHoldDuration, RoomThreadName )
	SetScaleY({ Ids = toDestroy, Fraction = 0, Duration = 0.15 })
	if EnemyHealthDisplayAnchors[enemyId.."health"] ~= nil then
		SetScaleX({ Id = EnemyHealthDisplayAnchors[enemyId.."health"], Fraction = 0, Duration = 0.0 })
	end
	if EnemyHealthDisplayAnchors[enemyId.."back"] ~= nil and EnemyHealthDisplayAnchors[enemyId.."scale"] ~= nil then
		SetScaleX({ Id = EnemyHealthDisplayAnchors[enemyId.."back"], Fraction = EnemyHealthDisplayAnchors[enemyId.."scale"] * 1.4, Duration = 0.15 })
	end
	wait( 0.15, RoomThreadName )
	Destroy({ Ids = toDestroy, TriggerOnDestroy = false })
end

function ArmorBreakPresentation( enemy )
	local enemyId = enemy.ObjectId
	local offsetY = -155
	if enemy.Scale ~= nil then
		offsetY = offsetY * enemy.Scale
	end
	if enemy.HealthBarOffsetY then
		offsetY = enemy.HealthBarOffsetY - 18
	end

	SetAnimation({ DestinationId = EnemyHealthDisplayAnchors[enemy.ObjectId.."back"], Name = "EnemyHealthBar" })

	if not CanStartBudgetedPresentation("ArmorBreakPresentation") then
		return
	end

	CreateAnimations({
		DestinationId = enemyId,
		Anims =
		{
			{ Name = "StatusIconVulnerableArmorShatter", OffsetX = -50, OffsetY = offsetY },
			{ Name = "HealthBarArmorShatter", OffsetY = offsetY - 35 },
			{ Name = "ArmorBreak" }
		}
	})

	local promptId = SpawnObstacle({ Name = "BlankObstacle", Group = "Combat_UI_World", DestinationId = enemyId, OffsetY = offsetY })
	SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = promptId})
	Attach({ Id = promptId, DestinationId = enemyId, OffsetY = offsetY })
	PlaySound({ Name = "/SFX/Menu Sounds/WeaponUnlockPoof", Id = enemy.ObjectId })
	CreateTextBox({	Id = promptId, Text = "ArmorBreak", Justification = "CENTER",
		ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 3}, ShadowBlur = 0,
		OutlineThickness = 0, OutlineColor = {1, 1, 1, 1},
		Font = "AlegreyaSansExtraBoldItalic", FontSize = 16, Color = {255,255,255,255},
		CharacterFadeTime = 0, CharacterFadeInterval = 0, Group = "Combat_UI_World",
		AutoSetDataProperties = false,
		ScaleTarget = 6.2, ScaleDuration = 10,
		})
	Move({ Id = promptId, Distance = 100, Angle = 0, Duration = 1, EaseOut = 1 })

	wait(0.5)
	ModifyTextBox({ Id = promptId, FadeTarget = 0.0, FadeDuration = 0.4, ColorTarget = {1, 0, 0, 1}, ColorDuration = 0.5, AutoSetDataProperties = false })
	wait(1.0)
	DestroyTextBox({ Id = promptId })

	ExitBudgetedPresentation("ArmorBreakPresentation")

end

function PlayerLastStandPresentationStart( args )
	wait(0.06)
	local secondChanceFxInTime = 0.08

	-- put up screen vfx
	ScreenAnchors.LastStandVignette = SpawnObstacle({ Name = "BlankObstacle", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	CreateAnimation({ Name = "LastStandVignette", DestinationId = ScreenAnchors.LastStandVignette })
	AdjustColorGrading({ Name = "DeathDefianceSubtle", Duration = secondChanceFxInTime, Delay = 0.0, })

	RemoveFromGroup({ Id = CurrentRun.Hero.ObjectId, Names = { "Standing" } })
	AddToGroup({ Id = CurrentRun.Hero.ObjectId, Name = "Combat_Menu", DrawGroup = true })

	-- camera
	PanCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 0.01 })
	FocusCamera({ Fraction = 1.03, Duration = 0.045, ZoomType = "Ease" })

	-- pause the game
	AddSimSpeedChange( "LastStand", { Fraction = 0.005, LerpTime = 0.0001, Priority = true } )

	-- play voiceover
	thread( PlayerLastStandVoicelines, args )
	thread( PlayerLastStandSFX )
	waitScreenTime(  0.3 )

	-- pop the death defiance
	LostLastStandPresentation()
	UpdateLifePips()
	thread( PlayerLastStandProcText )

	waitScreenTime(  1.1 )

end

function PlayerLastStandProcText()
	waitScreenTime(  0.2 )
	thread( InCombatText, CurrentRun.Hero.ObjectId, "Hint_ExtraChance", 0.9 )
end

function PlayerLastStandPresentationEnd()
	RemoveFromGroup({ Id = CurrentRun.Hero.ObjectId, Names = { "Combat_Menu" } })
	AddToGroup({ Id = CurrentRun.Hero.ObjectId, Name = "Standing", DrawGroup = true })
	waitScreenTime(  1.0 )
	local secondChanceFxOutTime = 0.4
	AdjustRadialBlurStrength({ Fraction = 0, Duration = secondChanceFxOutTime  })
	AdjustFrame({ Duration = secondChanceFxOutTime, Fraction = 0 })
	RemoveSimSpeedChange( "LastStand", { LerpTime = secondChanceFxOutTime } )
	AdjustFullscreenBloom({ Name = "DeathDefiance", Duration = secondChanceFxOutTime * 0.1 })
	AdjustColorGrading({ Name = "Off", Duration = secondChanceFxOutTime * 1.5, Delay = secondChanceFxOutTime * 0.1 })
	AdjustFullscreenBloom({ Name = "Off", Duration = secondChanceFxOutTime * 0.5, Delay = secondChanceFxOutTime * 0.1 })
	SetAlpha({ Id = ScreenAnchors.LastStandVignette, Fraction = 0, Duration = 0.06 })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	FocusCamera({ Fraction = CurrentRun.CurrentRoom.ZoomFraction or 1.0, Duration = secondChanceFxOutTime, ZoomType = "Ease" })
end

function PlayerLastStandVoicelines( args )
	if args.HasLastStand or GetNumMetaUpgradeLastStands() <= 1 then
		thread( PlayVoiceLines, HeroVoiceLines.LastStandVoiceLines, true )
	else
		thread( PlayVoiceLines, HeroVoiceLines.LastStandLastLifeVoiceLines, true )
	end
	for k, enemy in pairs( ActiveEnemies ) do
		if enemy.LastStandReactionVoiceLines ~= nil then
			thread( PlayVoiceLines, enemy.LastStandReactionVoiceLines, true, enemy )
		end
	end
end

function PlayerLastStandHealingText( args )
	waitScreenTime(  0.2 )
	PlaySound({ Name = "/Leftovers/SFX/StaminaSkillProc", Id = CurrentRun.Hero.ObjectId })
	OnPlayerHealed({ ActualHealAmount = CurrentRun.Hero.Health })
	if ScreenAnchors.HealthFlash ~= nil then
		CreateAnimation({ Name = "LastStandHealthBarRefillFlare", DestinationId = ScreenAnchors.HealthFlash, Group = "Combat_Menu_Additive", OffsetY = -12, OffsetX = 40})
	end
end

function PlayerLastStandSFX( )
	local currentRun = CurrentRun
	local hasLastStand = HasLastStand( CurrentRun.Hero )
	if hasLastStand then
		PlaySound({ Name = "/SFX/DeathDefianceActivate", Id = CurrentRun.Hero.ObjectId })
		PlaySound({ Name = "/VO/ZagreusEmotes/EmoteCharging", Id = CurrentRun.Hero.ObjectId })
	else
		PlaySound({ Name = "/SFX/DeathDefianceActivate", Id = CurrentRun.Hero.ObjectId })
		PlaySound({ Name = "/VO/ZagreusEmotes/EmoteCharging", Id = CurrentRun.Hero.ObjectId })
	end
end

function PlayerLastStandHealingPresentation( )
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 4.5, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	PlaySound({ Name = "/VO/ZagreusEmotes/EmotePoweringUp", Id = CurrentRun.Hero.ObjectId })
	SetAnimation({ Name = "ZagreusWrath", DestinationId = CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "ZagreusWrathFire", DestinationId = CurrentRun.Hero.ObjectId, Color = Color.White })
	CreateAnimation({ Name = "DeathDefianceShockwave", DestinationId = CurrentRun.Hero.ObjectId })
	--waitScreenTime( 0.3)
	--PlaySound({ Name = "/VO/ZagreusEmotes/EmoteRangedALT5", Id = CurrentRun.Hero.ObjectId })
	thread( PlayerLastStandHealingText, args )
end

function GainLastStandPresentation( index )
	if not index then
		index = TableLength( CurrentRun.Hero.LastStands )
	end
	if not ScreenAnchors.LifePipIds then
		return
	end
	CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = ScreenAnchors.LifePipIds[ index ], GroupName = "Overlay" })
end

function LostLastStandPresentation( )
	if not ScreenAnchors.LifePipIds then
		return
	end
	local index = TableLength( CurrentRun.Hero.LastStands )

	CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = ScreenAnchors.LifePipIds[ index ], GroupName = "Overlay" })
end

function LowHealthCombatTextPresentation( unitId, texts )
	local lowHealthFxInTime = 0.4
	local lowHealthFxOutTime = 0.4

	AdjustRadialBlurDistance({ Fraction = 0.25, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0.85, Duration = lowHealthFxInTime  })
	AdjustFullscreenBloom({ Name = "DesaturatedLight", Duration = 0 })

	for i, text in pairs( texts ) do
		thread( InCombatText, unitId, text, 1.75 )
		waitScreenTime( 0.2)
	end
	waitScreenTime(  0.75 )

	AdjustRadialBlurStrength({ Fraction = 0, Duration = lowHealthFxOutTime  })
	AdjustFullscreenBloom({ Name = "Off", Duration = lowHealthFxOutTime })
end

function ArmorRestoredPresentation( enemy )
	local enemyId = enemy.ObjectId
	local offsetY = -155
	if enemy.Scale ~= nil then
		offsetY = offsetY * enemy.Scale
	end
	if enemy.HealthBarOffsetY then
		offsetY = enemy.HealthBarOffsetY
	end

	SetAnimation({ Name = "HealthBarArmorIcon", DestinationId = EnemyHealthDisplayAnchors[enemyId.."armor"] })
	local promptId = SpawnObstacle({ Name = "BlankObstacle", Group = "Combat_UI_World", DestinationId = enemyId, OffsetY = offsetY })
	SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = promptId})
	Attach({ Id = promptId, DestinationId = enemyId, OffsetY = offsetY })
	CreateTextBox({	Id = promptId, Text = "ARMOR RESTORED!!", Justification = "CENTER",
		ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 3}, ShadowBlur = 0,
		OutlineThickness = 0, OutlineColor = {1, 1, 1, 1},
		Font = "CrimsonTextBoldItalic", FontSize = "40", Color = {255,255,255,255},
		CharacterFadeTime = 0, CharacterFadeInterval = 0, Group = "Combat_UI_World",
		AutoSetDataProperties = false
		})
	ModifyTextBox({ Id = promptId, ScaleTarget = 6.2, ScaleDuration = 10, AutoSetDataProperties = false })
	Move({ Id = promptId, Distance = 100, Angle = 0, Duration = 1, EaseOut = 1 })

	wait(0.25)
	ModifyTextBox({ Id = promptId, FadeTarget = 0.0, FadeDuration = 1.5, ColorTarget = {1, 0, 0, 1}, ColorDuration = 0.5, AutoSetDataProperties = false })
	wait(1.5)

	DestroyTextBox({ Id = promptId })
end

function PerfectClearTraitStartPresentation( traitData )
	PlaySound({ Name = "/EmptyCue" })
	TraitUIActivateTrait( traitData )
end

function PerfectClearTraitFailedPresentation( traitData )
	TraitUIDeactivateTrait( traitData )
	PlaySound({ Name = "/SFX/ThanatosHermesKeepsakeFail" })
	thread( PlayVoiceLines, HeroVoiceLines.KeepsakeChallengeFailedVoiceLines, true )
	local existingTraitData = GetExistingUITrait( traitData )
	if existingTraitData then
		Shake({ Id = existingTraitData.AnchorId, Distance = 3, Speed = 500, Duration = 0.25 })
		Flash({ Id = existingTraitData.AnchorId, Speed = 2, MinFraction = 0, MaxFraction = 0.8, Color = Color.Black, ExpireAfterCycle = true })
	end
end

function PerfectClearTraitSuccessPresentation( traitData )
	TraitUIDeactivateTrait( traitData )
	thread( PlayVoiceLines, HeroVoiceLines.PerfectClearDamageBonusUpgradedVoiceLines, true )
	local existingTraitData = GetExistingUITrait( traitData )
	if existingTraitData then
		Flash({ Id = existingTraitData.AnchorId, Speed = 2, MinFraction = 0, MaxFraction = 0.8, Color = Color.LimeGreen, ExpireAfterCycle = true })
		CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = existingTraitData.AnchorId, GroupName = "Overlay" })
		thread( InCombatText, existingTraitData.AnchorId, "PerfectClearDamageBonus", 1.5 , { ScreenSpace = true, OffsetX = 170, OffsetY = 10, Angle = 0, LuaKey = "TempTextData", LuaValue = traitData })
	end
	wait( 0.45, RoomThreadName )

	local soundId = PlaySound({ Name = "/SFX/ThanatosAttackBell" })
	SetVolume({ Id = soundId, Value = 0.3 })
	CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	ShakeScreen({ Speed = 500, Distance = 4, FalloffSpeed = 1000, Duration = 0.3 })

end

function FastClearTraitStartPresentation( clearTimeThreshold, traitData )
	PlaySound({ Name = "/EmptyCue" })
	TraitUIActivateTrait( traitData, { CustomAnimation = "ActiveTraitSingle", PlaySpeed = 30 / clearTimeThreshold })
end

function FastClearTraitFailedPresentation( traitData )
	TraitUIDeactivateTrait( traitData )
	PlaySound({ Name = "/SFX/ThanatosHermesKeepsakeFail" })
	thread( PlayVoiceLines, HeroVoiceLines.KeepsakeChallengeFailedVoiceLines, true )
	local existingTraitData = GetExistingUITrait( traitData )
	if existingTraitData then
		Shake({ Id = existingTraitData.AnchorId, Distance = 3, Speed = 500, Duration = 0.25 })
		Flash({ Id = existingTraitData.AnchorId, Speed = 2, MinFraction = 0, MaxFraction = 0.8, Color = Color.Black, ExpireAfterCycle = true })
	end
end

function FastClearTraitSuccessPresentation( traitData )
	TraitUIDeactivateTrait( traitData )
	thread( PlayVoiceLines, HeroVoiceLines.FastClearDodgeBonusUpgradedVoiceLines, true )
	local existingTraitData = GetExistingUITrait( traitData )
	if existingTraitData then
		Flash({ Id = existingTraitData.AnchorId, Speed = 2, MinFraction = 0, MaxFraction = 0.8, Color = Color.LimeGreen, ExpireAfterCycle = true })
		CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = existingTraitData.AnchorId, GroupName = "Overlay" })
		thread( InCombatText, existingTraitData.AnchorId, "FastClearDamageBonus", 1.5 , { ScreenSpace = true, OffsetX = 170, OffsetY = 10, Angle = 0, LuaKey = "TempTextData", LuaValue = traitData })
	end
	wait( 0.45, RoomThreadName )

	local soundId = PlaySound({ Name = "/SFX/Player Sounds/HermesWhooshDashReverse" })
	PlaySound({ Name = "/Leftovers/SFX/PositiveTalismanProc_3" })
	SetVolume({ Id = soundId, Value = 0.3 })
	CreateAnimation({ Name = "HermesWings", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	ShakeScreen({ Speed = 500, Distance = 4, FalloffSpeed = 1000, Duration = 0.3 })

end

function CreateLevelDisplay( newEnemy, currentRun )

	if newEnemy.HideLevelDisplay or newEnemy.HasLevelDisplay then
		return
	end
	newEnemy.HasLevelDisplay = true

	local offsetY = -150
	if newEnemy.Scale ~= nil then
		offsetY = offsetY * newEnemy.Scale
	end
	if newEnemy.HealthBarOffsetY then
		offsetY = newEnemy.HealthBarOffsetY
	end

	local textBoxAnchor = SpawnObstacle({ Name = "BlankObstacle", Group = "Combat_UI_World", DestinationId = newEnemy.ObjectId, OffsetY = offsetY })
	Attach({ Id = textBoxAnchor, DestinationId = newEnemy.ObjectId, OffsetY = offsetY - 20 })

	if newEnemy.LevelText ~= nil then
		CreateTextBox({ Id = textBoxAnchor, Text = newEnemy.LevelText, FontSize = 16, Font = "AlegreyaSansSCBold",
			ShadowOffset = {0, 2}, ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset = {0, 4}, OutlineThickness = 2, OutlineColor = {0.0, 0.0, 0.0,1}, AutoSetDataProperties = false })
	end
	EnemyDisplayAnchors[newEnemy.ObjectId] = textBoxAnchor

	if not newEnemy.UseBossHealthBar then
		if newEnemy.EliteIcon or ( newEnemy.HealthBuffer ~= nil and newEnemy.HealthBuffer > 0 ) or ( newEnemy.HitShields ~= nil and newEnemy.HitShields > 0 ) then
			CreateHealthBar( newEnemy )
			UpdateHealthBar( newEnemy, 0, { Force = true })
			if not newEnemy.HasOutline and newEnemy.Outline ~= nil and newEnemy.HealthBuffer ~= nil and newEnemy.HealthBuffer > 0 then
				newEnemy.Outline.Id = newEnemy.ObjectId
				AddOutline( newEnemy.Outline )
				newEnemy.HasOutline = true
			end
		end
	end
end

function PostEnemyKillPresentation( victim, triggerArgs )
	RemoveEnemyUI( victim )
end

function DisplayDamageText( victim, triggerArgs )

	if not ConfigOptionCache.ShowDamageNumbers then
		return
	end

	local amount = triggerArgs.DamageAmount
	local isCritical = triggerArgs.IsCrit
	local isTagCombo = triggerArgs.UsedTag
	local hitVulnerable = triggerArgs.HitVulnerability and triggerArgs.VulnerabilityMultiplier > 1
	local sourceId = triggerArgs.AttackerId

	if victim == nil then
		return
	end
	if victim.SkipDamageText then
		return
	end
	if victim.BlockSelfDamageNumbers and sourceId == victim.ObjectId then
		return
	end

	if not CanStartBudgetedPresentation("DisplayDamageText") then
		return
	end

	local roundedAmount = round( amount )
	local wallHit = false
	local damageSourceName = triggerArgs.AttackerName
	local damageProjectileSourceName = triggerArgs.EffectName or triggerArgs.SourceProjectile
	if not triggerArgs.EffectName and triggerArgs.AttackerWeaponData then
		damageProjectileSourceName = GetGenusName(triggerArgs.AttackerWeaponData)
		if triggerArgs.AttackerWeaponData.DamageNumberGenusName then
			damageProjectileSourceName = triggerArgs.AttackerWeaponData.DamageNumberGenusName
		end
	end
	if isCritical then
		damageProjectileSourceName = nil
	end

	if CombatUI.DamageTextCoalesceAll then
		damageProjectileSourceName = "AllCoalesce"
	end
	local offsetY = victim.HealthBarOffsetY or -180
	local randomOffsetX = RandomInt( -10, 10 )
	local randomOffsetY = RandomInt( -3, 3 )
	local numValuesPerRow = 3
	local spacerY = 40
	local damageTextAnchor = nil

	if sourceId ~= nil and EnemyData[damageSourceName] == nil and sourceId ~= CurrentRun.Hero.ObjectId and sourceId ~= -1 then
		-- The enemy was damaged by something other than the player or another enemy, can probably assume it was the environment
		wallHit = true
		damageTextAnchor = SpawnObstacle({ Name = "BlankObstacleNoTimeModifier", DestinationId = victim.ObjectId, Group = "Combat_UI_World", OffsetX = 0 + randomOffsetX, OffsetY = offsetY + randomOffsetY })
	elseif isCritical then

		local damageIndex = 0
		if ScreenAnchors[victim.ObjectId] and ScreenAnchors[victim.ObjectId].DamageProjectileSpaces then
			damageIndex = #ScreenAnchors[victim.ObjectId].DamageProjectileSpaces
		end

		damageTextAnchor = SpawnObstacle({ Name = "BlankObstacleNoTimeModifier", DestinationId = victim.ObjectId, Group = "Combat_UI_World", OffsetX = 0 + randomOffsetX, OffsetY = offsetY  - spacerY * ( 1 + math.floor(( damageIndex - 1 ) / numValuesPerRow )) + randomOffsetY })
	else
		if ScreenAnchors[victim.ObjectId] and ScreenAnchors[victim.ObjectId][damageProjectileSourceName] then
			if not IsEmpty( ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids ) then
				if ScreenAnchors[victim.ObjectId][damageProjectileSourceName].State == "Hold" then
					ScreenAnchors[victim.ObjectId][damageProjectileSourceName].TargetNumber = ScreenAnchors[victim.ObjectId][damageProjectileSourceName].TargetNumber + roundedAmount

					damageTextAnchor = ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids[#ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids]
					ModifyTextBox({ Id = damageTextAnchor, Text = ScreenAnchors[victim.ObjectId][damageProjectileSourceName].TargetNumber })
					thread( PulseCombatText, damageTextAnchor )


					RemoveValue( ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids, damageTextAnchor )
					if not IsEmpty(ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids ) then
						Destroy({Ids = ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids })
					end
					ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids = { damageTextAnchor }
					if ( SetThreadWait( damageTextAnchor, 0.5 )) then
						ExitBudgetedPresentation("DisplayDamageText")
						return
					end
				end
			end
		end

		if not ScreenAnchors[victim.ObjectId] then
			ScreenAnchors[victim.ObjectId] = {}
		end

		local damageIndex = 0
		if not ScreenAnchors[victim.ObjectId][damageProjectileSourceName] then
			ScreenAnchors[victim.ObjectId][damageProjectileSourceName] = {}
			ScreenAnchors[victim.ObjectId].DamageProjectileSpaces = ScreenAnchors[victim.ObjectId].DamageProjectileSpaces or {}
			table.insert( ScreenAnchors[victim.ObjectId].DamageProjectileSpaces, damageProjectileSourceName )
			damageIndex = #ScreenAnchors[victim.ObjectId].DamageProjectileSpaces
		else
			damageIndex = GetKey( ScreenAnchors[victim.ObjectId].DamageProjectileSpaces, damageProjectileSourceName )
		end
		if not ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids then
			ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids = {}
		end
		ScreenAnchors[victim.ObjectId][damageProjectileSourceName].State = "Hold"
		ScreenAnchors[victim.ObjectId][damageProjectileSourceName].TargetNumber = roundedAmount
		ScreenAnchors[victim.ObjectId][damageProjectileSourceName].DisplayedNumber = roundedAmount
		if not damageTextAnchor then
			damageTextAnchor = SpawnObstacle({ Name = "BlankObstacleNoTimeModifier", DestinationId = victim.ObjectId, Group = "Combat_UI_World" })
			local sign = 1
			if damageIndex % 2 == 1 then
				sign = -1
			end
			Attach({ Id = damageTextAnchor, DestinationId = victim.ObjectId, OffsetX = math.floor((( damageIndex - 1) % numValuesPerRow + 1)/ 2 ) * 65 * sign, OffsetY = offsetY - math.floor( ( damageIndex - 1) / numValuesPerRow ) * spacerY })
			table.insert(ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids, damageTextAnchor)
		end
	end

	-- local isSpecialDamage = isCritical or hitVulnerable or wallHit or isTagCombo
	local isSpecialDamage = isCritical
	if isSpecialDamage then
		-- enemy takes critical / backstab / wall slam damage
		local textColor = Color.White
		if wallHit then
			textColor = Color.WallSlamDamageLight
		end
		local randomFontSize = RandomInt( 56, 62 )
		CreateTextBox({
			Id = damageTextAnchor,
			RawText = roundedAmount.."!",
			Justification = "CENTER",
			ShadowBlur = 2, ShadowColor = {0,0,0,1}, ShadowOffset = {2, 2},
			OutlineThickness = 1, OutlineColor = {0.0, 0.0, 0.0,1},
			Color = textColor,
			Font = "AlegreyaSansSCExtraBold",
			FontSize = randomFontSize,
			AutoSetDataProperties = false,
		})
	else
		-- enemy is damaged
		local randomFontSize = RandomInt( 30, 35 )
		local color = {1,1,1}
		if triggerArgs.ProjectileDeflected then
			color = ProjectileData.DeflectedProjectile.DamageTextStartColor
		elseif triggerArgs.SourceProjectile and ProjectileData[triggerArgs.SourceProjectile] then
			if ProjectileData[triggerArgs.SourceProjectile].DamageTextStartColor then
				color = ProjectileData[triggerArgs.SourceProjectile].DamageTextStartColor
			end
		elseif triggerArgs.EffectName ~= nil and EffectData[triggerArgs.EffectName] then
			if EffectData[triggerArgs.EffectName].DamageTextSize then
				randomFontSize = RandomInt(EffectData[triggerArgs.EffectName].DamageTextSize, EffectData[triggerArgs.EffectName].DamageTextSize + 5 )
			end
			if EffectData[triggerArgs.EffectName].DamageTextStartColor then
				color = EffectData[triggerArgs.EffectName].DamageTextStartColor
			end
		end
		CreateTextBox({
			Id = damageTextAnchor,
			RawText = roundedAmount,
			Justification = "CENTER",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset = {2, 2},
			OutlineThickness = 1, OutlineColor = {0,0,0},
			Color = color,
			Font = "AlegreyaSansSCExtraBold",
			FontSize = randomFontSize,
			AutoSetDataProperties = false,
		})
	end
	ModifyTextBox({ Id = damageTextAnchor, FadeTarget = 1, FadeDuration = 0 })
	waitScreenTime( CombatUI.DamageTextHoldTime, damageTextAnchor )
	if damageProjectileSourceName and ScreenAnchors[victim.ObjectId] and ScreenAnchors[victim.ObjectId][damageProjectileSourceName] and IdExists({ Id = damageTextAnchor }) then
		ScreenAnchors[victim.ObjectId][damageProjectileSourceName].State = "Drifting"

		Unattach({ Id = damageTextAnchor, DestinationId = victim.ObjectId})
		ModifyTextBox({ Id = damageTextAnchor, Text = ScreenAnchors[victim.ObjectId][damageProjectileSourceName].TargetNumber })
	end

	local randomDuration = 1
	local driftOffsetX = RandomInt( -120, 120 )
	if wallHit then
		CreateAnimation({ Name = "CriticalHitWallSlam", DestinationId = victim.ObjectId })
	end
	if isSpecialDamage then
		PlaySound({ Name = "/SFX/CriticalHit", Id = victim.ObjectId })
		Shift({ Id = damageTextAnchor, OffsetX = driftOffsetX, OffsetY = -100, Duration = randomDuration * 2, EaseIn = 0.99, EaseOut = 0.1, TimeModifierFraction = 1.0 })
		waitScreenTime( 0.1)
		if wallHit then
			ModifyTextBox({ Id = damageTextAnchor, ScaleTarget = 0.75, ScaleDuration = 0.4, ColorTarget = Color.WallSlamDamage, ColorDuration = 0.4, AutoSetDataProperties = false })
		else
			ModifyTextBox({ Id = damageTextAnchor, ScaleTarget = 0.5, ScaleDuration = 0.15, ColorTarget = Color.Yellow, ColorDuration = 0.5, AutoSetDataProperties = false })
		end
	else
		Shift({ Id = damageTextAnchor, OffsetX = driftOffsetX, OffsetY = -50, Duration = randomDuration, EaseIn = 0.99, EaseOut = 0.1, TimeModifierFraction = 1.0 })
		waitScreenTime( 0.1)
		if triggerArgs.ProjectileDeflected then
			ModifyTextBox({ Id = damageTextAnchor, ScaleTarget = 0.75, ScaleDuration = 0.4, ColorTarget = ProjectileData.DeflectedProjectile.DamageTextColor, ColorDuration = 0.4, AutoSetDataProperties = false })
		elseif triggerArgs.SourceProjectile and ProjectileData[triggerArgs.SourceProjectile] and ProjectileData[triggerArgs.SourceProjectile].DamageTextColor then
			ModifyTextBox({ Id = damageTextAnchor, ScaleTarget = 0.75, ScaleDuration = 0.4, ColorTarget = ProjectileData[triggerArgs.SourceProjectile].DamageTextColor, ColorDuration = 0.4, AutoSetDataProperties = false })
		elseif triggerArgs.EffectName ~= nil and EffectData[triggerArgs.EffectName] and EffectData[triggerArgs.EffectName].DamageTextColor then
			ModifyTextBox({ Id = damageTextAnchor, ScaleTarget = 0.75, ScaleDuration = 0.4, ColorTarget = EffectData[triggerArgs.EffectName].DamageTextColor, ColorDuration = 0.4, AutoSetDataProperties = false })
		else
			ModifyTextBox({ Id = damageTextAnchor, ScaleTarget = 0.75, ScaleDuration = 0.4, ColorTarget = {0,0,0}, ColorDuration = 0.4, AutoSetDataProperties = false })
		end
	end

	if isSpecialDamage then
		waitScreenTime( 0.45)
	else
		waitScreenTime( 0.2)
	end
	ModifyTextBox({ Id = damageTextAnchor, FadeTarget = 0.0, FadeDuration = 0.25, AutoSetDataProperties = false })
	waitScreenTime( 0.25)
	Destroy({ Ids = { damageTextAnchor } })
	if damageProjectileSourceName and ScreenAnchors[victim.ObjectId] and ScreenAnchors[victim.ObjectId][damageProjectileSourceName] then
		RemoveValue( ScreenAnchors[victim.ObjectId] and ScreenAnchors[victim.ObjectId][damageProjectileSourceName].Ids, damageTextAnchor )
		if IsEmpty(ScreenAnchors[victim.ObjectId][damageProjectileSourceName]) then
			ScreenAnchors[victim.ObjectId][damageProjectileSourceName].State = nil
		end
	end

	ExitBudgetedPresentation("DisplayDamageText")
end

function ParryAttackPresentation( unitId )
	if unitId ~= CurrentRun.Hero.ObjectId then
		return
	end
	if not CanStartBudgetedPresentation("ParryAttackPresentation") then
		return
	end
	PlaySound({ Name = "/Leftovers/Menu Sounds/LevelUpFlash", Id = unitId })
	PlaySound({ Name = "/VO/ZagreusEmotes/EmotePowerAttacking", Id = unitId })
	Flash({ Id = unitId, Speed = 0.85, MinFraction = 0.7, MaxFraction = 0.0, Color = Color.White, Duration = 0.15, ExpireAfterCycle = true })
	thread( InCombatText, unitId, "ParryHit" )
	wait(0.15)
	ExitBudgetedPresentation("ParryAttackPresentation")
end

function ShadeBlockPresentation( unitId, unitData )
	if not CanStartBudgetedPresentation("ShadeBlockAttackPresentation") then
		return
	end
	Flash({ Id = unitId, Speed = 0.85, MinFraction = 0.7, MaxFraction = 0.0, Color = Color.White, Duration = 0.15, ExpireAfterCycle = true })
	CreateAnimation({ Name = "ShadeShieldBlock", DestinationId = unitId })
	PlaySound({ Name = "/SFX/Enemy Sounds/Exalted/EnemyShieldBlock", Id = unitId })

	if CheckCooldown( "BlockHint"..unitId, 0.2 ) then
		thread( InCombatText, unitId, "BlockHit" )
	end
	wait(0.15)
	ExitBudgetedPresentation("ShadeBlockAttackPresentation")
end

function TheseusDamaged( victim, attacker )
	PlaySound({ Name = "/SFX/Enemy Sounds/Theseus/EmoteHurt", Id = victim.ObjectId })
end
function Theseus2Damaged( victim, attacker )
end

function BlockAttackPresentation( unitId )
	if unitId ~= CurrentRun.Hero.ObjectId then
		return
	end
	if not CanStartBudgetedPresentation("BlockAttackPresentation") then
		return
	end
	PlaySound({ Name = "/SFX/Enemy Sounds/Exalted/EnemyShieldBlock", Id = unitId })
	Flash({ Id = unitId, Speed = 0.85, MinFraction = 0.7, MaxFraction = 0.0, Color = Color.White, Duration = 0.15, ExpireAfterCycle = true })
	thread( InCombatText, unitId, "BlockHit" )
	wait(0.15)
	ExitBudgetedPresentation("BlockAttackPresentation")
end
-- |COMBAT FEEDBACK| --

function ArmorDamagePresentation( args )
	if not CanStartBudgetedPresentation( "ArmorDamagePresentation" ) then
		return
	end
	thread( DoUnitArmorShake, args )
	thread( DoUnitArmorSpark, args )
	thread( PlayVoiceLines, HeroVoiceLines.StruckArmorVoiceLines, true )

	if args then
		local projectileName = args.SourceProjectile
		local effectName = args.EffectName
		if projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelRumble then
			ExitBudgetedPresentation( "ArmorDamagePresentation" )
			return
		end

		if effectName and EffectData[effectName] and EffectData[effectName].CancelRumble then
			ExitBudgetedPresentation( "ArmorDamagePresentation" )
			return
		end
	end
	local attackerWeaponName = args.SourceWeapon
	local weaponData = GetWeaponData(args.AttackerTable, attackerWeaponName)
	if weaponData ~= nil then
		thread( DoWeaponHitSimulationSlow, args )
		thread( DoWeaponScreenshake, weaponData.HitScreenshake, args.AttackerId, args.SourceProjectile, args.EffectName )
		thread( DoCameraMotion, weaponData.HitCameraMotion )
		thread( DoWeaponHitRumble, weaponData, args )
		if weaponData.OnHitCrowdReaction ~= nil then
			thread( CrowdReactionPresentation, weaponData.OnHitCrowdReaction )
		end
	end
	ExitBudgetedPresentation( "ArmorDamagePresentation" )
end

function DamagePresentation( args )
	if not CanStartBudgetedPresentation( "DamagePresentation" ) then
		return
	end
	thread( DoUnitShake, args )
	thread( DoUnitHitFlash, args )
	if args then
		local projectileName = args.SourceProjectile
		local effectName = args.EffectName
		if projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelRumble then
			ExitBudgetedPresentation( "DamagePresentation" )
			return
		end

		if effectName and EffectData[effectName] and EffectData[effectName].CancelRumble then
			ExitBudgetedPresentation( "DamagePresentation" )
			return
		end
	end
	local attackerWeaponName = args.SourceWeapon
	local weaponData = GetWeaponData(args.AttackerTable, attackerWeaponName)
	if args.TriggeredByTable ~= CurrentRun.Hero and weaponData ~= nil and weaponData.PresentationOnlyOnPlayerHit then
		return
	end
	if weaponData ~= nil then
		thread( DoWeaponHitSimulationSlow, args )
		thread( DoWeaponScreenshake, weaponData.HitScreenshake, args.AttackerId, args.SourceProjectile, args.EffectName )
		thread( DoCameraMotion, weaponData.HitCameraMotion )
		thread( DoWeaponHitRumble, weaponData, args )
		if weaponData.OnHitCrowdReaction ~= nil then
			thread( CrowdReactionPresentation, weaponData.OnHitCrowdReaction )
		end
	end
	ExitBudgetedPresentation( "DamagePresentation" )
end

function SpecialHitPresentation( triggerArgs )
	if not CanStartBudgetedPresentation( "SpecialHitPresentation" ) then
		return
	end
	local unitId = triggerArgs.triggeredById
	local unit = triggerArgs.TriggeredByTable
	local isCritical = triggerArgs.IsCrit
	local isTagCombo = triggerArgs.UsedTag
	local hitVulnerable = triggerArgs.HitVulnerability
	local vulnerabilityMultiplier = triggerArgs.VulnerabilityMultiplier
	local offsetY = unit.HealthBarOffsetY or -155
	if isCritical then
		--thread( InCombatText, unitId, "CriticalHit", 0.3, {OffsetY = offsetY + 45, FontSize = 16, SkipFlash = true, FadeDuration = 0.1 } )
		--wait(0.3)
	end
	if isTagCombo then
		thread( InCombatText, unitId, "ComboHit", 0.3, {OffsetY = offsetY, FontSize = 16, SkipFlash = true, FadeDuration = 0.1  })
		--wait(0.3)
	end
	if HasVulnerabilityEffectApplied( unit ) then
		local projectileName = triggerArgs.SourceProjectile
		local effectName = triggerArgs.EffectName
		local showSpark = true
		if projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelVulnerabilitySpark then
			showSpark = false
		end

		if effectName and EffectData[effectName] and EffectData[effectName].CancelVulnerabilitySpark then
			showSpark = false
		end
		if showSpark then
			CreateAnimation({ Name = "HitSparkVulnerability", DestinationId = unitId })
			wait(0.3)
		end
	end

	local hasBackStabVulnerability = GetNumMetaUpgrades("BackstabMetaUpgrade") > 0
	if hitVulnerable then
		if not hasBackStabVulnerability and unit.IncomingDamageModifiers ~= nil then
			for i, modifier in pairs(unit.IncomingDamageModifiers) do
				if modifier.HitVulnerabilityMultiplier and modifier.HitVulnerabilityMultiplier > 1 then
					hasBackStabVulnerability = true
					break
				end
			end
		end
		if hasBackStabVulnerability then
			if CheckCooldown( "BackstabMessagePlayed", 0.8 ) then
				thread( InCombatText, unitId, "BackstabHit", 0.3, {OffsetY = offsetY - 40, FontSize = 16, SkipFlash = true, FadeDuration = 0.1 })
			else
			--	thread( InCombatText, unitId, "BackstabHit_Blank", nil, {OffsetY = offsetY - 40 })
			end
		end
	end
	ExitBudgetedPresentation( "SpecialHitPresentation" )
end

function WallHitPresentation( victim, triggerArgs )
	if triggerArgs.AttackerId == nil then
		return
	end
	local attacker = triggerArgs.AttackerTable
	if attacker ~= nil and attacker.HitText ~= nil then
		thread( InCombatText, victim.ObjectId, attacker.HitText )
		return
	end
	if triggerArgs.AttackerName and ObstacleData[triggerArgs.AttackerName] and ObstacleData[triggerArgs.AttackerName].HitText then
		thread( InCombatText, victim.ObjectId, ObstacleData[triggerArgs.AttackerName].HitText )
		return
	end

	if triggerArgs.SourceWeapon and WeaponData[triggerArgs.SourceWeapon] and WeaponData[triggerArgs.SourceWeapon].HitText then
		local combatText = WeaponData[triggerArgs.SourceWeapon].HitText
		if victim.IsDead then
			thread( PlayVoiceLines, WeaponData[triggerArgs.SourceWeapon].OnDestroyVoiceLines, true )
			if WeaponData[triggerArgs.SourceWeapon].KillText then
				combatText = WeaponData[triggerArgs.SourceWeapon].KillText
			end
			thread( InCombatText, victim.ObjectId, combatText )
		end
	else
		local damageSourceName = triggerArgs.AttackerName
		if EnemyData[damageSourceName] == nil and triggerArgs.AttackerId ~= CurrentRun.Hero.ObjectId then
			-- The enemy was damaged by something other than the player or another enemy, can probably assume it was the environment
			thread( InCombatText, victim.ObjectId, "WallSlamHit", 0.3, { OffsetY = -60, FontSize = 16, SkipFlash = true, FadeDuration = 0.1 } )
		end
	end
end

--[[
args are additional arguments held within a table, which can be
ImagePath, Group, LuaKey, LuaValue
]]--
function InCombatText( targetId, combatText, textDuration, args)

	if not CanStartBudgetedPresentation( "InCombatText" ) then
		return
	end

	if args == nil then
		args = {}
	end
	args.TargetId = targetId
	args.Text = combatText
	args.Duration = textDuration
	InCombatTextArgs(args)
	ExitBudgetedPresentation( "InCombatText" )

end

function InCombatTextArgs( args )

	if not ConfigOptionCache.ShowUIAnimations then
		return
	end

	if args.TargetId == nil or args.TargetId <= 0 then
		return
	end

	if args.Cooldown ~= nil and not CheckCooldown( args.Text, args.Cooldown ) then
		return
	end

	if args.Duration == nil then
		args.Duration = 0.4
	end

	if args.Angle == nil then
		args.Angle = 90
	end

	if args.Group == nil then
		args.Group = "Combat_UI_World"
	end

	if args.FadeDuration == nil then
		args.FadeDuration = 0.3
	end

	wait( args.PreDelay )

	local feedbackRiser = nil

	if args.ScreenSpace then
		feedbackRiser = CreateScreenComponent({ Name = "BlankObstacleNoTimeModifier", Group = args.Group, DestinationId = args.TargetId }).Id
		Attach({ Id = feedbackRiser, DestinationId = args.TargetId, OffsetX = args.OffsetX or 0, OffsetY = args.OffsetY or 55 })
	else
		feedbackRiser = SpawnObstacle({ Name = "BlankObstacleNoTimeModifier", Group = args.Group, DestinationId = args.TargetId, OffsetY = args.OffsetY or -140 })
	end

	if args.SkipRise then
		Attach({ Id = feedbackRiser, DestinationId = args.TargetId, OffsetY = args.OffsetY or 55 })
	end

	if not args.SkipFlash then
		CreateAnimation({  Name = "SkillProcFeedbackFx", DestinationId = feedbackRiser, OffsetY = -10, Scale = 1.0 })
	end

	local textJustification = "CENTER"
	local textOffsetX = 0
	if args.ImagePath ~= nil then
		args.Text = "@"..args.ImagePath.." "..args.Text
		textJustification = "LEFT"
		textOffsetX = -100
	end

	CreateTextBox({
		Id = feedbackRiser, Text = args.Text,
		Justification = textJustification,
		OffsetX = textOffsetX,
		OutlineThickness = 6.0,
		OutlineColor = {0.0, 0.0, 0.0, 1.0},
		Color = {0.95, 0.95, 0.95, 1},
		Font = "AlegreyaSansSCExtraBold",
		FontSize = args.FontSize or 24,
		TextSymbolScale = 0.8,
		LuaKey = args.LuaKey,
		LuaValue = args.LuaValue,
		ShadowOffsetY = 8,
		ShadowOffsetX = 0,
		ShadowBlur = 0,
		ShadowAlpha = 1,
		ShadowColor = {0,0,0,1},
		AutoSetDataProperties = false,
		})

	if not args.SkipRise then
		Move({ Id = feedbackRiser, Angle = args.Angle, Speed = 75 })
	end

	waitScreenTime(  args.Duration )
	ModifyTextBox({ Id = feedbackRiser, FadeTarget = 0, FadeDuration = args.FadeDuration, AutoSetDataProperties = false, })
	waitScreenTime( 0.41)
	Destroy({ Id = feedbackRiser })

end

function GunOutOfAmmoPresentation( attacker, weaponData )
	wait( 0.5, RoomThreadName )
	if not attacker.Reloading then
		thread( PlayVoiceLines, HeroVoiceLines.GunWeaponNeedToReloadVoiceLines , true )
	end
end

-- Gun Presentation
function GunFailedNoAmmoPresentation( weaponData )
	thread( PulseText, { Id = ScreenAnchors.GunUI, ScaleTarget = 1.2, ScaleDuration = 0.1, HoldDuration = 0, PulseBias = 0.5 } )

	-- thread( InCombatTextArgs, { TargetId =  CurrentRun.Hero.ObjectId, Text = weaponData.NoAmmoText, Cooldown = 2.0 } )

	PlaySound({ Name = weaponData.NoAmmoFireSound })
	thread( PlayVoiceLines, HeroVoiceLines.GunWeaponNeedToReloadVoiceLines, true )
end

function ReloadFailedAmmoFullPresentation( attacker, weaponData )
	thread( PulseText, { Id = ScreenAnchors.GunUI, ScaleTarget = 1.2, ScaleDuration = 0.1, HoldDuration = 0, PulseBias = 0.5 } )
	PlaySound({ Name = weaponData.NoAmmoFireSound })
end

function ReloadFailedMidReloadPresentation( attacker, weaponData )
	thread( PulseText, { Id = ScreenAnchors.GunUI, ScaleTarget = 1.1, ScaleDuration = 0.1, HoldDuration = 0.1, PulseBias = 0.1 } )
	-- thread( InCombatTextArgs, { TargetId =  CurrentRun.Hero.ObjectId, Text = weaponData.NoAmmoText, Cooldown = 2.0 } )
	PlaySound({ Name = weaponData.NoAmmoFireSound })
	thread( PlayVoiceLines, HeroVoiceLines.GunWeaponReloadingInProgressVoiceLines, true )
end

function ReloadPresentationStart( attacker, weaponData, state )
	if IsMoving({ Id = attacker.ObjectId }) then
		SetAnimation({ DestinationId = attacker.ObjectId, Name = weaponData.MovingReloadAnimation })
	else
		SetAnimation({ DestinationId = attacker.ObjectId, Name = weaponData.IdleReloadAnimation })
		FireWeaponFromUnit({ Weapon = "GunReloadSelf", AutoEquip = true, Id = attacker.ObjectId, DestinationId = attacker.ObjectId })
	end
	state.GunReloadDisplayId = CreateScreenObstacle({ Name = "GunReloadIndicator", Group = "Combat_UI", X = GunUI.StartX + GunUI.ReloadingOffsetX, Y = GunUI.StartY + GunUI.ReloadingOffsetY })
	-- state.ReloadSoundId = PlaySound({ Name = "/SFX/Player Sounds/ZagreusGunReloading", Id = attacker.ObjectId })
	--thread( InCombatText, CurrentRun.Hero.ObjectId, "GunReloadingStart" )
	thread( PlayVoiceLines, HeroVoiceLines.GunWeaponReloadingStartVoiceLines, true )
end

function ReloadPresentationComplete( attacker, weaponData, state )
	Flash({ Id = CurrentRun.Hero.ObjectId, Speed = 6, MinFraction = 0, MaxFraction = 1, Color = Color.White, Duration = 0.15, ExpireAfterCycle = false })
	StopSound({ Id = state.ReloadSoundId, Duration = 0.2 })
	PlaySound({ Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlash", Id = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/SFX/Menu Sounds/ObjectiveActivateShk2", Id = state.GunReloadDisplayId })
	CreateAnimation({ Name="GunReloadIndicatorComplete", DestinationId = state.GunReloadDisplayId, GroupName="Combat_UI" })
	Destroy({ Id = state.GunReloadDisplayId })
	thread( PlayVoiceLines, HeroVoiceLines.GunWeaponReloadCompleteVoiceLines, true )
end

function PlayerDodgePresentation( )
	if CheckCooldown( "DodgePresentation", 0.3 ) then
		thread( InCombatText, CurrentRun.Hero.ObjectId, "Combat_Dodge" )
		PlaySound({ Name = "/SFX/Player Sounds/HermesWhooshDodgeSFX", Id = CurrentRun.Hero.ObjectId })
		PlaySound({ Name = "/VO/ZagreusEmotes/EmoteDodgingAlt", Id = CurrentRun.Hero.ObjectId, Delay = 0.2 })
	end
end

OnEffectCanceled{
	function( triggerArgs)
		local cancelingWeaponName = triggerArgs.name
		local cancelingWeaponData = WeaponData[cancelingWeaponName]
		local canceledEffectNames = triggerArgs.EffectNames
		if cancelingWeaponData == nil then
			return
		end
		if cancelingWeaponData.CancelEffectSimSlowParameters and IsCancelSimEffectAllowed( cancelingWeaponData, canceledEffectNames ) then
			thread( DoWeaponCancelEffectSimulationSlow, cancelingWeaponData )
		end
		if cancelingWeaponData.Sounds ~= nil then
			DoWeaponSounds( cancelingWeaponData.Sounds.CancelEffectSounds, triggerArgs.TriggeredByTable )
		end
	end
}


function IsCancelSimEffectAllowed( cancelingWeaponData, canceledEffectNames )
	local ignoreEffects = cancelingWeaponData.IgnoreCancelSimOnEffects
	if ignoreEffects == nil then
		return true
	end
	if ContainsAny( ignoreEffects, canceledEffectNames ) then
		return false
	end
	return true
end

OnWeaponCharging{
	function( triggerArgs )
		local weaponData = GetWeaponData(triggerArgs.OwnerTable, triggerArgs.name)
		if weaponData == nil then
			return
		end
		thread( DoCameraMotion, weaponData.ChargeCameraMotion )
		thread( DoWeaponScreenshake, weaponData.ChargeScreenshake, CurrentRun.Hero.ObjectId, triggerArgs.SourceProjectile )

		if weaponData.Sounds ~= nil then
			DoWeaponSounds( weaponData.Sounds.ChargeSounds, triggerArgs.OwnerTable )
		end
		StopWeaponSounds( "Charge", weaponData.Sounds, triggerArgs.OwnerTable )
	end
}

function DoWeaponScreenshake( screenshakeData, attackerId, projectileName, effectName )
	if screenshakeData == nil then
		return
	end

	if projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelCameraShake == true then
		return
	end

	if effectName and EffectData[effectName] and EffectData[effectName].CancelCameraShake == true then
		return
	end

	if wrathPresentation then
		return
	end

	if not CanStartBudgetedPresentation("DoWeaponScreenshake") then
		return
	end

	if screenshakeData.DynamicAngleOffset then
		screenshakeData.Angle = GetPlayerAngle() + screenshakeData.DynamicAngleOffset
	end
	ShakeScreen( screenshakeData )
	wait( screenshakeData.Duration )

	ExitBudgetedPresentation("DoWeaponScreenshake")
end

function DoUnitArmorShake( args )
	local projectileName = args.SourceProjectile
	local effectName = args.EffectName

	if projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelArmorUnitShake == true then
		return
	end

	if effectName and EffectData[effectName] and EffectData[effectName].CancelArmorUnitShake == true then
		return
	end

	if not CanStartBudgetedPresentation("DoUnitArmorShake") then
		return
	end

	local armorId = EnemyHealthDisplayAnchors[args.triggeredById.."armor"]
	if armorId ~= nil and not (projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelUnitHitFlash == true) then
		Flash({ Id = armorId, Speed = 3, MinFraction = 1, MaxFraction = 0, Color = Color.White, Duration = 0.15, ExpireAfterCycle = true })
	end
	Shake({ Id = args.triggeredById, Distance = 10, Speed = 650, Duration = 0.15, Angle = angle })
	if not (projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelUnitHitFlash == true) then
		Flash({ Id = args.triggeredById, Speed = 2, MinFraction = 1.0, MaxFraction = 0.0, Color = Color.ArmorFlashGold, Duration = 0.24, ExpireAfterCycle = true })
	end
	wait(0.15)
	ExitBudgetedPresentation("DoUnitArmorShake")
end

function DoUnitShake( args )
	local projectileName = args.SourceProjectile
	local effectName = args.EffectName

	if projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelUnitShake == true then
		return
	end

	if effectName and EffectData[effectName] and EffectData[effectName].CancelUnitShake == true then
		return
	end

	if not CanStartBudgetedPresentation("DoUnitShake") then
		return
	end

	Shake({ Id = args.triggeredById, Distance = 6, Speed = 550, Duration = 0.15, Angle = angle })
	wait(0.15)

	ExitBudgetedPresentation("DoUnitShake")
end

function DoUnitHitFlash( args )
	local projectileName = args.SourceProjectile
	local effectName = args.EffectName

	if projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelUnitHitFlash == true then
		return
	end

	if effectName and EffectData[effectName] and EffectData[effectName].CancelUnitHitFlash == true then
		return
	end

	if not CanStartBudgetedPresentation("DoUnitFlash") then
		return
	end

	Flash({ Id = args.triggeredById, Speed = 0.85, MinFraction = 1.0, MaxFraction = 0.0, Color = Color.Red, Duration = 0.03, ExpireAfterCycle = true })

	ExitBudgetedPresentation("DoUnitHitFlash")

end

function DoUnitArmorSpark( args )
	local projectileName = args.SourceProjectile
	local effectName = args.EffectName

	if projectileName and ProjectileData[projectileName] and ProjectileData[projectileName].CancelArmorSpark == true then
		return
	end

	if effectName and EffectData[effectName] and EffectData[effectName].CancelArmorSpark == true then
		return
	end

	local victim = args.TriggeredByTable
	if victim == nil then
		return
	end

	if not CanStartBudgetedPresentation("DoUnitArmorSpark") then
		return
	end

	CreateAnimation({ Name = "HitSparkArmor", DestinationId = args.triggeredById, Scale = victim.HitSparkScale, OffsetZ = victim.HitSparkOffsetZ or args.ImpactLocationZ })
	wait( CombatPresentationCaps.CreateAnimationMagicWaitTime )
	ExitBudgetedPresentation("DoUnitArmorSpark")
end

function DoWeaponSounds( soundData , parentTable )
	if soundData == nil or parentTable == nil then
		return
	end

	for _, soundDatum in pairs(soundData) do
		local inCooldown = soundDatum.Cooldown and not CheckCooldown( soundDatum.Name, soundDatum.Cooldown )
		if not inCooldown and soundDatum.Name ~= nil then
			local soundId = PlaySound({ Name = soundDatum.Name, Id = parentTable.ObjectId })
			-- We only need to store a soundId if they need to be stopped elsewhere
			if soundDatum.StoppedBy ~= nil then
				if parentTable.PlayingSounds == nil then
					parentTable.PlayingSounds = {}
				end
				local soundKey = soundDatum.Name
				if soundDatum.Key ~= nil then
					soundKey = soundDatum.Key
				end
				parentTable.PlayingSounds[soundKey] = soundId
			end
		end
	end
end

function StopWeaponSounds(soundEvent, soundData, parentTable )
	if soundData == nil or parentTable == nil or parentTable.PlayingSounds == nil then
		return
	end
	for _, soundCategory in pairs(soundData) do
		for index, soundElement in pairs(soundCategory) do
			if soundElement.StoppedByLookup ~= nil and soundElement.StoppedByLookup[soundEvent] then
				local soundKey = soundElement.Name
				if soundElement.Key ~= nil then
					soundKey = soundElement.Key
				end
				StopSound({ Id = parentTable.PlayingSounds[soundKey], Duration = 0.2 })
			end
		end
	end
end

function DoCameraMotion( cameraData )
	if cameraData == nil or cameraData.ZoomType == "None" then
		return
	end
	local defaultZoom = 1.0
	if CurrentDeathAreaRoom ~= nil then
		defaultZoom = CurrentDeathAreaRoom.ZoomFraction or defaultZoom
	else
		defaultZoom = CurrentRun.CurrentRoom.ZoomFraction or defaultZoom
	end
	local relativeCameraData = ShallowCopyTable( cameraData )
	if relativeCameraData.Fraction ~= nil then
		relativeCameraData.Fraction = relativeCameraData.Fraction * defaultZoom
	end
	waitScreenTime(  relativeCameraData.ScreenPreWait )
	if relativeCameraData.ZoomType ~= nil then
		FocusCamera( relativeCameraData )
	else
		PanCamera( relativeCameraData )
	end
	local additionalCameraWait = relativeCameraData.HoldDuration or 0
	if relativeCameraData.RestoreDefaultDuration then
		waitScreenTime( relativeCameraData.Duration + additionalCameraWait )
		FocusCamera({ Fraction = defaultZoom, Duration = relativeCameraData.RestoreDefaultDuration })
	end
end

function DoWeaponFireSimulationSlow( weaponData )
	if weaponData == nil or weaponData.FireSimSlowParameters == nil then
		return
	end
	if not IsEmpty( MapState.SimSpeedChanges ) then
		return
	end
	for k, simData in ipairs( weaponData.FireSimSlowParameters ) do
		waitScreenTime(  simData.ScreenPreWait )
		if simData.Fraction < 1.0 then
			AddSimSpeedChange( "WeaponFire", { Fraction = simData.Fraction, LerpTime = simData.LerpTime } )
		else
			RemoveSimSpeedChange( "WeaponFire", { LerpTime = simData.LerpTime } )
		end
	end
end

function DoWeaponNearbyEnemyFireSimulationSlow( weaponData, ownerTable )
	if weaponData == nil or weaponData.NearbyEnemyFireSimSlowParameters == nil then
		return
	end
	local nearbyEnemyUnit = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationNames = { "GroundEnemies", "FlyingEnemies" }, Distance = weaponData.NearbyEnemyFireSimSlowDistance })
	if nearbyEnemyUnit == 0 then
		return
	end
	if weaponData.Sounds then
		thread( DoWeaponSounds, weaponData.Sounds.NearbyEnemyFireSounds, ownerTable )
	end
	if weaponData.SimSlowBlur then
		thread( DoWeaponRadialBlur, weaponData.SimSlowBlur )
	end
	if not IsEmpty( MapState.SimSpeedChanges ) then
		return
	end
	for k, simData in ipairs( weaponData.NearbyEnemyFireSimSlowParameters ) do
		waitScreenTime(  simData.ScreenPreWait )
		if simData.Fraction < 1.0 then
			AddSimSpeedChange( "WeaponNearbyEnemyFire", { Fraction = simData.Fraction, LerpTime = simData.LerpTime } )
		else
			RemoveSimSpeedChange( "WeaponNearbyEnemyFire", { LerpTime = simData.LerpTime } )
		end
	end
end

function DoWeaponCancelEffectSimulationSlow( weaponData )
	if weaponData == nil or weaponData.CancelEffectSimSlowParameters == nil then
		return
	end
	if not IsEmpty( MapState.SimSpeedChanges ) then
		return
	end
	for k, simData in ipairs( weaponData.CancelEffectSimSlowParameters ) do
		waitScreenTime(  simData.ScreenPreWait )
		if simData.Fraction < 1.0 then
			AddSimSpeedChange( "WeaponCancelEffect", { Fraction = simData.Fraction, LerpTime = simData.LerpTime } )
		else
			RemoveSimSpeedChange( "WeaponCancelEffect", { LerpTime = simData.LerpTime } )
		end
	end
end

function DoWeaponHitSimulationSlow( args )
	local attackerId = args.AttackerId
	local defenderId = args.DefenderId
	local weaponData = GetWeaponData(args.AttackerTable, args.SourceWeapon)
	local damageCrit = args.IsCrit
	local damageVulnerability = args.IsVulnerability
	local defenderData = args.TriggeredByTable
	local projectileData = nil
	local effectData = nil

	if args.SourceProjectile ~= nil then
		projectileData = ProjectileData[args.SourceProjectile]
	end

	if args.EffectName ~= nil then
		effectData = EffectData[args.EffectName]
	end

	if not IsEmpty( MapState.SimSpeedChanges ) then
		return
	end

	if args.ProjectileDeflected or weaponData == nil or weaponData.HitSimSlowParameters == nil or ( projectileData and projectileData.CancelSlowFrames ) or ( effectData and effectData.CancelSlowFrames ) then
		return
	end
	if defenderData ~= nil and not defenderData.SimulationSlowOnHit and defenderData.ObjectId ~= CurrentRun.Hero.ObjectId then
		return
	end

	if attackerId ~= CurrentRun.Hero.ObjectId and defenderData ~= nil and defenderData.ObjectId ~= CurrentRun.Hero.ObjectId then
		return
	end

	local criticalSlowHoldTime = 0
	local criticalCooldownTime = weaponData.HitSimSlowCooldown or 0
	if criticalCooldownTime == 0 or CheckCooldown( weaponData.Name, criticalCooldownTime ) then
		for k, simData in ipairs( weaponData.HitSimSlowParameters ) do
			if ShouldIncreasePlayerHitPause( args ) then
				if( k == 2) then
					criticalSlowHoldTime = 0.04
				end
			end
			waitScreenTime(  (simData.ScreenPreWait + criticalSlowHoldTime) )
			if simData.Fraction < 1.0 then
				AddSimSpeedChange( "WeaponHit", { Fraction = simData.Fraction, LerpTime = simData.LerpTime } )
			else
				RemoveSimSpeedChange( "WeaponHit", { LerpTime = simData.LerpTime } )
			end
		end
	end
end

function AddSimSpeedChange( name, args )
	if not args.Priority and not IsEmpty( MapState.SimSpeedChanges ) then
		return
	end
	MapState.SimSpeedChanges[name] = args
	AdjustSimulationSpeed({ Fraction = args.Fraction, LerpTime = args.LerpTime })
end

function RemoveSimSpeedChange( name, args )
	MapState.SimSpeedChanges[name] = nil
	if IsEmpty( MapState.SimSpeedChanges ) then
		AdjustSimulationSpeed({ Fraction = 1.0, LerpTime = args.LerpTime })
	end
end

function ShouldIncreasePlayerHitPause( args )
	if args.IsCrit then
		return true
	end
	if args.IsVulnerability then
		-- return true -- don't increase hit pause for backstabs
	end
	if args.TriggeredByTable ~= nil and args.TriggeredByTable.IsDead then
		return true
	end

	return false
end

function DoWeaponRadialBlur( blurInfo )
	AdjustRadialBlurDistance({ Fraction = blurInfo.Distance, Duration = blurInfo.FXInTime })
	AdjustRadialBlurStrength({ Fraction = blurInfo.Strength, Duration = blurInfo.FXInTime })
	waitScreenTime(  blurInfo.FXHoldTime )
	AdjustRadialBlurDistance({ Fraction = 0, Duration = blurInfo.FXOutTime })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = blurInfo.FXOutTime })
end

function LastKillPresentation( unit )
	DebugPrint({ Text = "Last Kill Playing" })
	local unitId = unit.ObjectId

	HideCombatUI()
	SetPlayerInvulnerable( "LastKill" )
	waitScreenTime(  0.15 )
	AddInputBlock({ Name = "LastKill" })

	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 0.0, DataValue = false, DestinationNames = { "HeroTeam" } })
	thread( LastAttackHold, 0.5 )

	local lastKillFxInTime = 0.08
	local lastKillFxOutTime = 0.4

	AdjustRadialBlurDistance({ Fraction = 0.25, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0.85, Duration = lastKillFxInTime })
	AdjustFrame({ Duration = lastKillFxInTime, Fraction = 1.25 })
	AdjustFullscreenBloom({ Name = "LastKillBloom", Duration = 0 })
	AddSimSpeedChange( "LastKill", { Fraction = 0.35, LerpTime = lastKillFxInTime, Priority = true } )
	SetInvulnerable({ Id = CurrentRun.Hero.ObjectId })
	if not CurrentRun.CurrentRoom.SkipLastKillSound then
		PlaySound({ Name = "/Leftovers/Menu Sounds/PlayerKilledLong_Medium", Id = unitId })
	end
	waitScreenTime(  0.6 )

	AdjustRadialBlurStrength({ Fraction = 0, Duration = lastKillFxOutTime })
	AdjustFrame({ Duration = lastKillFxOutTime, Fraction = 0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = lastKillFxOutTime })
	RemoveSimSpeedChange( "LastKill", { LerpTime = lastKillFxOutTime } )
	waitScreenTime(  0.2 )

	ShowCombatUI()
	thread( LastKillVulnerable )
end

function LastAttackHold( holdDuration )
	waitScreenTime(  holdDuration )
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, AllProjectiles = true })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, DestinationNames = { "HeroTeam" } })
	RemoveInputBlock({ Name = "LastKill" })
end

function LastKillVulnerable()
	wait( 1.0 )
	SetPlayerVulnerable( "LastKill" )
end

function LastKillPresentationBoss( unit )
	DebugPrint({ Text = "Boss Kill Presentation" })
end

function BossChillKillPresentation(unit)
	AddSimSpeedChange( "ChillKill", { Fraction = 0.005, LerpTime = 0 } )
	local dropLocation = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = unit.ObjectId })
	AdjustColorGrading({ Name = "Frozen", Duration = 0.4 })
	CreateAnimation({ DestinationId = dropLocation, Name = "DemeterWinterHarvest" })
	thread( PlayVoiceLines, GlobalVoiceLines.DemeterFatalityVoiceLines, true )
	waitScreenTime( 0.86) -- 52 frames for DemeterWinterHarvest Scythe to appear before slicing
	CreateAnimation({ DestinationId = dropLocation, Name = "DemeterBossIceShatter" })
	waitScreenTime( 0.85)
	AdjustColorGrading({ Name = "Off", Duration = 0.4 })
	RemoveSimSpeedChange( "ChillKill", { LerpTime = 0.3 } )
	Destroy({ Id = dropLocation })
end

function HarpyKillPresentation( unit, args )
	DebugPrint({ Text = "Harpy Kill Presentation: " })

	local allBossesDead = true
	if CurrentRun.CurrentRoom.Encounter.HoldKillPresentationForUnitDeaths ~= nil then
		for k, unitName in pairs(CurrentRun.CurrentRoom.Encounter.HoldKillPresentationForUnitDeaths) do
			if unitName ~= unit.Name then
				local unitId = GetClosestUnitOfType({ Id = unit.ObjectId, DestinationName = unitName })
				if ActiveEnemies[unitId] ~= nil and IsAlive({ Id = unitId }) then
					allBossesDead = false
				end
			end
		end
	end

	if not allBossesDead then
		LastKillPresentation(unit)
		return
	end

	local killerId = CurrentRun.Hero.ObjectId
	local victimId = unit.ObjectId
	local deathPanSettings = args
	ClearEffect({ Ids = { victimId, killerId }, All = true, BlockAll = true, })
	StopSuper()
	SetInvulnerable({ Id = victimId })


	if unit.DeathFx ~= nil then
		CreateAnimation({ Name = unit.DeathFx, DestinationId = unit.ObjectId, Angle = args.ImpactAngle })
		unit.DeathFx = nil
	end
	if unit.DeathAnimation ~= nil then
		SetAnimation({ Name = unit.DeathAnimation, DestinationId = unit.ObjectId })
		unit.DeathAnimation = nil
	end
	if unit.DeathSound ~= nil then
		PlaySound({ Name = unit.DeathSound, Id = unit.ObjectId })
		unit.DeathSound = nil
	end
	if unit.BossKillVoiceLines ~= nil then
		thread( PlayVoiceLines, unit.BossKillVoiceLines, false, unit )
	end

	BlockProjectileSpawns({ ExcludeProjectileName = "SpearWeaponThrow" })
	ExpireProjectiles({ Names = { "DionysusLobProjectile", "LightRangedWeapon", "HarpyBeam", "HydraLavaSpit", "HarpyWhipShot", "HarpyWhipShotRage", "TheseusSpearThrow", "ShieldThrow" }, BlockSpawns = true })
	SetPlayerInvulnerable( "HarpyKillPresentation" )
	SetThingProperty({ Property = "AllowAnyFire", Value = false, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
	EndRamWeapons({ Id = killerId })

	AddInputBlock({ Name = "HarpyKillPresentation" })
	AddTimerBlock( CurrentRun, "InterBiome" )
	AddTimerBlock( CurrentRun, "HarpyKillPresentation" )
	SetConfigOption({ Name = "UseOcclusion", Value = false })
	SetVulnerable({ Id = victimId })
	ClearCameraClamp({ LerpTime = 0 })
	local cameraPanTime = 1.5
	if deathPanSettings.StartPanTime then
		cameraPanTime = deathPanSettings.StartPanTime
	end
	PanCamera({ Id = victimId, Duration = cameraPanTime })
	FocusCamera({ Fraction = 1.1, Duration = cameraPanTime })
	ZeroMouseTether("HarpyKillPresentation")
	DisableCombatControls()
	HideCombatUI("BossKill")

	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAscended" })

	if IsScreenOpen("Codex") then
		CloseCodexScreen()
	end

	if IsScreenOpen("TraitTrayScreen") then
		CloseAdvancedTooltipScreen()
	end

	if deathPanSettings.StartSound then
		PlaySound({ Name = deathPanSettings.StartSound })
	else
		PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteShocked" })
	end
	SetMusicSection( 10, MusicId )

	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 0.0, DataValue = false, DestinationId = killerId })
	SetThingProperty({ Property = "Grip", Value = 99999, DestinationId = victimId })
	thread( VictimDeathHold, victimId, 0.02, 0.5 )
	if deathPanSettings.FlashRed then
		Flash({ Id = victimId, Speed = 0.01, MinFraction = 1.0, MaxFraction = 1.0, Color = Color.Red, Duration = 0.5, ExpireAfterCycle = true })
	end

	RemoveFromGroup({ Id = killerId, Names = { "Standing" } })
	AddToGroup({ Id = killerId, Name = "Combat_Menu", DrawGroup = true })
	RemoveFromGroup({ Id = victimId, Name = "Standing" })
	--AddToGroup({ Id = victimId, Name = "Events", DrawGroup = true })

	if deathPanSettings.EndAngle then
		SetGoalAngle({ Id = victimId, Angle = deathPanSettings.EndAngle })
	end

	-- black out world
	AdjustFrame({ Color = Color.TransparentRed, Duration = 0.0, Fraction = 0 })
	ScreenAnchors.DeathBackground = ScreenAnchors.DeathBackground or CreateScreenObstacle({ Name = "rectangle01", Group = "Combat_UI", X = ScreenCenterX, Y = ScreenCenterY })
	SetScale({ Id = ScreenAnchors.DeathBackground, Fraction = 10 })
	SetColor({ Id = ScreenAnchors.DeathBackground, Color = Color.Black })
	SetAlpha({ Id = ScreenAnchors.DeathBackground, Fraction = 1.0, Duration = 0 })

	thread( DoRumble, { { ScreenPreWait = 0.04, RightFraction = 0.17, Duration = 0.65 }, { ScreenPreWait = 2.8, LeftFraction = 0.3, Duration = 0.6 } } )

	thread( BossDeathFlash, 0.52, 0.3 )

	wait( 0.15 )
	SetAlpha({ Id = killerId, Fraction = 0, Duration = 0.3 })
	ClearEffect({ Id = killerId, Name = "KillDamageBonus" })

	wait( cameraPanTime )

	thread( DisplayLocationText, nil, { Text = deathPanSettings.Message or "BiomeClearedMessage", Delay = args.MessageDelay or 0.95, Color = Color.White, FadeColor = Color.LocationTextGold, Layer = args.MessageLayer, Duration = args.MessageDuration, AnimationName = "LocationTextBGVictory", AnimationOutName = "LocationTextBGVictoryOut", FontScale = 0.85 } )

	if deathPanSettings.BatsAfterDeath then
		thread( SendCritters, { MinCount = 80, MaxCount = 90, StartX = 0, StartY = 300, MinAngle = 75, MaxAngle = 115, MinSpeed = 400, MaxSpeed = 2000, MinInterval = 0.03, MaxInterval = 0.1, GroupName = "CrazyDeathBats" } )
	end

	if deathPanSettings.EndPanTime then
		wait( deathPanSettings.EndPanTime )
	else
		wait( 5.5 )
	end

	SetAlpha({ Id = ScreenAnchors.DeathBackground, Fraction = 0.0, Duration = 0.3 })

	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, AllProjectiles = true })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, DestinationId = killerId })
	SetAlpha({ Id = killerId, Fraction = 1.00, Duration = 0.3 })
	RemoveFromGroup({ Id = killerId, Names = { "Combat_Menu" } })
	AddToGroup({ Id = killerId, Name = "Standing", DrawGroup = true })

	PanCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 3.0, EaseOut = 0.5 })
	FocusCamera({ Fraction = CurrentRun.CurrentRoom.ZoomFraction or 1.0, Duration = 3.0, ZoomType = "Ease" })

	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFadeLOCATION" })
	SetVolume({ Id = MusicId, Value = 1, Duration = 0.5 })

	wait( 1.0 )
	RemoveInputBlock({ Name = "HarpyKillPresentation" })
	RemoveTimerBlock( CurrentRun, "HarpyKillPresentation" )
	SetConfigOption({ Name = "UseOcclusion", Value = true })
	SetPlayerVulnerable( "HarpyKillPresentation" )
	ShowCombatUI("BossKill")
	ClearEffect({ Ids = { killerId }, All = true })
	EnableCombatControls()
	SetThingProperty({ Property = "AllowAnyFire", Value = true, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
end

function HarpyEnragedPresentation(enemy, currentRun)
	local screenId = ScreenAnchors.BossRageFill

	if enemy.PermanentEnraged then
		thread( InCombatText, enemy.ObjectId, "Combat_PermanentEnraged", 1 )
	else
		thread( InCombatText, enemy.ObjectId, "Combat_Enraged", 1 )
	end

	AdjustColorGrading({ Name = "AlectoRage", Duration = 0.5 })
	ShakeScreen({ Speed = 600, Distance = 6, FalloffSpeed = 2000, Duration = 1.0 })
	Flash({ Id = screenId, Speed = 2.0, MinFraction = 0, MaxFraction = 0.8, Color = Color.Purple })

	if enemy.RageFullVoiceLines ~= nil then
		thread( PlayVoiceLines, enemy.RageFullVoiceLines, nil, enemy )
	end
	if enemy.RageFullSound ~= nil then
		PlaySound({ Name = enemy.RageFullSound })
	end

	if not enemy.PermanentEnraged then
		thread( DrainHarpyRageMeter, enemy, currentRun, enemy.EnragedDuration)
	end
end

function TheseusEnragedPresentation(enemy, currentRun)
	local screenId = ScreenAnchors.BossRageFill

	-- thread( InCombatText, enemy.ObjectId, "Combat_PermanentEnraged", 1 )

	ShakeScreen({ Speed = 600, Distance = 6, FalloffSpeed = 2000, Duration = 1.0 })
	Flash({ Id = screenId, Speed = 2.0, MinFraction = 0, MaxFraction = 0.8, Color = Color.Purple })

	if enemy.RageFullVoiceLines ~= nil then
		thread( PlayVoiceLines, enemy.RageFullVoiceLines, nil, enemy )
	end
	if enemy.RageFullSound ~= nil then
		PlaySound({ Name = enemy.RageFullSound })
	end
end

function MinotaurEnragedPresentation(enemy, currentRun)
	TheseusEnragedPresentation(enemy, currentRun)
end

function DrainHarpyRageMeter(enemy, currentRun, duration)
	local tickDuration = duration * 0.01

	local fraction = 0.00
	for tick=1, 100 do
		if enemy.PermanentEnraged then
			return
		end
		fraction = fraction + 0.01
		SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = fraction, DestinationId = ScreenAnchors.BossRageFill })
		wait( tickDuration, RoomThreadName )
	end
end

function CastEmbeddedPresentationStart( )
	if ScreenAnchors.hadesBloodstoneVignetteAnchor == nil then
		ScreenAnchors.hadesBloodstoneVignetteAnchor = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Scripting", X = ScreenCenterX, Y = ScreenCenterY })
		ScreenAnchors.HadesBloodstoneVignette = SpawnObstacle({ Name = "BlankObstacle", DestinationId = ScreenAnchors.hadesBloodstoneVignetteAnchor, Group = "Combat_UI" })
		CreateAnimation({ Name = "HadesBloodstoneVignette", DestinationId = ScreenAnchors.HadesBloodstoneVignette })
		DrawScreenRelative({ Ids = { ScreenAnchors.HadesBloodstoneVignette } })
		if CurrentRun and CurrentRun.Hero then
			CreateAnimation({ Name = "HadesDebuff", DestinationId = CurrentRun.Hero.ObjectId })
		end
	end

	thread( PlayVoiceLines, HeroVoiceLines.HitByHadesAmmoVoiceLines, true )

	thread( InCombatText, CurrentRun.Hero.ObjectId, "HitByHadesAmmo", 0.8 )
--	AdjustColorGrading({ Name = "HadesBloodstone", Duration = 0.1 })

end

function CastEmbeddedPresentationEnd( )
	-- AdjustColorGrading({ Name = "Off", Duration = 0.4 })
	if ScreenAnchors.hadesBloodstoneVignetteAnchor ~= nil then
		SetAlpha({ Id = ScreenAnchors.HadesBloodstoneVignette, Fraction = 0, Duration = 0.25 })
		wait( 0.25 )
		Destroy({ Id = ScreenAnchors.HadesBloodstoneVignette })
		Destroy({ Id = ScreenAnchors.hadesBloodstoneVignetteAnchor })
		ScreenAnchors.hadesBloodstoneVignetteAnchor = nil
		if CurrentRun and CurrentRun.Hero then
			StopAnimation({ Name = "HadesDebuff", DestinationId = CurrentRun.Hero.ObjectId })
		end
	end
end

function BossDeathFlash( startDelay, stopDelay )
	wait( startDelay )
	local zagreusDeathFlash = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu_Overlay" })
	SetAnimation({ DestinationId = zagreusDeathFlash.Id, Name = "ZagreusDeathFlash" })
	wait( stopDelay )
	Destroy({ Id = zagreusDeathFlash.Id })
end

function HydraKillPresentation( unit, args )

	AddTimerBlock( CurrentRun, "HydraKillPresentation" )
	SetPlayerInvulnerable( "HydraKillPresentation" )

	PlaySound({ Name = "/SFX/StabSplatterEndSequence" })
	PlaySound({ Name = "/SFX/Enemy Sounds/HydraHead/EmoteFinalDying1", Id = unit.ObjectId })
	HarpyKillPresentation( unit, args )

	local currentRoom = CurrentRun.CurrentRoom
	for k, id in pairs( GetIds({ Name = currentRoom.ExitGroupName }) ) do
		local offset = CalcOffset(math.rad(-30), 1000)
		Move({ Id = id, DestinationId = id, OffsetX = offset.X, OffsetY = offset.Y, Duration = 2.5, EaseOut = 0.8 })
	end

	RemoveTimerBlock( CurrentRun, "HydraKillPresentation" )
	SetPlayerVulnerable( "HydraKillPresentation" )

end

function TheseusMinotaurKillPresentation( unit, args )
	SetPlayerInvulnerable( "TheseusMinotaurKillPresentation" )

	local bothBossesDead = false
	if CurrentRun.CurrentRoom.Encounter.CheckComboPartnerForKillPresentation then
		local partnerId = GetClosestUnitOfType({ Id = unit.ObjectId, DestinationName = unit.ComboPartnerName })
		if partnerId == 0 or RequiredKillEnemies[partnerId] == nil or RequiredKillEnemies[partnerId].IsDead or RequiredKillEnemies[partnerId].Health <= 0 then
			bothBossesDead = true
		end
	end

	if unit.Name == "Theseus" then
		ExpireProjectiles({ Name = "TheseusSpearThrow" })
		wait(0.01, RoomThreadName)
		Destroy({ Ids = GetIdsByType({ Name = "TheseusSpearReturnPoint" }) })
	end

	if bothBossesDead then
		AddTimerBlock( CurrentRun, "TheseusMinotaurKillPresentation" )
		PlaySound({ Name = "/SFX/StabSplatterEndSequence" })
		DestroyRequiredKills( { BlockLoot = true } )
		unit.DestroyDelay = 0.5
		HarpyKillPresentation( unit, args )
		RemoveTimerBlock( CurrentRun, "TheseusMinotaurKillPresentation" )
	else
		LastKillPresentation(unit)
	end

	SetPlayerVulnerable( "TheseusMinotaurKillPresentation" )

	thread( CrowdReactionPresentation, { EmoteName = "StatusIconSmile", IntervalDuration = 0.02, Sound = "/SFX/TheseusCrowdChant", ReactionChance = 1.0, Delay = 3.0, Requirements = { RequiredRoom = "C_Boss01" } } )

end

function CrawlerMiniBossKillPresentation( unit, args )
	LastKillPresentation(unit)
end

function HadesPhaseTransition(boss, currentRun, aiStage)
	boss.InTransition = true
	if boss.IsInvisible then
		boss.IsInvisible = false

		SetLifeProperty({ DestinationId = boss.ObjectId, Property = "InvulnerableFx", Value = "Invincibubble_Hades" })
		SetAlpha({ Id = boss.ObjectId, Fraction = 1.0 })
	end

	Stop({ Id = boss.ObjectId })
	if CurrentRun.Hero.SuperActive then
		StopSuper()
		local decrement = CurrentRun.Hero.SuperMeterDecrement or 0
		CurrentRun.Hero.SuperMeter = CurrentRun.Hero.SuperMeter - ( decrement - CurrentRun.Hero.CurrentSuperMeterDecrement )
		CurrentRun.Hero.CurrentSuperMeterDecrement = CurrentRun.Hero.SuperMeterDecrement
		UpdateSuperMeterUI()
	end

	SetPlayerInvulnerable( "HadesPhaseTransition" )
	ClearStoredAmmoHero()
	DestroyHadesFightObstacles()
	DestroyRequiredKills( { BlockLoot = true, SkipIds = { boss.ObjectId }, BlockDeathWeapons = true } )
	ExpireProjectiles({ Names = { "HadesCast", "HadesAmmoDrop", "HadesAmmoWeapon", "GraspingHands", "HadesTombstoneSpawn", "HadesCastBeam", "HadesCastBeamNoTracking" } })
	SetAnimation({ Name = "HadesBattleKnockDown", DestinationId = boss.ObjectId })
	ClearShadeWeapons()
	thread(LastKillPresentation, boss )

	local ammoIds = GetIdsByType({ Name = "AmmoPack" })
	SetObstacleProperty({ Property = "Magnetism", Value = 3000, DestinationIds = ammoIds })
	SetObstacleProperty({ Property = "MagnetismSpeedMax", Value = currentRun.Hero.LeaveRoomAmmoMangetismSpeed, DestinationIds = ammoIds })
	StopAnimation({ DestinationIds = ammoIds, Name = "AmmoReturnTimer" })

	thread( PlayVoiceLines, boss.PhaseEndedVoiceLines, nil, boss )

	SetMusicSection( 1 )

	wait(1.25, boss.AIThreadName)

	ProcessTextLines( boss.BossPresentationNextStageTextLineSets )
	ProcessTextLines( boss.BossPresentationNextStageRepeatableTextLineSets )

	if TextLinesRecord["HadesR1FirstWin"] then
		wait( 0.5, RoomThreadName )
	else
		wait( 2.0, RoomThreadName )
	end

	if not PlayRandomRemainingTextLines( boss, boss.BossPresentationNextStageTextLineSets ) then
		PlayRandomRemainingTextLines( boss, boss.BossPresentationNextStageRepeatableTextLineSets )
	end

	wait(1.0, boss.AIThreadName)

	SetMusicSection( 2 )

	thread( PlayVoiceLines, boss.NextPhaseVoiceLines, nil, boss )

	SetAnimation({ Name = "HadesBattleKnockDownRecover", DestinationId = boss.ObjectId })
	if boss.Phase2ActivateGroups ~= nil then
		Activate({ Names = boss.Phase2ActivateGroups })
		SetAlpha({ Names = boss.Phase2ActivateGroups, Fraction = 0.0 })
		SetAlpha({ Names = boss.Phase2ActivateGroups, Fraction = 1.0, Duration = 0.3 })
	end
	if boss.Phase2DeactivateGroups ~= nil then
		SetAlpha({ Names = boss.Phase2DeactivateGroups, Fraction = 0.0, Duration = 0.3 })
	end

	boss.Health = boss.MaxHealth
	BossHealthBarPresentation( boss )

	wait(0.65, boss.AIThreadName)

	SetPlayerVulnerable( "HadesPhaseTransition" )
	FireWeaponFromUnit({ Id = boss.ObjectId, Weapon = "HadesRubbleClear", DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true })

	if boss.Phase2VFX ~= nil then
		CreateAnimation({ Name = boss.Phase2VFX, DestinationId = boss.ObjectId })
	end

	boss.CurrentPhase = boss.CurrentPhase + 1
	SetVulnerable({ Id = boss.ObjectId })
	wait(0.5, boss.AIThreadName)
	boss.InTransition = false

end

function ClearShadeWeapons()
	local weaponIds = GetIdsByType({ Names = EnemyData.ShadeNaked.AIPickupType })
	Destroy({ Ids = weaponIds })
end

function HadesKillPresentation( unit, args )
	DebugPrint({ Text = "Hades Kill Presentation: " })
	unit.InTransition = true
	local killerId = CurrentRun.Hero.ObjectId
	local victimId = unit.ObjectId
	local deathPanSettings = args
	--Endless mod
	AddTrait( CurrentRun.Hero, "EndlessModLoop" )
	CurrentRun.RoomCreations = {}
	CurrentRun.BlockedEncounters = {}
	CurrentRun.ClosedDoors = {}
	CurrentRun.CompletedStyxWings = 0
	CurrentRun.BiomeRoomCountCache = {}
	CurrentRun.RoomCountCache = {}
	CurrentRun.RoomHistory = {}
	CurrentRun.EncountersCompletedCache = {}
	CurrentRun.EncountersOccuredCache = {}
	CurrentRun.EncountersOccuredBiomedCache = {}
	--/
	ClearEffect({ Ids = { victimId, killerId }, All = true, BlockAll = true, })
	StopSuper()
	ClearStoredAmmoHero()
	DestroyHadesFightObstacles()
	ExpireProjectiles({ Names = { "HadesCast", "HadesAmmoDrop", "HadesAmmoWeapon", "GraspingHands", "HadesTombstoneSpawn", "HadesCastBeam", "HadesCastBeamNoTracking" } })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	local ammoIds = GetIdsByType({ Name = "AmmoPack" })
	SetObstacleProperty({ Property = "Magnetism", Value = 3000, DestinationIds = ammoIds })
	SetObstacleProperty({ Property = "MagnetismSpeedMax", Value = CurrentRun.Hero.LeaveRoomAmmoMangetismSpeed, DestinationIds = ammoIds })
	StopAnimation({ DestinationIds = ammoIds, Name = "AmmoReturnTimer" })

	SetInvulnerable({ Id = victimId })

	thread(LastKillPresentation, unit )
	SetPlayerInvulnerable( "HadesKillPresentation" )
	AddInputBlock({ Name = "HadesKillPresentation" })
	AddTimerBlock( CurrentRun, "HadesKillPresentation" )
	EndRamWeapons({ Id = killerId })

	if IsScreenOpen("Codex") then
		CloseCodexScreen()
	end

	if IsScreenOpen("TraitTrayScreen") then
		CloseAdvancedTooltipScreen()
	end

	SetMusicSection( 3 )

	Stop({ Id = unit.ObjectId })
	SetAnimation({ Name = "HadesBattleKnockDownTwo", DestinationId = unit.ObjectId })
	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = unit.ObjectId })

	if unit.Phase2ActivateGroups ~= nil then
		SetAlpha({ Names = unit.Phase2ActivateGroups, Fraction = 0.0, Duration = 0.3 })
	end
	if unit.Phase2DeactivateGroups ~= nil then
		SetAlpha({ Names = unit.Phase2DeactivateGroups, Fraction = 1.0, Duration = 0.3 })
	end

	if unit.Phase2VFX ~= nil then
		StopAnimation({ Name = unit.Phase2VFX, DestinationId = unit.ObjectId })
	end

	if unit.DefeatedSound ~= nil then
		PlaySound({ Name = unit.DefeatedSound, Id = unit.ObjectId })
	end
	thread( PlayVoiceLines, unit.DefeatedVoiceLines, true, unit )

	if TextLinesRecord["LordHadesFirstDefeat"] then
		wait( 2.8, RoomThreadName )
	else
		wait( 4.0, RoomThreadName )
	end

	ProcessTextLines( unit.BossPresentationOutroTextLineSets )
	ProcessTextLines( unit.BossPresentationOutroRepeatableTextLineSets )

	if not PlayRandomRemainingTextLines( unit, unit.BossPresentationOutroTextLineSets ) then
		PlayRandomRemainingTextLines( unit, unit.BossPresentationOutroRepeatableTextLineSets )
	end

	SetMusicSection( 10 )

	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	HarpyKillPresentation( unit, args )
	RemoveInputBlock({ Name = "HadesKillPresentation" })
	ShowRunClearScreen()
end

function VictimDeathHold( victimId, startDelay, endDelay )
	wait( startDelay )
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 0.0, DataValue = false, DestinationId = victimId })
	wait( endDelay )
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, DestinationId = victimId })
end

function InvulnerabilityFramePresentationStart( victim, damage, heroHealthThreshold )
	ActivateTempInvulnerabilityPresentation()
	if damage >= heroHealthThreshold then
		-- thread( InCombatText, CurrentRun.Hero.ObjectId, "MassiveHit", 1.2 )
	else
		-- thread( InCombatText, CurrentRun.Hero.ObjectId, "MassiveHits", 1.2 )
	end
	PlaySound({ Name = "/SFX/Menu Sounds/WeaponUnlockPoof", Id = victim.ObjectId  })
	thread( PlayVoiceLines, CurrentRun.Hero.LowHealthVoiceLines, true )
end

function InvulnerabilityFramePresentationEnd( victim, damage, heroHealthThreshold )
	DisableTempInvulnerabilityPresentation()
end

function StartWavePresentation( encounter )
	local totalWaveCount = TableLength(encounter.SpawnWaves)
	if encounter.CurrentWaveNum == totalWaveCount and ( totalWaveCount >= 3 or GameState.ActiveOnslaught ) then
		thread( PlayVoiceLines, HeroVoiceLines.FinalWaveVoiceLines, true )
	elseif encounter.CurrentWaveNum > 1 then
		thread( PlayVoiceLines, HeroVoiceLines.NextWaveVoiceLines, true )
	end
end

function DoImpactSound( args )
	local attackerWeaponName = args.SourceWeapon
	local attackerProjectileName = args.SourceProjectile
	local victim = args.TriggeredByTable
	local victimName = args.name
	local victimId = args.triggeredById
	local victimIsInvulnerable = args.IsInvulnerable

	local sourceData = nil

	if attackerProjectileName ~= nil then
		sourceData = ProjectileData[attackerProjectileName]
	end

	if sourceData == nil or sourceData.Sounds == nil or sourceData.Sounds.ImpactSounds == nil and attackerWeaponName ~= nil then
		if args.AttackerTable ~= nil then
			sourceData = GetWeaponData(args.AttackerTable, attackerWeaponName)
		else
			sourceData = WeaponData[attackerWeaponName]
		end
	end

	if sourceData == nil or sourceData.Sounds == nil or sourceData.Sounds.ImpactSounds == nil then
		return
	end
	if not CanStartBudgetedPresentation("DoImpactSound") then
		return
	end
	local soundData = sourceData.Sounds.ImpactSounds
	if victim ~= nil then

		local impactSound = nil
		if victimIsInvulnerable then
			impactSound = soundData.Invulnerable
		elseif victim.HealthBuffer ~= nil and victim.HealthBuffer > 0 then
			impactSound = soundData.Armored
		end
		if impactSound == nil and victim.Material ~= nil then
			impactSound = soundData[victim.Material]
		end
		if impactSound == nil then
			impactSound = soundData.Default
		end
		if impactSound ~= nil then
			PlaySound({ Name = impactSound, Id = victim.ObjectId })
			wait(1.0)
		end
		ExitBudgetedPresentation("DoImpactSound")
		return

	end
	local hasDefault = false
	for nameFragment, material in pairs( MaterialDefaults ) do
		if string.match( victimName, nameFragment ) then
			local impactSound = soundData[material]
			if impactSound ~= nil then
				PlaySound({ Name = impactSound, Id = victimId })
				wait(1.0)
				ExitBudgetedPresentation("DoImpactSound")
				return
			end
		end
	end

	local impactSound = soundData.Default
	if impactSound ~= nil then
		PlaySound({ Name = impactSound, Id = victimId })
		wait(1.0)
	end

	ExitBudgetedPresentation("DoImpactSound")
end

function HitBySmokeTrapWeaponPresentation( victim )
	if victim ~= CurrentRun.Hero then
		return
	end

	local threadName = "PoisonGasThread"
	local clearDelay = 0.5

	if SetThreadWait( threadName, clearDelay ) then
		return
	end

	if victim.ChokingSound ~= nil then
		PlaySound({ Name = victim.ChokingSound, Id = victim.ObjectId })
	end

	AdjustFullscreenBloom({ Name = "Blurry", Duration = 4.5 })
	AdjustColorGrading({ Name = "SmokeTrap", Duration = 4.5 })
	wait( clearDelay, threadName )
	AdjustColorGrading({ Name = "Off", Duration = 0.3 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 0.3 })

end

function StartStyxPoisonPresentation()

	local threadName = "StyxPoisonGasThread"
	local blurDuration = 1.0
	local clearDelay = 0.5
	local clearDuration = 1.0

	if ScreenAnchors.PoisonVignette or ScreenAnchors.PoisonVignetteAnchor then
		return
	end

	PlaySound({ Name = "/Leftovers/SFX/AcidSizzle", Id = CurrentRun.Hero.ObjectId })

	if CurrentRun.Hero.ChokingSound ~= nil then
		PlaySound({ Name = CurrentRun.Hero.ChokingSound, Id = CurrentRun.Hero.ObjectId })
	end

	thread( PlayVoiceLines, HeroVoiceLines.GotPoisonedVoiceLines, true )

	ScreenAnchors.PoisonVignetteAnchor = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Scripting", X = ScreenCenterX, Y = ScreenCenterY })
	ScreenAnchors.PoisonVignette = SpawnObstacle({ Name = "BlankObstacle", DestinationId = ScreenAnchors.PoisonVignetteAnchor, Group = "Combat_UI" })
	CreateAnimation({ Name = "PoisonVignetteLoop", DestinationId = ScreenAnchors.PoisonVignette  })
	DrawScreenRelative({ Ids = { ScreenAnchors.PoisonVignette } })
	AdjustColorGrading({ Name = "Poison", Duration = 0.5 })

	-- Drop a graphic on all cure foundtinas
	local fountainIds = GetIdsByType({ Name = "PoisonCureFountainStyx"})
	for i, id in pairs(fountainIds) do
		CreateAnimation({ Name = "CureFountainLighting", DestinationId = id })
	end
end

function EndStyxPoisonPresentation()

	local clearDuration = 1.0
	Destroy({ Ids = { ScreenAnchors.PoisonVignette, ScreenAnchors.PoisonVignetteAnchor } })
	ScreenAnchors.PoisonVignette = nil
	ScreenAnchors.PoisonVignetteAnchor = nil
	AdjustColorGrading({ Name = "Off", Duration = clearDuration })

	local fountainIds = GetIdsByType({ Name = "PoisonCureFountainStyx"})
	StopAnimation({ Name = "CureFountainLighting", DestinationIds = fountainIds })
end

function StartLavaPresentation()
	if ScreenAnchors.LavaVignette then
		return
	end
	ScreenAnchors.LavaVignetteAnchor = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Scripting", X = ScreenCenterX, Y = ScreenCenterY })
	ScreenAnchors.LavaVignette = SpawnObstacle({ Name = "BlankObstacle", DestinationId = ScreenAnchors.LavaVignetteAnchor, Group = "Combat_Menu_Additive" })
	SetAnimation({ Name = "LavaVignetteSpawner", DestinationId = ScreenAnchors.LavaVignette  })
	DrawScreenRelative({ Ids = { ScreenAnchors.LavaVignette } })
	AdjustColorGrading({ Name = "Team02", Duration = 0.5 })
end

function EndLavaPresentation()
	local clearDuration = 0.3
	AdjustColorGrading({ Name = "Off", Duration = clearDuration })
	SetAnimation({ Name = "LavaVignetteEnd", DestinationId = ScreenAnchors.LavaVignette  })
	wait(clearDuration)
	wait(0.5) -- additional 0.5s for flames to end
	Destroy({ Ids = { ScreenAnchors.LavaVignette, ScreenAnchors.LavaVignetteAnchor } })
	ScreenAnchors.LavaVignette = nil
	ScreenAnchors.LavaVignetteAnchor = nil
end

function HitByGraveHandsPresentation( victim )
	if victim ~= nil and victim == CurrentRun.Hero then
		thread( PlayVoiceLines, HeroVoiceLines.HitByGraveHandsVoiceLines, true )
	end
end

function StartShieldBarrierPresentation( owner )
	local shieldTrait = GetExistingUITraitName( "ShieldAfterHitTrait" )
	if owner ~= nil and owner == CurrentRun.Hero and shieldTrait then
		TraitUIDeactivateTrait( shieldTrait )
		TraitUIActivateTrait( shieldTrait, { CustomAnimation = "ActiveTraitSingle", PlaySpeed = 30 / 7 })
	end
end

function StartAmmoReloadPresentation( delay )
	ScreenAnchors.AmmoIndicatorUIReloads = ScreenAnchors.AmmoIndicatorUIReloads or {}
	local reloadTimer = delay
	local id = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", Y = ScreenHeight - 62 + 40, X = 532 + 40 * #ScreenAnchors.AmmoIndicatorUIReloads })
	SetAnimation({ Name = "AmmoReloadTimer", DestinationId = id, PlaySpeed = 30 / reloadTimer })
	table.insert( ScreenAnchors.AmmoIndicatorUIReloads, id )
end

function EndAmmoReloadPresentation()
	if IsEmpty(ScreenAnchors.AmmoIndicatorUIReloads ) then
		return
	end

	table.remove( ScreenAnchors.AmmoIndicatorUIReloads, 1 )
	local destroyIds = {}
	for i, id in pairs( ScreenAnchors.AmmoIndicatorUIReloads ) do
		local targetId = SpawnObstacle({ Name = "InvisibleTarget", OffsetX = 532 + 40 * (i - 1 ), OffsetY = ScreenHeight - 62 + 40, Group = "Standing" })
		Move({ Id = id, DestinationId = targetId, Duration = 0.25 })
		table.insert( destroyIds, targetId )
	end
	PlaySound({ Name = "/SFX/BloodstoneAmmoPickup", Id = CurrentRun.Hero.ObjectId })
	Destroy({ Ids = destroyIds })
end

function ShoutFailedPresentation( attacker )
	thread( InCombatTextArgs, { TargetId = attacker.ObjectId, Text = "SuperNotCharged", Duration = 0.75, Cooldown = 2.0 } )
	thread( PlayVoiceLines, HeroVoiceLines.NotReadyVoiceLines, true )
	PlaySound({ Name = "/Leftovers/SFX/OutOfAmmo2", Id = attacker.ObjectId })
	CreateAnimation({ Name = "SuperNotChargedFlare", DestinationId = attacker.ObjectId, Scale = 0.5, OffsetZ = 160 })
end


function DoSuperPresentation( traitData )

	local currentRun = CurrentRun
	SetPlayerInvulnerable( "Super" )

	PlaySound({ Name = traitData.ProcSound or "/Leftovers/SFX/AuraThrowLarge" })

	thread( PlayVoiceLines, HeroVoiceLines.SuperActivatedVoiceLines, true )
	wait( 0.02 )
	ShakeScreen({ Speed = 1000, Distance = 8, Duration = 0.3 })
	thread( DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.3, Duration = 0.3 }, } )
	SetAnimation({ Name = "ZagreusLanding", DestinationId = CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "SuperStartFlare", DestinationId = CurrentRun.Hero.ObjectId, Scale = 2.0 })

	--SetAnimation({ Name = "ZagreusWrath", DestinationId = currentRun.Hero.ObjectId })
	--CreateAnimation({ Name = "ZagreusWrathFire", DestinationId = CurrentRun.Hero.ObjectId, Color = LootData[traitData.God .. "Upgrade"].LootColor })

	--ApplyEffectFromWeapon({ Id = currentRun.Hero.ObjectId, DestinationId = currentRun.Hero.ObjectId, WeaponName = "ShoutSelfSlow", EffectName = "ShoutSelfSlow", AutoEquip = true })
	-- Rumble({ RightFraction = 0.7, Duration = 0.3 })

	thread( RevulnerablePlayerAfterShout )
end

function DoAssistPresentation( assistData )
	local currentRun = CurrentRun
	SetPlayerInvulnerable( "Super" )
	AddInputBlock({ Name = "AssistPreSummon" })

	PlaySound({ Name = assistData.ProcSound or "/Leftovers/SFX/AuraThrowLarge" })
	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteSparklySFX" })

	thread( PlayVoiceLines, HeroVoiceLines.AssistActivatedVoiceLines, true )
	AdjustFullscreenBloom({ Name = "LastKillBloom", Duration = 0 })

	--local assistDimmer = CreateScreenComponent({ Name = "rectangle01", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
	local assistDimmer = SpawnObstacle({ Name = "rectangle01", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_UI" })
	Teleport({ Id = assistDimmer, OffsetX = ScreenCenterX, OffsetY = ScreenCenterY })
	DrawScreenRelative({ Ids = { assistDimmer } })
	SetScale({ Id = assistDimmer, Fraction = 10 })
	SetColor({ Id = assistDimmer, Color = {20, 20, 20, 255} })
	--SetAlpha({ Id = assistDimmer, Fraction = 0.0, Duration = 0 })
	SetAlpha({ Id = assistDimmer, Fraction = 0.8, Duration = 0 })

	RemoveFromGroup({ Id = CurrentRun.Hero.ObjectId, Names = { "Standing" } })
	AddToGroup({ Id = CurrentRun.Hero.ObjectId, Name = "Combat_Menu_Overlay", DrawGroup = true })

	--FocusCamera({ Fraction = 1.0, Duration = 0.6, ZoomType = "Ease" })
	--PanCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 0.6 })
	wait( 0.06 )
	ExpireProjectiles({ ExcludeNames = WeaponSets.ExpireProjectileExcludeProjectileNames })
	AddSimSpeedChange( "Assist", { Fraction = 0.005, LerpTime = 0 } )
	SetAnimation({ Name = "ZagreusSummon", DestinationId = CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "SuperStartFlare", DestinationId = CurrentRun.Hero.ObjectId, Color = assistData.AssistPresentationColor or Color.Red })
	--CreateAnimation({ Name = "SuperStartFlare", DestinationId = CurrentRun.Hero.ObjectId, Scale = 0.6 })

	waitScreenTime(  0.32 )

	local currentRun = CurrentRun
	HideCombatUI("AssistPresentationPortrait")

	--SetAnimation({ Name = "ZagreusLanding", DestinationId = currentRun.Hero.ObjectId })

	ApplyEffectFromWeapon({ Id = currentRun.Hero.ObjectId, DestinationId = currentRun.Hero.ObjectId, WeaponName = "ShoutSelfSlow", EffectName = "ShoutSelfSlow", AutoEquip = true })
	Rumble({ RightFraction = 0.7, Duration = 0.3 })
	--AdjustZoom({Fraction = 0.9, LerpTime = 0.02})
	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
	AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay=0 })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.03, Delay=0 })

	local wrathPresentationOffsetY = 100
	local wrathStreak = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_UI" })
	Teleport({ Id = wrathStreak, OffsetX = (1920/2), OffsetY = 800 + wrathPresentationOffsetY })
	DrawScreenRelative({ Ids = { wrathStreak } })
	CreateAnimation({ Name = "WrathPresentationStreak", DestinationId = wrathStreak, Color = assistData.AssistPresentationColor or Color.Red })

	local godImage = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_Menu" })
	Teleport({ Id = godImage, OffsetX = -300, OffsetY = (1080/2) + 80 + wrathPresentationOffsetY })
	DrawScreenRelative({ Ids = { godImage } })
	CreateAnimation({ Name = assistData.AssistPresentationPortrait, DestinationId = godImage, Scale = "1.0" })

	local wrathStreakFront = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_Menu_Overlay" })
	Teleport({ Id = wrathStreakFront, OffsetX = 900, OffsetY = 1150 + wrathPresentationOffsetY })
	DrawScreenRelative({ Ids = { wrathStreakFront } })
	CreateAnimation({ Name = "WrathPresentationBottomDivider", DestinationId = wrathStreakFront, Scale = "1.25", Color = assistData.AssistPresentationColor or Color.Red })

	local wrathVignette = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	CreateAnimation({ Name = "WrathVignette", DestinationId = wrathVignette, Color = Color.Red })

	-- audio
	local dummyGodSource = {}
	--thread( PlayVoiceLines, LootData[traitData.God .. "Upgrade"].ShoutVoiceLines, false, dummyGodSource )
	--PlaySound({ Name = LootData[traitData.God .. "Upgrade"].ShoutActivationSound or "/Leftovers/SFX/MeteorStrikeShort" })
	-- AudioState.ShoutEffectSoundId = PlaySound({ Name = "/SFX/WrathStart", Id = CurrentRun.Hero.ObjectId })

	AddSimSpeedChange( "Assist", { Fraction = 0.1, LerpTime = 0.06 } )
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 3, ValueChangeType = "Multiply", DataValue = false, DestinationNames = { "HeroTeam" } })

	ScreenAnchors.FullscreenAlertFxAnchor = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Scripting", X = ScreenCenterX, Y = ScreenCenterY })

	local fullscreenAlertDisplacementFx = SpawnObstacle({ Name = "FullscreenAlertDisplace", Group = "FX_Displacement", DestinationId = ScreenAnchors.FullscreenAlertFxAnchor})
	DrawScreenRelative({ Id = fullscreenAlertDisplacementFx })

	Move({ Id = godImage, Angle = 8, Distance = 800, Duration = 0.2, EaseIn = 0.2, EaseOut = 1, TimeModifierFraction = 0 })
	Move({ Id = wrathStreakFront, Angle = 8, Distance = 200, Duration = 0.5, EaseIn = 0.9, EaseOut = 1, TimeModifierFraction = 0 })
	Move({ Id = playerImage, Angle = 170, Speed = 50, TimeModifierFraction = 0 })

	--SetColor({ Id = godImage, Color = {0, 0, 0, 1}, Duration = 0.05, TimeModifierFraction = 0 })
	SetColor({ Id = wrathVignette, Color = {0, 0, 0, 0.4}, Duration = 0.05, TimeModifierFraction = 0 })

	waitScreenTime(  0.25 )
	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteSurpriseSFX" })

	AdjustFullscreenBloom({ Name = "Off", Duration = 0.1, Delay = 0 })
	Move({ Id = godImage, Angle = 8, Distance = 100, Duration = 1, EaseIn = 0.5, EaseOut = 0.5, TimeModifierFraction = 0 })
	Move({ Id = wrathStreakFront, Angle = 8, Distance = 25, Duration = 1, EaseIn = 0.5, EaseOut = 1, TimeModifierFraction = 0 })

	waitScreenTime(  0.55 )
	AdjustZoom({Fraction = currentRun.CurrentRoom.ZoomFraction or 0.9, LerpTime = 0.25})

	PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal3" })

	RemoveInputBlock({ Name = "AssistPreSummon" })
	for k, enemy in pairs( ActiveEnemies ) do
		if enemy.AssistReactionVoiceLines ~= nil then
			thread( PlayVoiceLines, enemy.AssistReactionVoiceLines, nil, enemy )
		end
	end

	SetAlpha({ Id = godImage, Fraction = 0, Duration = 0.12, TimeModifierFraction = 0 })
	SetAlpha({ Id = wrathVignette, Fraction = 0, Duration = 0.06 })
	SetColor({ Id = assistDimmer, Color = {0.0, 0, 0, 0}, Duration = 0.06 })
	SetAlpha({ Id = fullscreenAlertDisplacementFx, Fraction = 0, Duration = 0.06 })
	--ModifyTextBox({ Id = defianceText, FadeTarget = 0.0, FadeDuration = 0.3, ColorTarget = {1, 0, 0, 1}, ColorDuration = 0.3 })

	waitScreenTime(  0.06 )
	RemoveFromGroup({ Id = CurrentRun.Hero.ObjectId, Names = { "Combat_Menu_Overlay" } })
	AddToGroup({ Id = CurrentRun.Hero.ObjectId, Name = "Standing", DrawGroup = true })
end

function AssistCompletePresentation( assistData )
	wait(1.35, RoomThreadName)
	local currentRun = CurrentRun
	thread( PlayVoiceLines, HeroVoiceLines.AssistCompletedVoiceLines, true )
end

function AssistFailedPresentation( attacker )
	if ( attacker.IsDead and CurrentDeathAreaRoom ~= nil and not CurrentDeathAreaRoom.AllowAssistFailedPresentation ) or not IsInputAllowed({}) then
		return
	end

	if CheckCountInWindow( "AssistFailed", 1.0, 2 ) then
		thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "AssistNotAvailable", Duration = 0.75, Cooldown = 2.0 } )
		thread( PlayVoiceLines, HeroVoiceLines.AssistUnavailableVoiceLines, true )
	end
	PlaySound({ Name = "/Leftovers/SFX/OutOfAmmo2", Id = attacker.ObjectId })
	CreateAnimation({ Name = "SuperNotChargedFlare", DestinationId = attacker.ObjectId, Scale = 0.5, OffsetZ = 160 })

	for k, enemy in pairs( ActiveEnemies ) do
		if enemy.AssistFailedReactionVoiceLines ~= nil then
			thread( PlayVoiceLines, enemy.AssistFailedReactionVoiceLines, nil, enemy )
		end
	end

end

function DoAssistPresentationPostWeapon( assistData )
	AddSimSpeedChange( "Assist", { Fraction = 0.3, LerpTime = 0.3 } )
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	waitScreenTime(  assistData.AssistPostWeaponSlowDuration or 0 )
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	RemoveSimSpeedChange( "Assist", { LerpTime = 0.3 } )
	thread( CleanUpShoutPresentation, fullscreenAlertDisplacementFx)
	ShowCombatUI("AssistPresentationPortrait")
	thread( RevulnerablePlayerAfterShout )
end

function DoFullSuperPresentation( traitData )
	local currentRun = CurrentRun
	SetPlayerInvulnerable( "Super" )
	--AddInputBlock({ Name = "SuperPresentation" })
	HideCombatUI("SuperPresentation")

	SetAnimation({ Name = "ZagreusWrath", DestinationId = currentRun.Hero.ObjectId })
	CreateAnimation({ Name = "ZagreusWrathFire", DestinationId = CurrentRun.Hero.ObjectId, Color = LootData[traitData.God .. "Upgrade"].LootColor })

	ApplyEffectFromWeapon({ Id = currentRun.Hero.ObjectId, DestinationId = currentRun.Hero.ObjectId, WeaponName = "ShoutSelfSlow", EffectName = "ShoutSelfSlow", AutoEquip = true })
	Rumble({ RightFraction = 0.7, Duration = 0.3 })
	AdjustZoom({Fraction = 0.9, LerpTime = 0.02})
	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
	AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay=0 })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.03, Delay=0 })

	--SetThingProperty({ Property = "TimeModifierFraction", Value = 1.0, DestinationId = currentRun.Hero.ObjectId, DataValue = false })

	--SetSoundCueValue({ Id = GetMixingId({}), Names = { "LowPass" }, Value = 1.0, Duration = 0.25 })
	-- super activation sound
	--PlaySound({ Name = "/Leftovers/SFX/MeteorStrikeShort" })
	--PlaySound({ Name = "/VO/ZagreusEmotes/EmotePoweringUp", Id = currentRun.Hero.ObjectId })

	--thread( PlayVoiceLines, HeroVoiceLines.SuperActivatedVoiceLines )
	local wrathPresentationOffsetY = 100
	local wrathStreak = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_UI" })
	Teleport({ Id = wrathStreak, OffsetX = (1920/2), OffsetY = 800 + wrathPresentationOffsetY })
	DrawScreenRelative({ Ids = { wrathStreak } })
	CreateAnimation({ Name = "WrathPresentationStreak", DestinationId = wrathStreak, Color = LootData[traitData.God .. "Upgrade"].LootColor })

	local godImage = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_Menu" })
	Teleport({ Id = godImage, OffsetX = -300, OffsetY = (1080/2) + 80 + wrathPresentationOffsetY })
	DrawScreenRelative({ Ids = { godImage } })
	CreateAnimation({ Name = LootData[traitData.God .. "Upgrade"].WrathPortrait, DestinationId = godImage, Scale = "1.0" })

	local wrathStreakFront = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_Menu_Overlay" })
	Teleport({ Id = wrathStreakFront, OffsetX = 900, OffsetY = 1150 + wrathPresentationOffsetY })
	DrawScreenRelative({ Ids = { wrathStreakFront } })
	CreateAnimation({ Name = "WrathPresentationBottomDivider", DestinationId = wrathStreakFront, Scale = "1.25", Color = LootData[traitData.God .. "Upgrade"].LootColor })

	local wrathVignette = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	CreateAnimation({ Name = "WrathVignette", DestinationId = wrathVignette, Color = LootData[traitData.God .. "Upgrade"].LootColor })

	-- audio
	local sourceName = traitData.God.."Upgrade"
	thread( PlayVoiceLines, LootData[sourceName].ShoutVoiceLines, false, LootData[sourceName] )
	PlaySound({ Name = LootData[sourceName].ShoutActivationSound or "/Leftovers/SFX/MeteorStrikeShort" })
	AudioState.ShoutEffectSoundId = PlaySound({ Name = "/SFX/WrathStart", Id = CurrentRun.Hero.ObjectId })

	thread( ShoutSlow )

	ScreenAnchors.FullscreenAlertFxAnchor = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Scripting", X = ScreenCenterX, Y = ScreenCenterY })

	local fullscreenAlertDisplacementFx = SpawnObstacle({ Name = "FullscreenAlertDisplace", Group = "FX_Displacement", DestinationId = ScreenAnchors.FullscreenAlertFxAnchor})
	DrawScreenRelative({ Id = fullscreenAlertDisplacementFx })

	Move({ Id = godImage, Angle = 8, Distance = 800, Duration = 0.2, EaseIn = 0.2, EaseOut = 1, TimeModifierFraction = 0 })
	Move({ Id = wrathStreakFront, Angle = 8, Distance = 200, Duration = 0.5, EaseIn = 0.9, EaseOut = 1, TimeModifierFraction = 0 })
	Move({ Id = playerImage, Angle = 170, Speed = 50, TimeModifierFraction = 0 })

	SetColor({ Id = godImage, Color = {0, 0, 0, 1}, Duration = 0.05, TimeModifierFraction = 0 })
	SetColor({ Id = wrathVignette, Color = {0, 0, 0, 0.4}, Duration = 0.05, TimeModifierFraction = 0 })

	waitScreenTime(  0.25 )
	AdjustFullscreenBloom({ Name = "Off", Duration = 0.1, Delay = 0 })
	Move({ Id = godImage, Angle = 8, Distance = 100, Duration = 1, EaseIn = 0.5, EaseOut = 0.5, TimeModifierFraction = 0 })
	Move({ Id = wrathStreakFront, Angle = 8, Distance = 25, Duration = 1, EaseIn = 0.5, EaseOut = 1, TimeModifierFraction = 0 })

	waitScreenTime(  0.65 )
	AdjustZoom({Fraction = currentRun.CurrentRoom.ZoomFraction or 0.75, LerpTime = 0.25})

	-- Move({ Id = godImage, Angle = 170, Speed = 7000, TimeModifierFraction = 0 })
	PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal3" })

	waitScreenTime(  0.1 )
	SetColor({ Id = godImage, Color = {1,1,1,1}, Duration = 0.1, TimeModifierFraction = 0 })
	waitScreenTime(  0.1 )
	--SetThingProperty({ Property = "TimeModifierFraction", Value = 1.0, DestinationId = currentRun.Hero.ObjectId, DataValue = false })

	SetAlpha({ Id = godImage, Fraction = 0, Duration = 0.12, TimeModifierFraction = 0 })
	SetAlpha({ Id = wrathVignette, Fraction = 0, Duration = 0.06 })
	SetAlpha({ Id = fullscreenAlertDisplacementFx, Fraction = 0, Duration = 0.06 })
	thread( CleanUpShoutPresentation, fullscreenAlertDisplacementFx)

	for k, enemy in pairs( ActiveEnemies ) do
		if enemy.WrathReactionVoiceLines ~= nil then
			thread( PlayVoiceLines, enemy.WrathReactionVoiceLines, nil, enemy )
		end
	end

	ShowCombatUI("SuperPresentation")
	--RemoveInputBlock({ Name = "SuperPresentation" })
	thread( RevulnerablePlayerAfterShout )
end

function DoTheseusSuperPresentation( enemy, weaponAIData )
	local currentRun = CurrentRun

	PlaySound({ Name = "/Leftovers/SFX/MeteorStrikeShort", Id = enemy.ObjectId })

	CreateAnimation({ Name = "TheseusWrathFire", DestinationId = enemy.ObjectId, Color = {1.0, 0.9, 0.2, 1.0} })

	-- Rumble({ RightFraction = 0.7, Duration = 0.3 })
	AdjustZoom({Fraction = 0.9, LerpTime = 0.02})
	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
	AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay=0 })

	AudioState.TheseusShoutEffectSoundId = PlaySound({ Name = "/SFX/Enemy Sounds/Theseus/EmotePoweringUp", Id = enemy.ObjectId })

	thread( ShoutSlow )

	ScreenAnchors.FullscreenAlertFxAnchor = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Scripting", X = ScreenCenterX, Y = ScreenCenterY })

	local fullscreenAlertDisplacementFx = SpawnObstacle({ Name = "FullscreenAlertDisplace", Group = "FX_Displacement", DestinationId = ScreenAnchors.FullscreenAlertFxAnchor})
	DrawScreenRelative({ Id = fullscreenAlertDisplacementFx })

	if weaponAIData.WrathVoiceLines ~= nil then
		thread( PlayVoiceLines, weaponAIData.WrathVoiceLines, nil, enemy )
	end

	waitScreenTime(  1.5 )

	AdjustFullscreenBloom({ Name = "Off", Duration = 0.1, Delay = 0 })
	AdjustZoom({Fraction = currentRun.CurrentRoom.ZoomFraction or 0.75, LerpTime = 0.25 })
	PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal3" })

	thread( CleanUpShoutPresentation, fullscreenAlertDisplacementFx)

end


function CleanUpShoutPresentation( fullscreenAlertDisplacementFx )
	waitScreenTime(  0.08 )
	Destroy({ Ids = { fullscreenAlertDisplacementFx } })
	StopSound({ Id = AudioState.ShoutEffectSoundId, Duration = 0.2 })
	AudioState.ShoutEffectSoundId = nil
	StopSound({ Id = AudioState.TheseusShoutEffectSoundId, Duration = 0.2 })
	AudioState.TheseusShoutEffectSoundId = nil
end

function DoReactionPresentation( victim, reaction )
	if not CanStartBudgetedPresentation("DoReactionPresentation") then
		return
	end

	if reaction.ReactionSound ~= nil then
		PlaySound({ Name = reaction.ReactionSound, Id = victim.ObjectId })
	end

	if reaction.ShakeScreenSpeed then
		ShakeScreen({ Speed = reaction.ShakeScreenSpeed, Distance = reaction.ShakeScreenDistance, FalloffSpeed = reaction.ShakeScreenFalloffSpeed, Duration = reaction.ShakeScreenDuration, })
		wait(reaction.ShakeScreenDuration)
	end

	if reaction.Shake then
		Shake({ Id = victim.ObjectId, Speed = reaction.ShakeSpeed, Distance = reaction.ShakeDistance, Duration = reaction.ShakeDuration, ApplyToChildren = true })
	end

	if reaction.DisappearDuration ~= nil then
		SetAlpha({ Id = victim.ObjectId, Fraction = 0.0, Duration = 0.0 })
		wait( reaction.DisappearDuration, RoomThreadName )
		if victim.ReappearSound ~= nil then
			PlaySound({ Name = victim.ReappearSound, Id = victim.ObjectId })
		end
		local duration = 1.0
		SetAlpha({ Id = victim.ObjectId, Fraction = 1.0, Duration = duration })
		wait(duration)
	end

	ExitBudgetedPresentation("DoReactionPresentation")
end

function RevulnerablePlayerAfterShout()
	waitScreenTime(  0.4 )
	SetPlayerVulnerable( "Super" )
end

function ShoutSlow()
	for k, simData in ipairs( CurrentRun.Hero.ShoutSlowParameters ) do
		waitScreenTime(  simData.ScreenPreWait )
		if simData.Fraction < 1.0 then
			AddSimSpeedChange( "WeaponHit", { Fraction = simData.Fraction, LerpTime = simData.LerpTime } )
		else
			RemoveSimSpeedChange( "WeaponHit", { LerpTime = simData.LerpTime } )
		end
	end
end

function ActivateFusePresentation( enemy )
	if enemy.FuseAnimation ~= nil then
		SetAnimation({ DestinationId = enemy.ObjectId, Name = enemy.FuseAnimation })
	end
	if enemy.FlashOnFuse then
		Flash({ Id = enemy.ObjectId, Speed = 3, MinFraction = 0, MaxFraction = 0.5, Color = Color.Yellow, Duration = enemy.FuseDuration })
	end
	if enemy.FuseWarningAnimation ~= nil and enemy.FuseWarningWeapon ~= nil then
		local damageRadius = GetProjectileProperty({ Id = enemy.ObjectId, WeaponName = enemy.FuseWarningWeapon, Property = "DamageRadius" })
		CreateAnimation({ Name = enemy.FuseWarningAnimation, DestinationId = enemy.ObjectId, ScaleRadius = damageRadius })
	end
end

function PostActivatFusePresentation( enemy )
	if enemy.FuseWarningAnimation then
		StopAnimation({ Name = enemy.FuseWarningAnimation, DestinationId = enemy.ObjectId })
	end
	if enemy.FuseSoundId ~= nil then
		StopSound({ Id = enemy.FuseSoundId })
	end
end

function PostFuseRevivePresentation( enemy )
	if enemy.PostFuseReviveAnimation then
		SetAnimation({ Name = enemy.PostFuseReviveAnimation, DestinationId = enemy.ObjectId })
	end
end

function UpgradeAcquiredPresentation( upgradeName, buttonId )
	local upgradeData = LootData[upgradeName]
	CreateAnimation({ Name = "HitSparkA", DestinationId = buttonId })
	if not upgradeData.ConfirmSound then
		PlaySound({ Name = "/SFX/Menu Sounds/GodBoonChoiceConfirm" })
	else
		PlaySound({ Name = upgradeData.ConfirmSound })
	end
	thread( PlayFirstEligibleVoiceLines, { HeroVoiceLines.SwapUpgradePickedVoiceLines, upgradeData.SwapUpgradePickedVoiceLines, upgradeData.UpgradePickedVoiceLines, HeroVoiceLines.UpgradePickedVoiceLines, HeroVoiceLines.GenericUpgradePickedVoiceLines } )
	wait( 0.02 )
	ShakeScreen({ Speed = 1000, Distance = 2, Duration = 0.3 })
	thread( DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.3, Duration = 0.3 }, } )
	AdjustColorGrading({ Name = upgradeData.ColorGrade or "ItemGet", Duration = 0.2 })
	SetAnimation({ Name = "ZagreusLanding", DestinationId = CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "ItemGet", DestinationId = CurrentRun.Hero.ObjectId, Scale = 2.0 })
	CreateAnimation({ Name = "ItemGetVignette", DestinationId = CurrentRun.Hero.ObjectId, Scale = 2.0 })
	wait( 0.25 )
	AdjustColorGrading({ Name = "Off", Duration = 0.5 })
end

function OnCharmStartPresentation( unit )
	if unit.OnCharmedVoiceLines ~= nil then
		thread( PlayVoiceLines, unit.OnCharmedVoiceLines, nil, unit )
	end
	if unit.CharmStartSound then
		PlaySound({ Name = unit.CharmStartSound, Id = unit.ObjectId })
	end
end

function OnCharmEndPresentation( unit )
	if unit.OnCharmEndVoiceLines ~= nil then
		thread( PlayVoiceLines, unit.OnCharmEndVoiceLines, nil, unit )
	end
	if unit.CharmEndSound then
		PlaySound({ Name = unit.CharmEndSound, Id = unit.ObjectId })
	end
end

-- Vibration

function DoWeaponFireRumble( weaponData )

	if weaponData == nil then
		return
	end
	if weaponData.FireRumbleParameters then
		DoRumble( weaponData.FireRumbleParameters )
	end
end

function DoWeaponHitRumble( weaponData )
	if weaponData == nil then
		return
	end
	if weaponData.HitRumbleParameters then
		DoRumble( weaponData.HitRumbleParameters )
	end
end

function DoWeaponChargeRumble( weaponData )
	if weaponData == nil then
		return
	end
	if weaponData.ChargeRumbleParameters then
		DoRumble( weaponData.ChargeRumbleParameters )
	end
end

--RumbleThreadName = "RumbleThread"

function DoRumble( args )
	if args == nil then
		return
	end
	--[[
	if HasThread( RumbleThreadName ) then
		return
	end
	]]
	for k, rumbleData in ipairs( args ) do
		--waitScreenTime(  rumbleData.ScreenPreWait, RumbleThreadName )
		waitScreenTime(  rumbleData.ScreenPreWait )
		if rumbleData.Fraction then
			Rumble({ Fraction = rumbleData.Fraction, Duration = rumbleData.Duration })
		else
			Rumble({ LeftFraction = rumbleData.LeftFraction, RightFraction = rumbleData.RightFraction, Duration = rumbleData.Duration })
		end
	end
end

function DoWeaponFireRadialBlur( weaponData )

	if weaponData == nil then
		return
	end
	if weaponData.FireRadialBlur then
		DoWeaponRadialBlur( weaponData.FireRadialBlur )
	end
end

function OnHitShakePresentation( shakeArgs )
	if not CanStartBudgetedPresentation("OnHitShakePresentation") then
		return
	end
	Shake( shakeArgs )
	wait( shakeArgs.Duration )
	ExitBudgetedPresentation("OnHitShakePresentation")
end

function GenericDamagePresentation( victim, triggerArgs )

	-- @todo Combine with other DamagePresentation()
	if victim.HitShield ~= nil and victim.HitShield > 0 then
		return
	end

	if victim.HealthBuffer ~= nil and victim.HealthBuffer > 0 then
		return
	end

	if triggerArgs.EffectName ~= nil and EffectData[triggerArgs.EffectName] and EffectData[triggerArgs.EffectName].CancelHitSpark  then
		return
	end

	local sourceProjectileData = nil
	if triggerArgs.SourceProjectile ~= nil then
		sourceProjectileData = ProjectileData[triggerArgs.SourceProjectile]
	end

	if sourceProjectileData and sourceProjectileData.CancelHitSpark then
		return
	end

	if not CanStartBudgetedPresentation("GenericDamagePresentation") then
		return
	end

	local angle = 0
	if triggerArgs.ImpactAngle ~= nil then
		angle = triggerArgs.ImpactAngle + 180
	end

	local damagedFx = GetDamagedFx( victim, sourceProjectileData )
	if damagedFx ~= nil then
		CreateAnimation({ DestinationId = victim.ObjectId, Name = damagedFx, Angle = angle, OffsetZ = triggerArgs.ImpactLocationZ })
		wait(CombatPresentationCaps.CreateAnimationMagicWaitTime)
	end

	ExitBudgetedPresentation("GenericDamagePresentation")

end

function GetDamagedFx( victim, sourceProjectileData )

	if sourceProjectileData ~= nil then
		if sourceProjectileData.DamagedFx ~= nil then
			return sourceProjectileData.DamagedFx
		end
		if victim.DamagedFxStyles ~= nil and sourceProjectileData.DamagedFxStyle ~= nil and victim.DamagedFxStyles[sourceProjectileData.DamagedFxStyle] ~= nil then
			return victim.DamagedFxStyles[sourceProjectileData.DamagedFxStyle]
		end
	end

	if victim.DamagedFxStyles ~= nil then
		return victim.DamagedFxStyles.Default
	end

	return nil

end

function BlockedDamageInvulnerablePresentation( victim, triggerArgs )
	if not CanStartBudgetedPresentation("BlockedDamageInvulnerablePresentation") then
		return
	end

	local angle = 0
	if triggerArgs.ImpactAngle ~= nil then
		angle = triggerArgs.ImpactAngle + 180
	end
	if victim.InvulnerableHitFx ~= nil then
		CreateAnimation({ DestinationId = victim.ObjectId, Name = victim.InvulnerableHitFx, Angle = angle, OffsetZ = triggerArgs.ImpactLocationZ })
		wait(CombatPresentationCaps.CreateAnimationMagicWaitTime)
	end

	ExitBudgetedPresentation("BlockedDamageInvulnerablePresentation")
end

function KillPresentation( victim, args )

	if args.Silent then
		return
	end

	if not CanStartBudgetedPresentation("KillPresentation") then
		return
	end

	if victim.DeathSound ~= nil then
		PlaySound({ Name = victim.DeathSound, Id = victim.ObjectId })
	end
	if victim.DeathFx ~= nil then
		CreateAnimation({ Name = victim.DeathFx, DestinationId = victim.ObjectId, Angle = args.ImpactAngle })
		wait(CombatPresentationCaps.CreateAnimationMagicWaitTime)
	end

	ExitBudgetedPresentation("KillPresentation")
end

function RallyHealPresentation()
	CreateAnimation({ Name = "HermesRallyHeal", DestinationId = CurrentRun.Hero.ObjectId })
end

function InvisibleAlphaFlash(unit, duration)
	SetAlpha({ Id = unit.ObjectId, Fraction = 0.5, Duration = duration / 2 })
	wait(duration/2)
	if unit.IsInvisible then
		SetAlpha({ Id = unit.ObjectId, Fraction = 0.0, Duration = duration / 2 })
	else
		SetAlpha({ Id = unit.ObjectId, Fraction = 1.0 })
	end
end

function PerfectDashStartPresentation( triggerArgs )
	CreateAnimation({ Name = "PowerUpPerfectDash", DestinationId = CurrentRun.Hero.ObjectId })
end

function PerfectDashEndPresentation( triggerArgs )
	if CheckCooldown( "PerfectDashActivated", 0.5 ) then
		thread( InCombatTextArgs, { Text = "PerfectDashActivated", TargetId = CurrentRun.Hero.ObjectId, Duration = 0.75, PreDelay = 0.21 } )
	end
	wait( 0.1 )
	PlaySound({ Name = "/VO/ZagreusEmotes/EmotePerfectEvade", Id = triggerArgs.triggeredById })
 	wait( 0.25 )
	PlaySound({ Name = "/Leftovers/SFX/PerfectTiming", Id = triggerArgs.triggeredById })
end

function ComboReadyPresentation( attacker, triggerArgs )
	CreateAnimation({ Name = "FistComboReadyFx", DestinationId = attacker.ObjectId })
	CreateAnimation({ Name = "PowerUpComboReady", DestinationId = attacker.ObjectId })
	CreateAnimation({ Name = "FistComboReadyGlow", DestinationId = attacker.ObjectId })
	if CheckCooldown( "ComboReadyHint", 1.5 ) then
		thread( InCombatText, attacker.ObjectId, "Combo_Ready", 0.8 )
		PlaySound({ Name = "/SFX/Player Sounds/ZagreusFistComboProc", Id = CurrentRun.Hero.ObjectId })
	end
end

function ComboDeliveredPresentation( attacker, triggerArgs )
	StopAnimation({ Name = "FistComboReadyFx", DestinationId = attacker.ObjectId })
	StopAnimation({ Name = "FistComboReadyGlow", DestinationId = attacker.ObjectId })
	PlaySound({ Name = "/VO/ZagreusEmotes/EmoteSuperSpecial_Fist", Id = attacker.ObjectId })
	PlaySound({ Name = "/Leftovers/SFX/AuraPerfectThrow", Id = attacker.ObjectId })
end

function FistVacuumPullPresentation( victimId, args )
	CreateAnimationsBetween({ Animation = "FistVacuumFx", DestinationId = victimId, Id = CurrentRun.Hero.ObjectId, Length = args.distanceBuffer, Stretch = true, UseZLocation = false, Group = "FX_Standing_Add" })
	PlaySound({ Name = "/SFX/Player Sounds/ZagreusFistMagnetismVacuumActivate", Id = victimId })
end
