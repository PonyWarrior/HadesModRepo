
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
        roomData.FlipHorizontalChance = 0.0
    end

    RoomData.RoomOpening.ForcedRewardStore = "MetaProgress"
    RoomData.RoomOpening.LinkedRooms = {"A_Boss01", "A_Boss02", "A_Boss03"}

    RoomData.A_Boss01.EligibleRewards = {}
    RoomData.A_Boss02.EligibleRewards = {}
    RoomData.A_Boss03.EligibleRewards = {}

    RoomData.A_PostBoss01.LinkedRoom = "B_Boss01"
    RoomData.A_PostBoss02.LinkedRoom = "B_Boss01"
    RoomData.A_PostBoss03.LinkedRoom = "B_Boss01"

    RoomData.B_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.B_Boss01.EligibleRewards = {}
    RoomData.B_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.B_PostBoss01.LinkedRoom = "C_Boss01"

    RoomData.C_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.C_PostBoss01.LinkedRoom = "D_Boss01"
    RoomData.C_Boss01.EligibleRewards = {}
    RoomData.C_Boss01.RemoveTimerBlock = "InterBiome"

    RoomData.D_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.D_Boss01.EligibleRewards = {}
end

function ChallengeMod.BossRushRoomsetHard()
    for _, roomData in pairs(RoomData) do
        roomData.SecretSpawnChance = 0.0
        roomData.ShrinePointDoorSpawnChance = 0.0
        roomData.ChallengeSpawnChance = 0.0
        roomData.WellShopSpawnChance = 0.0
        roomData.SellTraitShopChance = 0.0
        roomData.FishingPointChance = 0.0
        roomData.FlipHorizontalChance = 0.0
    end

    RoomData.RoomOpening.UnthreadedEvents = nil
    RoomData.RoomOpening.LinkedRooms = {"A_Boss01", "A_Boss02", "A_Boss03"}

    RoomData.A_Boss01.NextRoomSet = { "Asphodel"}
    RoomData.A_Boss01.LinkedRoom = "B_Boss02"
    RoomData.A_Boss01.EligibleRewards = {}

    RoomData.A_Boss02.NextRoomSet = { "Asphodel"}
    RoomData.A_Boss02.LinkedRoom = "B_Boss02"
    RoomData.A_Boss02.EligibleRewards = {}

    RoomData.A_Boss03.NextRoomSet = { "Asphodel"}
    RoomData.A_Boss03.LinkedRoom = "B_Boss02"
    RoomData.A_Boss03.EligibleRewards = {}

    RoomData.B_Boss02.NextRoomSet = {"Elysium"}
    RoomData.B_Boss02.LinkedRoom = "C_Boss01"
    RoomData.B_Boss02.RemoveTimerBlock = "InterBiome"
    RoomData.B_Boss02.EligibleRewards = {}

    RoomData.C_Boss01.NextRoomSet = {"Styx"}
    RoomData.C_Boss01.LinkedRoom = "D_Boss01"
    RoomData.C_Boss01.EligibleRewards = {}
    RoomData.C_Boss01.RemoveTimerBlock = "InterBiome"

    RoomData.D_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.D_Boss01.EligibleRewards = {}
end