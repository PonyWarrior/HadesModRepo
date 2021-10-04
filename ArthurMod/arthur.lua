if ArthurMod.Config.Enabled then
    local config = ArthurMod.Config

    local mod = "ArthurMod"
    local package = "ArthurMod"
    ModUtil.Path.Wrap( "SetupMap", function(baseFunc)
        DebugPrint({Text = "@"..mod.." Trying to load package "..package..".pkg"})
        LoadPackages({Name = package})
        return baseFunc()
    end)

    table.insert(DeathLoopData.DeathAreaBedroom.UnthreadedEvents,{FunctionName = "ArthurMod.SpawnArthur"})

    function ArthurMod.SpawnArthur()
        if GameState.LastWeaponUpgradeData.SwordWeapon.Index == 4 then
            local newUnit = DeepCopyTable( EnemyData.NPC_Arthur_01 )
            local spawnPointId = 421158

            targetId = SpawnObstacle({ Name = "BlankObstacle", Group = "FX_Terrain", DestinationId = spawnPointId, OffsetX = 350, OffsetY = -150 })

            newUnit.ObjectId = SpawnUnit({ Name = "NPC_Arthur_01", Group = "Standing", DestinationId = targetId})
            newUnit.ArthurId = newUnit.ObjectId
            currentRun.ArthurId = newUnit.ArthurId

            SetupEnemyObject( newUnit, CurrentRun, { IgnoreAI = true, PreLoadBinks = true, } )
            UseableOn({ Ids = newUnit.ObjectId })
            SetupAI( CurrentRun, newUnit )
            CheckAvailableTextLines( newUnit )
            Activate({ Ids = newUnit.ObjectId })
        end
    end

end