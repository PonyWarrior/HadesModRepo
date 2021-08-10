SaveIgnores["ChallengeData"] = true

ChallengeData =
{
    Challenge1 =
    {
        Name = "Challenge 1",
        Description = "Skip Tartarus and start directly in Asphodel. Can you survive the heat of Asphodel with only your starting boon?",
        Author = "PonyWarrior",
        SetupFunction = "Challenge1",
        HasHardMode = true,
        HardMode = "Challenge1_Hard",
        IsHardMode = false,
        HellMode = false,
    },

    Challenge1_Hard =
    {
        Name = "Challenge 1 Hard Mode",
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
}