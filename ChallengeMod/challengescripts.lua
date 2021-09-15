
function Challenge1()
    RoomSetData.Tartarus.RoomOpening.NextRoomSet = {"Asphodel"}
end

function ChallengeMod.BossRushRoomset()
    for _, roomData in pairs(RoomData) do
        roomData.SecretSpawnChance = 0.0
        roomData.ShrinePointDoorSpawnChance = 0.0
        roomData.ChallengeSpawnChance = 0.0
        roomData.WellShopSpawnChance = 0.0
        roomData.SellTraitShopChance = 0.0
        roomData.FishingPointChance = 0.0
    end

    RoomData.RoomOpening.ForcedRewardStore = "MetaProgress"
    RoomData.RoomOpening.LinkedRoom = "A_Boss01"
    RoomData.B_Intro.LinkedRoom = "B_Boss01"
    RoomData.C_Intro.LinkedRoom = "C_Boss01"
    RoomData.D_Intro.LinkedRoom = "D_Boss01"
end