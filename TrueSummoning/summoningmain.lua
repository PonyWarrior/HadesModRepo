ModUtil.RegisterMod("TrueSummoning")

SaveIgnores["TrueSummoning"] = true

function TrueSummoning.MegaeraAssist()
    local summondata = EnemyData.MegSummon
    local newSummon = DeepCopyTable( summondata )
    newSummon.AIOptions = summondata.AIOptions
    newSummon.BlocksLootInteraction = false
    local invaderSpawnPoint = 40000
    newSummon.ObjectId = SpawnUnit({
            Name = summondata.Name,
            Group = "Standing",
            DestinationId = invaderSpawnPoint, OffsetX = 400, OffsetY = 200 })
    SetupEnemyObject( newSummon, CurrentRun )
end