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
            Enabled = true,
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
                    Enabled = true,
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
        ForceBestBuild =
        {
            --When enabled you will get :
            --Chamber 3 Epic Athena Special
            --Chamber 4 Epic Ares Attack
            --Chamber 5 Merciful end
            Enabled = true,
        }
    }
}