
ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
	DebugPrint({Text = "@NewAphrodite Trying to load package NewAphrodite.pkg"})
	LoadPackages({Name = "NewAphrodite"})
	return baseFunc()
end)

function BurnOverTimeApply( triggerArgs )
	UpdateBurnEffectStacks( triggerArgs )
end

function BurnOverTimeClear( triggerArgs )
	ClearBurnEffectStacks( triggerArgs )
end

function UpdateBurnEffectStacks( args )
	local stacks = args.Stacks
	local unitId = args.triggeredById
	local unit = args.TriggeredByTable
	local startIconScale = 1.3

	local poisonColorA = Color.DarkRed
	local poisonColorB = Color.LightYellow
	local poisonStatusFontColor = Color.Lerp(poisonColorA, poisonColorB, (12 - stacks) / 12)
	if stacks > 12 then
		poisonStatusFontColor = poisonColorA
	end

	if not EnemyHealthDisplayAnchors[unitId] then
		CreateHealthBar( unit )
		UpdateHealthBar( unit, 0, { Force = true })
	end

	if not EnemyHealthDisplayAnchors[ unitId .. "burnstatus" ] then

		local backingId = nil
		local scale = 1
		if unit.BarXScale then
			scale = unit.BarXScale
		end
		if unit and unit.UseBossHealthBar then
			backingId = CreateScreenObstacle({ Name = "BurnSmall", Group = "Combat_Menu", DestinationId = EnemyHealthDisplayAnchors[unitId] })
			startIconScale = 1.3
			CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 17, OffsetY = 0,
				Font = "AlegreyaSansSCExtraBold",
				Justification = "Left",
				ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
				OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
			})
		else
			backingId = SpawnObstacle({ Name = "BurnSmall", Group = "Combat_UI_World", DestinationId = unitId, TriggerOnSpawn = false })
			CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 12, OffsetY = 0,
				Font = "AlegreyaSansSCExtraBold",
				Justification = "Left",
				ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
				OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
			})
		end
		EnemyHealthDisplayAnchors[ unitId .. "burnstatus" ] = backingId
	end

	local scaleTarget = 1.0

	SetScale({ Id = EnemyHealthDisplayAnchors[ unitId .. "burnstatus" ], Fraction = startIconScale })
	ModifyTextBox({ Id = EnemyHealthDisplayAnchors[ unitId .. "burnstatus" ], Text = tostring( stacks ), ScaleTarget = scaleTarget, Color = poisonStatusFontColor })
	PositionEffectStacks( unitId )
end

function ClearBurnEffectStacks( args )
	Destroy({ Id = EnemyHealthDisplayAnchors[ args.triggeredById .. "burnstatus" ] })
	EnemyHealthDisplayAnchors[ args.triggeredById .. "burnstatus" ] = nil
	PositionEffectStacks( args.triggeredById )
end

OnEffectStackDecrease{
	function( triggerArgs )
		if triggerArgs.EffectName == "BurnOverTime" then
			UpdateBurnEffectStacks(triggerArgs)
		end
	end
}

basePositionEffectStacks = PositionEffectStacks
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
  if EnemyHealthDisplayAnchors[ id .. "burnstatus" ] then
      table.insert( effects, EnemyHealthDisplayAnchors[ id .. "burnstatus" ])
	end
	if EnemyHealthDisplayAnchors[ id .. "rupturestatus" ] then
		table.insert( effects, EnemyHealthDisplayAnchors[ id .. "rupturestatus" ])
	end

	local spacing = 45
	if unit.UseBossHealthBar then
		spacing = 60
	end
	local width = (TableLength( effects ) - 1) * spacing

	for i, effectId in pairs( effects ) do
		if unit.UseBossHealthBar then
			Attach({ Id = effectId, DestinationId = EnemyHealthDisplayAnchors[id], OffsetY = 25, OffsetX = ((i - 1) * spacing - width/2) })
		else
			Attach({ Id = effectId, DestinationId = EnemyHealthDisplayAnchors[id], OffsetY = -30, OffsetX = ((i - 1) * spacing - width/2) })
		end
	end
end

function HestiaMaxShout()
	FireWeaponFromUnit({ Weapon = "HestiaMaxSuper", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true, ClearAllFireRequests = true })
end

function HestiaShout()
	FireWeaponFromUnit({ Weapon = "HestiaSuper", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true, ClearAllFireRequests = true })
end

function EndHestia()
	ExpireProjectiles({ Names = { "HestiaSuper", "HestiaMaxSuper" } })
end
