local config =
{
    ExcludeTraps = false,
    ExcludeMiscs = false,
}

local Outlines =
{
    -- Fallback if the biome name is somehow nil
    Default =
    {
        R = 50,
        G = 50,
        B = 255,
        Opacity = 0.8,
        Thickness = 1,
        Threshold = 0.6,
    },
    Tartarus =
    {
        R = 50,
        G = 50,
        B = 255,
        Opacity = 0.8,
        Thickness = 1,
        Threshold = 0.6,
    },
    Asphodel =
    {
        R = 50,
        G = 50,
        B = 255,
        Opacity = 0.8,
        Thickness = 1,
        Threshold = 0.6,
    },
    Elysium =
    {
        R = 50,
        G = 50,
        B = 255,
        Opacity = 0.8,
        Thickness = 1,
        Threshold = 0.6,
    },
    Styx =
    {
        R = 50,
        G = 50,
        B = 255,
        Opacity = 0.8,
        Thickness = 1,
        Threshold = 0.6,
    },
    -- Only for Greece, dad fight is in Styx
    Surface =
    {
        R = 50,
        G = 50,
        B = 255,
        Opacity = 0.8,
        Thickness = 1,
        Threshold = 0.6,
    },
}

function IsOutlineLegal(enemy)
    if config.ExcludeTraps and enemy.InheritFrom ~= nil and Contains(enemy.InheritFrom, "BaseTrap") then
        return false
    end

    if config.ExcludeMiscs and enemy.InheritFrom ~= nil and Contains(enemy.InheritFrom, "BaseBreakable") then
        return false
    end

    if enemy.Name == "HarpySupportUnit" then
        return false
    end

    if enemy.InheritFrom ~= nil and Contains(enemy.InheritFrom, "IsNeutral") then
        return false
    end

    return true
end

function CreateLevelDisplay( newEnemy, currentRun )
    -- Mod start
    if IsOutlineLegal(newEnemy) then
        newEnemy.Outline = Outlines[CurrentRun.CurrentRoom.RoomSetName] or Outlines.Default
        newEnemy.Outline.Id = newEnemy.ObjectId
        AddOutline( newEnemy.Outline )
    end
    -- Mod end

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

function DoEnemyHealthBufferDeplete( enemy )
	if enemy.OnHealthBufferDepleteFunctionName ~= nil then
		_G[enemy.OnHealthBufferDepleteFunctionName]( enemy )
    end
    -- Mod start
    -- RemoveOutline({ Id = enemy.ObjectId })
    -- Mod end
	if enemy.TetherIds ~= nil then
		for k, tetherId in ipairs( enemy.TetherIds ) do
			RemoveOutline({ Id = tetherId })
		end
	end
	if not enemy.WasImmuneToStunWithoutArmor then
		SetUnitProperty({ Property = "ImmuneToStun", Value = false, DestinationId = enemy.ObjectId })
	end
	ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId, WeaponName = "ArmorBreakAttack", EffectName = "ArmorBreakStun" })
end

OnAnyLoad{function ()
    while 1 == 1 do
	    local ammoIds = GetIdsByType({ Name = "AmmoPack" })
        if ammoIds ~= nil then
            for _, id in pairs (ammoIds) do
                local outline = Outlines[CurrentRun.CurrentRoom.RoomSetName] or Outlines.Default
                outline.Id = id
                AddOutline( outline )
            end
        end
        wait(1)
    end
end}

ModUtil.WrapBaseFunction( "HarpyKillPresentation", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)

ModUtil.WrapBaseFunction( "HydraKillPresentation", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)

ModUtil.WrapBaseFunction( "HydraKillPresentation", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)

ModUtil.WrapBaseFunction( "TheseusMinotaurKillPresentation", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)

ModUtil.WrapBaseFunction( "CrawlerMiniBossKillPresentation", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)

ModUtil.WrapBaseFunction( "HadesKillPresentation", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)

ModUtil.WrapBaseFunction( "KillPresentation", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)

ModUtil.WrapBaseFunction( "DeathPresentation", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)

ModUtil.WrapBaseFunction( "BoatToDeathAreaTransition", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)

ModUtil.WrapBaseFunction( "SurfaceDeathPresentation", function(baseFunc, unit, args)
    RemoveOutline({ Id = unit.ObjectId})
    return baseFunc(unit, args)
end)