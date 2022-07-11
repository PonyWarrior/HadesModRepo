ModUtil.RegisterMod("FreshFileFun")

FreshFileFun =
{
    Config =
    {
        -- Disabling this disables everything
        Enabled = true,
        Pact =
        {
            -- Disabling this disables all pact options
            Enabled = false,
            Options =
            {
                HardLabor =
                {
                    Enabled = false,
                    Level = 5, -- max 5
                },
                LastingConsequences =
                {
                    Enabled = false,
                    Level = 4, -- max 4
                },
                ConvenienceFee =
                {
                    Enabled = false,
                    Level = 2, -- max 2
                },
                JurySummons =
                {
                    Enabled = false,
                    Level = 3, -- max 3
                },
                ExtremeMeasures =
                {
                    Enabled = false,
                    Level = 4, -- max 4
                },
                CalisthenicsProgram =
                {
                    Enabled = false,
                    Level = 2, -- max 2
                },
                BenefitsPackage =
                {
                    Enabled = false,
                    Level = 2, -- max 2
                },
                MiddleManagement =
                {
                    Enabled = false,
                    Level = 2, -- max 2
                },
                UnderworldCustoms =
                {
                    Enabled = false,
                    Level = 1, -- max 1
                },
                ForcedOvertime =
                {
                    Enabled = false,
                    Level = 2, -- max 2
                },
                HeightenedSecurity =
                {
                    Enabled = false,
                    Level = 1, -- max 1
                },
                RoutineInspection =
                {
                    Enabled = false,
                    Level = 4, -- max 4
                },
                DamageControl =
                {
                    Enabled = false,
                    Level = 2, -- max 2
                },
                ApprovalProcess =
                {
                    Enabled = false,
                    Level = 2, -- max 2
                },
                TightDeadline =
                {
                    Enabled = false,
                    Level = 2, -- max 2
                },
                PersonalLiability =
                {
                    Enabled = false,
                    Level = 1, -- max 1
                },
            }
        },
        WeaponSelector =
        {
            Enabled = false,
            Weapon = 1, -- Sword = 1; Bow = 2; Spear = 3; Shield = 4; Rail = 5; Fists = 6
            Aspect = 1, -- Any Zagreus = 1; Nemesis/Achilles/Chaos/Chiron/Talos/Eris = 2; Poseidon/Hades/Zeus/Hera/Demeter/Hestia = 3; Arthur/GuanYu/Beowulf/Rama/Gilgamesh/Lucifer = 4;
            AspectRarity = 1, -- 1 = Common; 2 = Rare; 3 = Epic; 4 = Heroic; 5 = Legendary
        },
        ForceBestBuild =
        {
            --When enabled you will get :
            --Chamber 3 Epic Athena Special
            --Chamber 4 Epic Ares Attack
            --Chamber 5 Merciful end
            Enabled = true,
        },
        GodPoolSelector =
        {
            Enabled = false,
            EnableHermes = false, -- when enabled you will encounter hermes
            EnableHammer = false, -- when enabled you will encounter daedalus hammers
            EnableChaos = false, -- when enabled you will encounter chaos gates
            EnableErebus = false, -- when enabled you will encounter erebus gates
            EnablePoolPicker = false, -- when enabled lets you pick the 4 gods you will encounter
            Gods =
            {
                -- Set EnablePoolPicker to true to use this
                -- Pick the 4 gods you want to encounter
                -- 1 = Zeus; 2 = Poseidon; 3 = Athena; 4 = Aphrodite; 5 = Artemis; 6 = Dionysus; 7 = Demeter; 8 = Ares
                God1 = 1,
                God2 = 2,
                God3 = 3,
                God4 = 4,
            }
        }
    }
}