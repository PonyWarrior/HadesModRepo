SaveIgnores["ChallengeData"] = true

ChallengeData =
{
    --Template
    Challenge1 =
    {
        Name = "Tartarus skip",
        Description = "Zagreus jumped a bit further from the window and landed in Asphodel. Can you survive the heat of Asphodel with only your starting boon?",
        Author = "PonyWarrior",
        SetupFunction = "Challenge1",
        RestoreRoomData = true,
        HellMode = false,
        HardMode =
        {
            Description = "You thought that was too easy? Try again but with a pitiful health pool and in hell mode. Good luck!",
            SetupFunction = "Challenge1",
            HellMode = true,
            PlayerModifiers =
            {
                {
                    TargetProperty = "MaxHealth",
                    Value = 10,
                    IsAbsolute = true,
                },
            },
        },
    },

    BossRush =
    {
        Name = "Boss Rush",
        Description = "Fight the Fury, Bone Hydra, Heroes of Elysium and Hades one after the other as fast as you can with one of the build provided.",
        Author = "PonyWarrior",
        HellMode = false,
        SetupFunction = "ChallengeMod.BossRushRoomset",
        RestoreRoomData = true,
        HardMode =
        {
            Description = "Fight the Furies, Bone Hydra, Heroes of Elysium and Hades one after the other as fast as you can with one of the build provided, with Extreme Measures, Hell Mode and no midbiome rooms.",
            HellMode = true,
            SetupFunction = "ChallengeMod.BossRushRoomsetHard",
            RestoreRoomData = true,
            ForcedPactOptions =
            {
                {
                    Name = "BossDifficultyShrineUpgrade",
                    Level = 4
                },
            },
        },
    },
}