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
        HasHardMode = true,
        HardMode = "Challenge1_Hard",
        IsHardMode = false,
        HellMode = false,
    },

    Challenge1_Hard =
    {
        Name = "Tartarus skip - Hard Mode",
        Description = "You thought that was too easy? Try again but with a pitiful health pool and in hell mode. Good luck!",
        SetupFunction = "Challenge1",
        HasHardMode = false,
        IsHardMode = true,
        HellMode = true,
        PlayerModifiers =
        {
            {
                TargetProperty = "MaxHealth",
                Value = 10,
                IsAbsolute = true,
            },
        },
        -- ForcePactOptions =
        -- {
        --     {
        --         Name = "ShopPrices",
        --         Level = 1
        --     },
        -- },
    },

    BossRush =
    {
        Name = "Boss Rush",
        Description = "Fight the Fury, Bone Hydra, Heroes of Elysium and Hades one after the other as fast as you can with one of the build provided.",
        Author = "PonyWarrior",
        HasHardMode = false,
        IsHardMode = false,
        HellMode = false,
        SetupFunction = "ChallengeMod.BossRushRoomset",
        RestoreRoomData = true,
    },

    -- BossRush_Hard =
    -- {
    --     Name = "Boss Rush - Hard Mode",
    --     Description = "Fight the Furies, Bone Hydra, Heroes of Elysium and Hades one after the other as fast as you can with one of the build provided, with Extreme Measures.",
    --     Author = "PonyWarrior",
    --     HasHardMode = false,
    --     IsHardMode = true,
    --     HellMode = false,
    --     SetupFunction = "ChallengeMod.BossRushSetup",
    --     UseCustomRoomSet = true,
    --     CustomRoomSet =
    --     {
    --     },
    --     ForcePactOptions =
    --     {
    --         {
    --             Name = "BossDifficultyShrineUpgrade",
    --             Level = 4
    --         },
    --     },
    -- },
}