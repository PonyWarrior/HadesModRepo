
OnAnyLoad{"RoomPreRun", function(triggerArgs) 
    local selector = DeepCopyTable( ObstacleData.SecretDoor )
    selector.ObjectId = SpawnObstacle({ Name = "ShrinePointDoor", Group = "FX_Terrain", DestinationId = CurrentRun.Hero.ObjectId, AttachedTable = selector, OffsetX = -1250, OffsetY = -1150 })
    SetupObstacle( selector )
    AddToGroup({Id = selector.ObjectId, Name = "ChallengeSelector"})
end}

OnUsed{"ChallengeSelector", function(triggerArgs)
    DebugPrint({Text="test"})
end}
