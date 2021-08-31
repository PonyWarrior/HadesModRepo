UnitSetData.Enemies.MegSummon =
{
    InheritFrom = { "BaseVulnerableEnemy"},
    Portrait = "Portrait_FurySister01_Default_01",
    RequiredKill = false,
    DropItemsOnDeath = false,
    UseShrineUpgrades = false,
	AlwaysTraitor = true,
    AnimOffsetZ = 260,
    MaxHealth = 1000,
    AISetupDelay = 1.5,
    EmoteOffsetX = 0,
    EmoteOffsetY = -220,

    SpeechCooldownTime = 11,

    Groups = { "GroundEnemies", "FlyingEnemies", "TrainingEnemies" },
    -- OnDeathFunctionName = "HarpyKillPresentation",
    -- OnDeathFunctionArgs = { Message = "HarpyDefeatedMessage", BossDifficultyMessage = "HarpiesDefeatedMessage", CameraPanTime = 1.5, StartSound = "/Leftovers/Menu Sounds/EmoteShocked", BatsAfterDeath = true, FlashRed = true, AddInterBiomeTimerBlock = true },
    DeathAnimation = "FuryDead",
    FightStartGlobalVoiceLines = "MultiFuryFightStartVoiceLines",
    ClearChillOnDeath = true,

    Material = "Organic",
    HealthBarOffsetY = -275,
    --RepulseOnMeleeInvulnerableHit = 400,
    IgnoreInvincibubbleOnHit = true,

    AdditionalEnemySetupFunctionName = "TrueSummoning.SelectSupportAIs",

    DefaultAIData =
    {
        IgnoreInvulnerable = true,
    },

    IncomingDamageModifiers =
    {
        -- {
        --     Name = "BaseVulnerability",
        --     NonPlayerMultiplier = 8,
        --     Multiplicative = true,
        -- },
        {
            Name = "Innate",
            PlayerMultiplier = 0,
        },
    },

    AIOptions =
    {
        AggroAI,
    },
    PostAggroAI = AttackerAI,

    WeaponOptions = { "HarpyLunge", "HarpyWhipWhirl", "HarpyLightning", "HarpyBeam" },
    DisarmedWeapon = "HarpyLunge",

    ShrineMetaUpgradeName = "BossDifficultyShrineUpgrade",
    SupportAIWeaponSetOptions = { "Tisiphone", "Alecto" },
    SupportUnitName = "MegSupportUnit",

    SpawnOptions =
    {
        "HeavyMelee",
        "LightRanged",
    },

    AIEndHealthThreshold = 0.75,
    AIStages =
    {
        {
            RandomAIFunctionNames = { "AttackerAI" },

            AddSupportAIWeaponOptions =
            {
                -- Tisiphone
                Tisiphone = {
                    "SummonTisiphoneBombingRun"
                },
                -- Alecto
                Alecto = {
                    "SummonAlectoWhipShot"
                },
            },

            AIData =
            {
                AIEndHealthThreshold = 0.75,
            },
        },
        {
            RandomAIFunctionNames = { "AttackerAI" },
            EquipRandomWeapon = { "HarpyLightning", "HarpyBeam" },
            TransitionFunction = "BossStageTransition",
            TransitionAnimation = "FuryShieldedStart",

            AIData =
            {
                AIEndHealthThreshold = 0.50,
            },

            StageTransitionVoiceLines =
            {
                {
                    RandomRemaining = true,
                    BreakIfPlayed = true,
                    PreLineWait = 0.75,
                    CooldownTime = 20,
                    CooldownName = "MegSpokeRecently",
                    RequiredFalseTextLines = { "MegaeraGift10" },
                    SuccessiveChanceToPlay = 0.33,

                    -- We're not finished yet.
                    { Cue = "/VO/MegaeraField_0113" },
                    -- We're only getting started.
                    { Cue = "/VO/MegaeraField_0114" },
                    -- I'll make you suffer.
                    { Cue = "/VO/MegaeraField_0116" },
                    -- Best not get overconfident.
                    { Cue = "/VO/MegaeraField_0118" },
                    -- You've got a lot of nerve.
                    { Cue = "/VO/MegaeraField_0122" },
                    -- I don't think so.
                    { Cue = "/VO/MegaeraField_0276" },
                    -- You're weak, Zag.
                    { Cue = "/VO/MegaeraField_0277", ConsecutiveDeathsInRoom = { Name = "A_Boss01", Count = 2, }, },
                    -- Weak.
                    { Cue = "/VO/MegaeraField_0278", ConsecutiveDeathsInRoom = { Name = "A_Boss01", Count = 1, }, },
                    -- Not a chance.
                    { Cue = "/VO/MegaeraField_0279", ConsecutiveDeathsInRoom = { Name = "A_Boss01", Count = 2, }, },
                    -- I think not.
                    { Cue = "/VO/MegaeraField_0280" },
                    -- Fool.
                    { Cue = "/VO/MegaeraField_0281" },
                    -- Pshh.
                    { Cue = "/VO/MegaeraField_0282" },
                    -- You can't hurt me.
                    { Cue = "/VO/MegaeraField_0283" },
                },
                {
                    RandomRemaining = true,
                    BreakIfPlayed = true,
                    PreLineWait = 0.75,
                    CooldownTime = 20,
                    CooldownName = "MegSpokeRecently",
                    RequiredTextLines = { "MegaeraGift10" },
                    SuccessiveChanceToPlay = 0.33,

                    -- That's it.
                    { Cue = "/VO/MegaeraField_0290" },
                    -- All right.
                    { Cue = "/VO/MegaeraField_0291" },
                    -- Don't you dare hold back.
                    { Cue = "/VO/MegaeraField_0652" },
                    -- Now we're getting somewhere.
                    { Cue = "/VO/MegaeraField_0653" },
                    -- Think you can keep this up?
                    { Cue = "/VO/MegaeraField_0649" },
                    -- We aren't finished here.
                    { Cue = "/VO/MegaeraField_0655" },
                    -- You haven't got me yet.
                    { Cue = "/VO/MegaeraField_0656" },
                    -- I think not.
                    { Cue = "/VO/MegaeraField_0280" },
                    -- Pshh.
                    { Cue = "/VO/MegaeraField_0282" },
                    -- You can't hurt me.
                    { Cue = "/VO/MegaeraField_0283" },
                    -- I don't think so.
                    { Cue = "/VO/MegaeraField_0276" },
                    -- No.
                    { Cue = "/VO/MegaeraField_0780" },
                    -- I don't think so.
                    { Cue = "/VO/MegaeraField_0781" },
                },
            },
        },
        {
            RandomAIFunctionNames = { "AttackerAI" },
            -- EquipRandomWeapon = { "HarpySpawns" },
            TransitionFunction = "BossStageTransition",
            TransitionAnimation = "FuryShieldedStart",
            --CombatText = "PoweredUp",

            AddSupportAIWeaponOptions =
            {
                -- Tisiphone
                Tisiphone = {
                    -- "SummonTisiphoneFog"
                },
                -- Alecto
                Alecto = {
                    "SummonAlectoLightningChase"
                },
            },
            AIData =
            {
                AIEndHealthThreshold = 0.25,
            },

            StageTransitionVoiceLines =
            {
                {
                    RandomRemaining = true,
                    BreakIfPlayed = true,
                    PreLineWait = 0.75,
                    SuccessiveChanceToPlay = 0.75,
                    CooldownTime = 12,
                    CooldownName = "MegSpokeRecently",

                    -- Wretches of Tartarus, to me!
                    { Cue = "/VO/MegaeraField_0106" },
                    -- Wretches of the Underworld, to me!
                    { Cue = "/VO/MegaeraField_0107" },
                    -- Hear me, on my authority!
                    { Cue = "/VO/MegaeraField_0108" },
                    -- In the name of Hades!
                    { Cue = "/VO/MegaeraField_0109" },
                    -- Hear me, you wretched shades!
                    { Cue = "/VO/MegaeraField_0110" },
                    -- I need some backup, now!
                    { Cue = "/VO/MegaeraField_0111" },
                    -- Let's see you handle this!
                    { Cue = "/VO/MegaeraField_0112" },
                    -- I need backup, now!
                    { Cue = "/VO/MegaeraField_0284" },
                    -- Come, wretches!
                    { Cue = "/VO/MegaeraField_0285" },
                    -- Requesting backup, damn it!
                    { Cue = "/VO/MegaeraField_0286" },
                    -- Come and kill him, wretches!
                    { Cue = "/VO/MegaeraField_0287" },
                    -- Wretches, bring him down!
                    { Cue = "/VO/MegaeraField_0288" },
                    -- Meet some of my friends.
                    { Cue = "/VO/MegaeraField_0289" },
                    -- Wretches of Tartarus, I summon you!
                    { Cue = "/VO/MegaeraField_0642" },
                    -- Hear me, Wretches, and come fight with me!
                    { Cue = "/VO/MegaeraField_0643" },
                    -- Back me up, Wretches of Tartarus, right now!
                    { Cue = "/VO/MegaeraField_0644" },
                    -- All right, you wretched shades, appear!
                    { Cue = "/VO/MegaeraField_0645" },
                    -- Hope you don't mind if I invited a few friends?
                    { Cue = "/VO/MegaeraField_0646", RequiredTextLines = { "MegaeraGift10" } },
                    -- Requesting immediate assistance!
                    { Cue = "/VO/MegaeraField_0647" },
                    -- Requesting backup, Tartarus entryway!
                    { Cue = "/VO/MegaeraField_0648" },
                    -- Requesting backup, now!
                    { Cue = "/VO/MegaeraField_0782" },
                    -- Wretches of Tartarus, come in!
                    { Cue = "/VO/MegaeraField_0783" },
                    -- Requesting backup!
                    { Cue = "/VO/MegaeraField_0784" },
                    -- Come, Wretches!
                    { Cue = "/VO/MegaeraField_0785" },
                    -- Come, Wretches! On my authority!
                    { Cue = "/VO/MegaeraField_0786" },
                    -- Wretches, now!
                    { Cue = "/VO/MegaeraField_0787" },
                    -- Here, Wretches!
                    { Cue = "/VO/MegaeraField_0788" },
                },

            },
        },
        {
            RandomAIFunctionNames = { "AttackerAI" },
            EquipRandomWeapon = { "HarpyLightning", "HarpyBeam" },
            TransitionFunction = "BossStageTransition",
            TransitionAnimation = "FuryShieldedStart",
            AIData =
            {
                AIEndHealthThreshold = 0.0,
            },
            StageTransitionVoiceLines =
            {
                {
                    RandomRemaining = true,
                    BreakIfPlayed = true,
                    PreLineWait = 0.75,
                    CooldownTime = 12,
                    SuccessiveChanceToPlay = 0.33,
                    CooldownName = "MegSpokeRecently",
                    RequiredFalseTextLines = { "MegaeraGift10" },

                    -- You're going to pay for this.
                    { Cue = "/VO/MegaeraField_0115" },
                    -- I am not finished yet.
                    { Cue = "/VO/MegaeraField_0117" },
                    -- This isn't over yet.
                    { Cue = "/VO/MegaeraField_0119" },
                    -- I will not let you win.
                    { Cue = "/VO/MegaeraField_0120" },
                    -- You haven't beat me yet.
                    { Cue = "/VO/MegaeraField_0121" },
                    -- That's it.
                    { Cue = "/VO/MegaeraField_0290" },
                    -- All right.
                    { Cue = "/VO/MegaeraField_0291" },
                    -- Let's end this.
                    { Cue = "/VO/MegaeraField_0292" },
                    -- This ends here.
                    { Cue = "/VO/MegaeraField_0293" },
                    -- I'm not through with you yet.
                    { Cue = "/VO/MegaeraField_0294" },
                    -- Enough of this.
                    { Cue = "/VO/MegaeraField_0295" },
                    -- We aren't finished here.
                    { Cue = "/VO/MegaeraField_0655" },
                    -- You haven't got me yet.
                    { Cue = "/VO/MegaeraField_0656" },
                },
                {
                    RandomRemaining = true,
                    BreakIfPlayed = true,
                    PreLineWait = 0.75,
                    CooldownTime = 12,
                    SuccessiveChanceToPlay = 0.2,
                    CooldownName = "MegSpokeRecently",
                    RequiredTextLines = { "MegaeraGift10" },

                    -- This isn't over yet.
                    { Cue = "/VO/MegaeraField_0119" },
                    -- That's it.
                    { Cue = "/VO/MegaeraField_0290" },
                    -- All right.
                    { Cue = "/VO/MegaeraField_0291" },
                    -- Let's end this.
                    { Cue = "/VO/MegaeraField_0292" },
                    -- This ends here.
                    { Cue = "/VO/MegaeraField_0293" },
                    -- I'm not through with you yet.
                    { Cue = "/VO/MegaeraField_0294" },
                    -- I'm not finished with you yet.
                    { Cue = "/VO/MegaeraField_0650" },
                    -- You've gotten stronger, Zag.
                    { Cue = "/VO/MegaeraField_0651" },
                    -- You used to be a total pushover.
                    { Cue = "/VO/MegaeraField_0654" },
                    -- How did you get this tough.
                    { Cue = "/VO/MegaeraField_0657" },
                    -- Enough, let's finish this.
                    { Cue = "/VO/MegaeraField_0658" },
                },
            },
        },
    },

    PlayerInjuredVoiceLineThreshold = 0.75,
    PlayerInjuredVoiceLines =
    {
        RandomRemaining = true,
        BreakIfPlayed = true,
        PreLineWait = 0.75,
        SuccessiveChanceToPlay = 0.25,
        CooldownTime = 120,
        CooldownName = "MegSpokeRecently",

        -- Go home, Zagreus.
        { Cue = "/VO/MegaeraField_0123" },
        -- That's what you get.
        { Cue = "/VO/MegaeraField_0124" },
        -- Hah! Idiot.
        { Cue = "/VO/MegaeraField_0125", RequiredFalseTextLines = { "MegaeraGift10" } },
        -- To hell with you.
        { Cue = "/VO/MegaeraField_0130", RequiredFalseTextLines = { "MegaeraGift10" } },
        -- Get the hell out of here.
        { Cue = "/VO/MegaeraField_0131", RequiredFalseTextLines = { "MegaeraGift10" } },
        -- You stupid little fool.
        -- { Cue = "/VO/MegaeraField_0132" },
        -- <Laughter>
        { Cue = "/VO/MegaeraField_0134" },
        -- <Laughter>
        { Cue = "/VO/MegaeraField_0135" },
        -- <Laughter>
        { Cue = "/VO/MegaeraField_0136" },
        -- I'll show you pain.
        { Cue = "/VO/MegaeraField_0268" },
        -- How did that feel?
        { Cue = "/VO/MegaeraField_0269" },
        -- There.
        { Cue = "/VO/MegaeraField_0270" },
        -- That was nothing.
        { Cue = "/VO/MegaeraField_0271" },
        -- For last time.
        { Cue = "/VO/MegaeraField_0272", ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 1 }, },
        -- I'll make you scream.
        { Cue = "/VO/MegaeraField_0273" },
        -- I'll hurt you worse than that.
        { Cue = "/VO/MegaeraField_0274" },
        -- I feel your pain.
        { Cue = "/VO/MegaeraField_0275" },
        -- Feel that?
        { Cue = "/VO/MegaeraField_0774", RequiredTextLines = { "MegaeraGift10" } },
        -- Like that?
        { Cue = "/VO/MegaeraField_0775", RequiredTextLines = { "MegaeraGift10" } },
        -- Want more?
        { Cue = "/VO/MegaeraField_0776", RequiredTextLines = { "MegaeraGift10" } },
        -- That's it.
        { Cue = "/VO/MegaeraField_0777", RequiredTextLines = { "MegaeraGift10" } },
        -- Hmm.
        { Cue = "/VO/MegaeraField_0778", RequiredTextLines = { "MegaeraGift10" } },
        -- Hah!
        { Cue = "/VO/MegaeraField_0779" },

    },
    LastStandReactionVoiceLineMinHealthThreshold = 0.25,
    LastStandReactionVoiceLines =
    {
        RandomRemaining = true,
        BreakIfPlayed = true,
        PreLineWait = 1.7,
        CooldownTime = 30,
        Queue = "Always",

        -- I'll get you yet.
        { Cue = "/VO/MegaeraField_0218" },
        -- Die already.
        { Cue = "/VO/MegaeraField_0219" },
        -- You lived through that?
        { Cue = "/VO/MegaeraField_0220" },
        -- Die!
        { Cue = "/VO/MegaeraField_0221" },
        -- Die, damn you.
        { Cue = "/VO/MegaeraField_0222" },
        -- Cute.
        { Cue = "/VO/MegaeraField_0223" },
        -- You're bleeding, Zagreus.
        { Cue = "/VO/MegaeraField_0224" },
        -- You can't hold out forever.
        { Cue = "/VO/MegaeraField_0225" },
        -- You're going home.
        { Cue = "/VO/MegaeraField_0226" },
        -- Give up.
        { Cue = "/VO/MegaeraField_0227" },
        -- Give up already.
        { Cue = "/VO/MegaeraField_0228" },
        -- You're dead.
        { Cue = "/VO/MegaeraField_0229" },
        -- You're mine.
        { Cue = "/VO/MegaeraField_0230" },
        -- I know Nyx is helping you.
        { Cue = "/VO/MegaeraField_0231" },
        -- You cheating little...
        { Cue = "/VO/MegaeraField_0232" },
        -- You're running out of chances, Zagreus.
        { Cue = "/VO/MegaeraField_0233" },
        -- You'll get what you deserve.
        { Cue = "/VO/MegaeraField_0234" },
        -- Got you for once.
        { Cue = "/VO/MegaeraField_0235", ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 3 }, },
        -- I hope that hurt.
        { Cue = "/VO/MegaeraField_0236", ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 2 }, },
        -- You and your dirty tricks.
        { Cue = "/VO/MegaeraField_0237", ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 2 }, },
        -- Hah!
        { Cue = "/VO/MegaeraField_0238", ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 2 }, },
        -- I can beat you.
        { Cue = "/VO/MegaeraField_0239", ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 2 }, },
        -- Slowed you down, have I?
        { Cue = "/VO/MegaeraField_0240", ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 3 }, },
        -- Give Hades my regards.
        { Cue = "/VO/MegaeraField_0128" },
    },
    WrathReactionVoiceLines =
    {
        Queue = "Interrupt",
        {
            RandomRemaining = true,
            PreLineWait = 1,
            PlayOnceFromTableThisRun = true,
            SuccessiveChanceToPlay = 0.5,

            -- What--?
            { Cue = "/VO/MegaeraField_0398", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- What...!
            { Cue = "/VO/MegaeraField_0399", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Zagreus...
            { Cue = "/VO/MegaeraField_0400", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Come then.
            { Cue = "/VO/MegaeraField_0401", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Do your worst.
            { Cue = "/VO/MegaeraField_0402", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- How...?
            { Cue = "/VO/MegaeraField_0403", RequiredPlayed = { "/VO/MegaeraField_0409" }, RequiredFalseTextLines = { "MegaeraGift07" } },
            -- How...
            { Cue = "/VO/MegaeraField_0404", RequiredPlayed = { "/VO/MegaeraField_0409" }, RequiredFalseTextLines = { "MegaeraGift07" } },
            -- What is this.
            { Cue = "/VO/MegaeraField_0405", RequiredPlayed = { "/VO/MegaeraField_0409" }, RequiredFalseTextLines = { "MegaeraGift07" } },
            -- What's gotten into you.
            { Cue = "/VO/MegaeraField_0406", RequiredPlayed = { "/VO/MegaeraField_0409" }, RequiredFalseTextLines = { "MegaeraGift07" } },
            -- So...
            { Cue = "/VO/MegaeraField_0407", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- How did you--?
            { Cue = "/VO/MegaeraField_0408", RequiredPlayed = { "/VO/MegaeraField_0409" }, RequiredFalseTextLines = { "MegaeraGift07" } },
            -- How did you...!
            { Cue = "/VO/MegaeraField_0409" },
            -- This again.
            { Cue = "/VO/MegaeraField_0410", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- You're angry.
            { Cue = "/VO/MegaeraField_0411", RequiredPlayed = { "/VO/MegaeraField_0409" }, RequiredFalseTextLines = { "MegaeraGift07" } },
            -- You have no self control.
            { Cue = "/VO/MegaeraField_0412", RequiredPlayed = { "/VO/MegaeraField_0409" }, RequiredFalseTextLines = { "MegaeraGift07" } },
            -- Control yourself.
            { Cue = "/VO/MegaeraField_0413", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Fight me yourself!
            { Cue = "/VO/MegaeraField_0697", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Need help against me, huh?
            { Cue = "/VO/MegaeraField_0698", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Calling in favors again?
            { Cue = "/VO/MegaeraField_0699", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Calling for help?
            { Cue = "/VO/MegaeraField_0700", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Nice trick...
            { Cue = "/VO/MegaeraField_0701", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- This again?
            { Cue = "/VO/MegaeraField_0702", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Come on, Zag.
            { Cue = "/VO/MegaeraField_0703", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Not this again.
            { Cue = "/VO/MegaeraField_0704", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- Oh no.
            { Cue = "/VO/MegaeraField_0705", RequiredPlayed = { "/VO/MegaeraField_0409" } },
            -- You'll need more help than that.
            { Cue = "/VO/MegaeraField_0706", RequiredPlayed = { "/VO/MegaeraField_0409" } },
        }
    },
    AssistReactionVoiceLines =
    {
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 0.8,
            SuccessiveChanceToPlay = 0.8,
            Queue = "Interrupt",
            RequiredTrait = "ThanatosAssistTrait",
            RequiredRoom = "A_Boss01",

            -- Thanatos, here?!
            { Cue = "/VO/MegaeraField_0557" },
            -- What is this, Than?!
            { Cue = "/VO/MegaeraField_0558" },
            -- Get out of here, Than.
            { Cue = "/VO/MegaeraField_0559" },
            -- This isn't your fight, Than.
            { Cue = "/VO/MegaeraField_0560" },
            -- Thanatos, again?
            { Cue = "/VO/MegaeraField_0561" },
            -- Thanatos!
            { Cue = "/VO/MegaeraField_0562" },
            -- Thanatos?!
            { Cue = "/VO/MegaeraField_0563" },
        },
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 0.8,
            SuccessiveChanceToPlay = 0.8,
            Queue = "Interrupt",
            RequiredTrait = "SkellyAssistTrait",
            RequiredRoom = "A_Boss01",

            -- What is the meaning of this?
            { Cue = "/VO/MegaeraField_0564" },
            -- Who is this idiot?
            { Cue = "/VO/MegaeraField_0565" },
            -- I didn't summon you!
            { Cue = "/VO/MegaeraField_0566" },
            -- How did that get in?!
            { Cue = "/VO/MegaeraField_0567" },
            -- Odd friends you're making, Zagreus!
            { Cue = "/VO/MegaeraField_0568" },
            -- It's that damn skeleton!
            { Cue = "/VO/MegaeraField_0569", RequiredPlayed = { "/VO/MegaeraField_0567" }, },
            -- The skeleton, again?
            { Cue = "/VO/MegaeraField_0570", RequiredPlayed = { "/VO/MegaeraField_0567" }, },
        },
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 0.8,
            SuccessiveChanceToPlay = 0.8,
            Queue = "Interrupt",
            RequiredTrait = "SisyphusAssistTrait",
            RequiredRoom = "A_Boss01",

            -- Sisyphus!!
            { Cue = "/VO/MegaeraField_0571" },
            -- Sisyphus?!
            { Cue = "/VO/MegaeraField_0572" },
            -- How dare you, Sisyphus?!
            { Cue = "/VO/MegaeraField_0573" },
            -- It can't be, Sisyphus?!
            { Cue = "/VO/MegaeraField_0574" },
            -- Damn you, Sisyphus!
            { Cue = "/VO/MegaeraField_0575" },
            -- You blasted wretch!!
            { Cue = "/VO/MegaeraField_0576" },
            -- How could you, Zagreus!!
            { Cue = "/VO/MegaeraField_0577" },
            -- You're going to be sorry, Sisyphus!
            { Cue = "/VO/MegaeraField_0578" },
        },
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 0.8,
            SuccessiveChanceToPlay = 0.8,
            Queue = "Interrupt",
            RequiredTrait = "DusaAssistTrait",
            RequiredRoom = "A_Boss01",

            -- Dusa?!
            { Cue = "/VO/MegaeraField_0713" },
            -- Dusa!
            { Cue = "/VO/MegaeraField_0714" },
            -- Dusa, here?
            { Cue = "/VO/MegaeraField_0715" },
            -- Dusa, how?
            { Cue = "/VO/MegaeraField_0716" },
            -- What are you doing, Dusa?!
            { Cue = "/VO/MegaeraField_0717" },
        },
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 0.8,
            SuccessiveChanceToPlay = 0.8,
            Queue = "Interrupt",
            RequiredTrait = "AchillesPatroclusAssistTrait",
            RequiredRoom = "A_Boss01",

            -- Get back to your post, Shade!
            { Cue = "/VO/MegaeraField_0740" },
            -- You shouldn't be here, Shade!
            { Cue = "/VO/MegaeraField_0741" },
            -- Achilles?!
            { Cue = "/VO/MegaeraField_0718", RequiredPlayed = { "/VO/MegaeraField_0740", "/VO/MegaeraField_0741" }, },
            -- Achilles!
            { Cue = "/VO/MegaeraField_0719", RequiredPlayed = { "/VO/MegaeraField_0740", "/VO/MegaeraField_0741" }, },
            -- Achilles, here?
            { Cue = "/VO/MegaeraField_0720", RequiredPlayed = { "/VO/MegaeraField_0740", "/VO/MegaeraField_0741" }, },
            -- Achilles, what?
            { Cue = "/VO/MegaeraField_0721", RequiredPlayed = { "/VO/MegaeraField_0740", "/VO/MegaeraField_0741" }, },
        },
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 0.8,
            Queue = "Interrupt",
            RequiredOneOfTraits = { "ThanatosAssistTrait", "SkellyAssistTrait", "SisyphusAssistTrait", "DusaAssistTrait", "AchillesPatroclusAssistTrait" },
            RequiredRoom = "A_Boss01",

            -- What is this, Zagreus?
            { Cue = "/VO/MegaeraField_0579" },
            -- Fight me yourself!
            { Cue = "/VO/MegaeraField_0580" },
            -- Can't handle me yourself?
            { Cue = "/VO/MegaeraField_0581" },
            -- You again?
            { Cue = "/VO/MegaeraField_0582" },
            -- You again!
            { Cue = "/VO/MegaeraField_0583" },
            -- I told you to get out!
            { Cue = "/VO/MegaeraField_0584" },
            -- I said stay out of this!
            { Cue = "/VO/MegaeraField_0585" },
            -- Get out of here!!
            { Cue = "/VO/MegaeraField_0586" },
            -- Don't interfere with this!
            { Cue = "/VO/MegaeraField_0587" },
            -- You are not authorized to be here!
            { Cue = "/VO/MegaeraField_0588" },
            -- Don't you have someplace else to be?
            { Cue = "/VO/MegaeraField_0589" },
        },
    },
    CauseOfDeathVoiceLines =
    {
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 1.5,
            Queue = "Interrupt",
            NoTarget = true,
            SkipAnim = true,
            SuccessiveChanceToPlayAll = 0.33,
            RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 1 },
            Source = { SubtitleColor = Color.MegVoice },

            -- We got him.
            { Cue = "/VO/MegaeraField_0369" },
            -- We are the Furies.
            { Cue = "/VO/MegaeraField_0370" },
            -- Our work here is done.
            { Cue = "/VO/MegaeraField_0371" },
            -- He had no chance against us.
            { Cue = "/VO/MegaeraField_0375" },
            -- <Laughter>
            { Cue = "/VO/MegaeraField_0373" },
            -- We got him, sisters.
            { Cue = "/VO/MegaeraField_0669" },
            -- Got him, Alecto. Good.
            { Cue = "/VO/MegaeraField_0670", RequiredMaxSupportAINames = 1, RequiredSupportAINames = { "Alecto" }, },
            -- Stand down, Tisiphone. He's done.
            { Cue = "/VO/MegaeraField_0671", RequiredMaxSupportAINames = 1, RequiredSupportAINames = { "Tisiphone" }, },
            -- He's finished, Tis. Well done.
            { Cue = "/VO/MegaeraField_0672", RequiredMaxSupportAINames = 1, RequiredSupportAINames = { "Tisiphone" }, },
        },
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 1.4,
            Queue = "Interrupt",
            NoTarget = true,
            SkipAnim = true,
            Source = { SubtitleColor = Color.MegVoice },
            RequiredTextLines = { "MegaeraGift10" },

            -- You're mine and always will be, Zagreus.
            { Cue = "/VO/MegaeraField_0659", RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" }, },
            -- You're mine, Zag. Don't forget it.
            { Cue = "/VO/MegaeraField_0660", RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" }, },
            -- We'll have to finish this back home.
            { Cue = "/VO/MegaeraField_0661", RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" }, },
            -- It's all part of the job.
            { Cue = "/VO/MegaeraField_0662" },
            -- What else did you expect?
            { Cue = "/VO/MegaeraField_0663" },
            -- You could do better than that, Zagreus.
            { Cue = "/VO/MegaeraField_0664" },
            -- Were you distracted maybe, Zagreus?
            { Cue = "/VO/MegaeraField_0665" },
            -- Don't get so careless with me next time, Zag.
            { Cue = "/VO/MegaeraField_0666" },
            -- Thanks for the little workout there.
            { Cue = "/VO/MegaeraField_0667" },
            -- I guess I'll see you back here before long.
            { Cue = "/VO/MegaeraField_0668" },
            -- You almost had me there.
            { Cue = "/VO/MegaeraField_0673" },
            -- Finally.
            { Cue = "/VO/MegaeraField_0296" },
            -- Give Hades my regards.
            { Cue = "/VO/MegaeraField_0128" },
            -- You should have known better.
            { Cue = "/VO/MegaeraField_0129" },
            -- I think we're finished here.
            { Cue = "/VO/MegaeraField_0133" },
            -- I finally got you.
            { Cue = "/VO/MegaeraField_0297", ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 1, }, },
            -- I got you.
            { Cue = "/VO/MegaeraField_0298" },
        },			
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 1.5,
            Queue = "Interrupt",
            NoTarget = true,
            SkipAnim = true,
            Source = { SubtitleColor = Color.MegVoice },
            ConsecutiveClearsOfRoom =
            {
              Name = "A_Boss01",
              Count = 2,
            },
            -- About damn time I finally got you, Zag.
            { Cue = "/VO/MegaeraField_0143", RequiredTextLines = { "MegaeraGift03" }, },
            -- That took me long enough.
            { Cue = "/VO/MegaeraField_0144" },
            -- Revenge is always sweet.
            { Cue = "/VO/MegaeraField_0145", RequiredFalseTextLines = { "MegaeraGift10" } },
            -- I finally got you, Zagreus.
            { Cue = "/VO/MegaeraField_0146" },
            -- Did you go easy on me, Zagreus?
            { Cue = "/VO/MegaeraField_0147", RequiredFalseTextLines = { "MegaeraGift10" } },
            -- Did you just let me win...?
            { Cue = "/VO/MegaeraField_0148", RequiredFalseTextLines = { "MegaeraGift10" } },
            -- Give Hades my regards.
            { Cue = "/VO/MegaeraField_0128" },
            -- You must have let me win.
            { Cue = "/VO/MegaeraField_0310" },
            -- Your heart just wasn't in it... why?
            { Cue = "/VO/MegaeraField_0311", RequiredTextLines = { "MegaeraGift05" }, RequiredFalseTextLines = { "MegaeraGift10" } },
            -- I'll take what vengeance I can get.
            { Cue = "/VO/MegaeraField_0312", RequiredFalseTextLines = { "MegaeraGift10" } },
            -- The Fates were on my side for once.
            { Cue = "/VO/MegaeraField_0313" },
            -- You're out of practice, Zag.
            { Cue = "/VO/MegaeraField_0314" },
            -- Get out of here.
            { Cue = "/VO/MegaeraField_0315", RequiredFalseTextLines = { "MegaeraGift10" } },
            -- Finally got you for once.
            { Cue = "/VO/MegaeraField_0677" },
            -- You better not have given me this one.
            { Cue = "/VO/MegaeraField_0678" },
            -- Still got it in me after all this time.
            { Cue = "/VO/MegaeraField_0679" },
        },
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 1.5,
            Queue = "Interrupt",
            NoTarget = true,
            SkipAnim = true,
            Source = { SubtitleColor = Color.MegVoice },
            ConsecutiveDeathsInRoom =
            {
              Name = "A_Boss01",
              Count = 2,
            },
            -- You'll never beat me, Zag.
            { Cue = "/VO/MegaeraField_0137", RequiredFalseTextLines = { "MegaeraMeeting01", "MegaeraMeeting01_Alt", "MegaeraMeeting01_B", "MegaeraMeeting01_Alt_B" } },
            -- Don't you know when to quit?
            { Cue = "/VO/MegaeraField_0138", RequiredFalseTextLines = { "MegaeraGift10" } },
            -- Give up, already, damn you.
            { Cue = "/VO/MegaeraField_0139", RequiredFalseTextLines = { "MegaeraGift10" } },
            -- I'll kill you next time, too.
            { Cue = "/VO/MegaeraField_0140" },
            -- Must I keep doing this?
            { Cue = "/VO/MegaeraField_0141" },
            -- You just can't take a hint.
            { Cue = "/VO/MegaeraField_0142", RequiredFalseTextLines = { "MegaeraGift10" } },
            -- I'll kill you again, and again, and again.
            { Cue = "/VO/MegaeraField_0306" },
            -- Your shining relatives can't help you here.
            { Cue = "/VO/MegaeraField_0307", RequiredFalseTextLines = { "MegaeraGift10" } },
            -- Next time will pan out just like this.
            { Cue = "/VO/MegaeraField_0308" },
            -- I'll send you back as often as it takes.
            { Cue = "/VO/MegaeraField_0309" },
            -- Got you again like in the old days, Zag.
            { Cue = "/VO/MegaeraField_0674" },
            -- Beginning to see a pattern, Zagreus?
            { Cue = "/VO/MegaeraField_0675" },
            -- I'll never hold back, for you or anyone.
            { Cue = "/VO/MegaeraField_0676" },
        },
        {
            RandomRemaining = true,
            BreakIfPlayed = true,
            PreLineWait = 1.6,
            Queue = "Interrupt",
            NoTarget = true,
            SkipAnim = true,
            RequiredFalseTextLines = { "MegaeraGift10" },
            Source = { SubtitleColor = Color.MegVoice },

            -- Go home, Zagreus.
            { Cue = "/VO/MegaeraField_0123" },
            -- That's what you get.
            { Cue = "/VO/MegaeraField_0124" },
            -- Hah! Idiot.
            { Cue = "/VO/MegaeraField_0125" },
            -- There! Now get out of my hall.
            { Cue = "/VO/MegaeraField_0126" },
            -- You're nothing to me anymore.
            { Cue = "/VO/MegaeraField_0127", RequiredFalseTextLines = { "MegaeraGift05" } },
            -- Give Hades my regards.
            { Cue = "/VO/MegaeraField_0128" },
            -- You should have known better.
            { Cue = "/VO/MegaeraField_0129" },
            -- To hell with you.
            { Cue = "/VO/MegaeraField_0130" },
            -- Get the hell out of here.
            { Cue = "/VO/MegaeraField_0131" },
            -- You stupid little fool.
            -- { Cue = "/VO/MegaeraField_0132" },
            -- I think we're finished here.
            { Cue = "/VO/MegaeraField_0133" },
            -- Finally.
            { Cue = "/VO/MegaeraField_0296" },
            -- I finally got you.
            { Cue = "/VO/MegaeraField_0297" },
            -- I got you.
            { Cue = "/VO/MegaeraField_0298" },
            -- Do not come back.
            { Cue = "/VO/MegaeraField_0299" },
            -- Stupid fool.
            { Cue = "/VO/MegaeraField_0300" },
            -- You little fool.
            { Cue = "/VO/MegaeraField_0301" },
            -- Do say hello to Nyx for me.
            { Cue = "/VO/MegaeraField_0302", RequiredTextLines = { "NyxFirstMeeting", "Flashback_Mother_01" } },
            -- Drown in the River Styx.
            { Cue = "/VO/MegaeraField_0303" },
            -- We're through.
            { Cue = "/VO/MegaeraField_0304" },
            -- We're finished here.
            { Cue = "/VO/MegaeraField_0305" },
            -- <Laughter>
            { Cue = "/VO/MegaeraField_0134" },
            -- <Laughter>
            { Cue = "/VO/MegaeraField_0135" },
            -- <Laughter>
            { Cue = "/VO/MegaeraField_0136" },
        },
    },
    InvulnerableHitSound = "/SFX/Enemy Sounds/Megaera/EmoteLaugh",
    --[[
    InvulnerableVoiceLines =
    {
        BreakIfPlayed = true,
        RandomRemaining = true,
        PreLineWait = 0.15,
        CooldownTime = 3,

        -- Placeholder
    },
    --]]
    CharmStartSound = "/SFX/Enemy Sounds/Megaera/EmoteChuckle",
    OnCharmedVoiceLines =
    {
        RandomRemaining = true,
        BreakIfPlayed = true,
        PreLineWait = 0.66,
        CooldownTime = 120,
        CooldownName = "MegSpokeRecently",
        RequiredTextLines = { "MegaeraGift03" },
        SuccessiveChanceToPlay = 0.25,
        RequiredRoom = "A_Boss01",

        -- Do something with your hair?
        { Cue = "/VO/MegaeraField_0590", RequiredTextLines = { "/VO/MegaeraField_0599" } },
        -- You look different somehow.
        { Cue = "/VO/MegaeraField_0591", RequiredTextLines = { "/VO/MegaeraField_0599" } },
        -- What did you do to me....
        { Cue = "/VO/MegaeraField_0592", RequiredTextLines = { "/VO/MegaeraField_0599" } },
        -- What in the...
        { Cue = "/VO/MegaeraField_0593", RequiredTextLines = { "/VO/MegaeraField_0599" } },
        -- Quit messing with my heart...
        { Cue = "/VO/MegaeraField_0594", RequiredTextLines = { "/VO/MegaeraField_0599" }, RequiredFalseTextLines = { "MegaeraGift10" } },
        -- Have you been working out?
        { Cue = "/VO/MegaeraField_0595", RequiredTextLines = { "/VO/MegaeraField_0599" } },
        -- What is going on...
        { Cue = "/VO/MegaeraField_0596", RequiredTextLines = { "/VO/MegaeraField_0599" } },
        -- This is embarrassing...
        { Cue = "/VO/MegaeraField_0597", RequiredTextLines = { "/VO/MegaeraField_0599" } },
        -- Dirty trick...
        { Cue = "/VO/MegaeraField_0598", RequiredTextLines = { "/VO/MegaeraField_0599" } },
        -- Oh no...
        { Cue = "/VO/MegaeraField_0599", },
    },

    LowHealthVoiceLineThreshold = 0.6,
    LowHealthVoiceLines =
    {
        {
            BreakIfPlayed = true,
            RandomRemaining = true,
            PlayOnceFromTableThisRun = true,
            CooldownTime = 12,
            CooldownName = "MegSpokeRecently",
            PreLineWait = 0.35,
            SuccessiveChanceToPlay = 0.05,
            
            ExplicitRequirements = true,
            GameStateRequirements =
            {
                RequiredFalseTextLines = { "MegaeraGift10" },
            },

            -- Bastard!
            { Cue = "/VO/MegaeraField_0090", },
            -- You bastard!
            { Cue = "/VO/MegaeraField_0091", },
            -- You little brat!
            { Cue = "/VO/MegaeraField_0092", },
            -- You brat!
            { Cue = "/VO/MegaeraField_0093", },
            -- How dare you!
            { Cue = "/VO/MegaeraField_0094", },
            -- You dare?
            { Cue = "/VO/MegaeraField_0095", },
            -- Why, you!
            { Cue = "/VO/MegaeraField_0096", },
            -- That hurt.
            { Cue = "/VO/MegaeraField_0097", },
            -- Ungh, you!
            { Cue = "/VO/MegaeraField_0264", },
            -- Pfah!
            { Cue = "/VO/MegaeraField_0265", },
            -- Tsch, heh.
            { Cue = "/VO/MegaeraField_0267", },
            -- That all you've got?
            { Cue = "/VO/MegaeraField_0637", },
            -- Am I supposed to be impressed?
            { Cue = "/VO/MegaeraField_0635", },
            -- What else?
            { Cue = "/VO/MegaeraField_0638", },
        },
        {
            BreakIfPlayed = true,
            RandomRemaining = true,
            PlayOnceFromTableThisRun = true,
            CooldownTime = 60,
            CooldownName = "MegSpokeRecently",
            PreLineWait = 0.35,
            SuccessiveChanceToPlay = 0.01,
            RequiredTextLines = { "MegaeraGift10" },

            -- Pfah!
            { Cue = "/VO/MegaeraField_0265", },
            -- Tsch, heh.
            { Cue = "/VO/MegaeraField_0267", },
            -- Augh, hahaha.
            { Cue = "/VO/MegaeraField_0626", },
            -- Oh-hoh...
            { Cue = "/VO/MegaeraField_0627", },
            -- Not bad.
            { Cue = "/VO/MegaeraField_0628", },
            -- Really.
            { Cue = "/VO/MegaeraField_0629", },
            -- Hmph.
            { Cue = "/VO/MegaeraField_0630", },
            -- That's it.
            { Cue = "/VO/MegaeraField_0631", },
            -- Not yet.
            { Cue = "/VO/MegaeraField_0632", },
            -- Ungh, heh.
            { Cue = "/VO/MegaeraField_0633", },
            -- How thoughtful of you, Zag.
            { Cue = "/VO/MegaeraField_0634", },
            -- You can do better than that.
            { Cue = "/VO/MegaeraField_0636", },
            -- That's it?
            { Cue = "/VO/MegaeraField_0639", },
            -- Is that all?
            { Cue = "/VO/MegaeraField_0640", },
            -- My turn.
            { Cue = "/VO/MegaeraField_0641", },
            -- Mm.
            { Cue = "/VO/MegaeraField_0768", },
            -- Really...
            { Cue = "/VO/MegaeraField_0769", },
            -- Nice shot...
            { Cue = "/VO/MegaeraField_0770", RequiredAnyWeapon = { "BowWeapon", "GunWeapon" } },
            -- Damn...
            { Cue = "/VO/MegaeraField_0771", },
            -- Oh, come on.
            { Cue = "/VO/MegaeraField_0772", },
            -- Really, Zag?
            { Cue = "/VO/MegaeraField_0773", },
        },
    },
    CriticalHealthVoiceLineThreshold = 0.3,
    CriticalHealthVoiceLines =
    {
        BreakIfPlayed = true,
        RandomRemaining = true,
        PlayOnceFromTableThisRun = true,
        SuccessiveChanceToPlay = 0.05,
        CooldownTime = 12,
        CooldownName = "MegSpokeRecently",
        PreLineWait = 0.35,

        ExplicitRequirements = true,
        GameStateRequirements =
        {
            RequiredFalseTextLines = { "MegaeraGift10" },
        },

        -- Damn it!
        { Cue = "/VO/MegaeraField_0098", },
        -- Damn you!
        { Cue = "/VO/MegaeraField_0099", },
        -- Curse you!
        { Cue = "/VO/MegaeraField_0100", },
        -- Blood and darkness!
        { Cue = "/VO/MegaeraField_0101", },
        -- Not again!
        { Cue = "/VO/MegaeraField_0102",
            GameStateRequirements =
            {
                ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 1 },
            },
        },
        -- Enough of this!
        { Cue = "/VO/MegaeraField_0103", },
        -- That does it!
        { Cue = "/VO/MegaeraField_0104", },
        -- Enough!
        { Cue = "/VO/MegaeraField_0105", },
        -- Urgh no.
        { Cue = "/VO/MegaeraField_0262", },
        -- Gah, hrngh!
        { Cue = "/VO/MegaeraField_0266", },
        -- Augh damn it!
        { Cue = "/VO/MegaeraField_0263", },
    },
    DeathVoiceLines =
    {
        Queue = "Interrupt",
        {
            { Cue = "/EmptyCue" }
        },
        {
            BreakIfPlayed = true,
            RandomRemaining = true,
            PreLineWait = 1.0,
            SkipAnim = true,
            RequiredFalseTextLines = { "MegaeraGift10" },

            -- No...!
            { Cue = "/VO/MegaeraField_0149", PreLineWait = 0.3, RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- No!
            { Cue = "/VO/MegaeraField_0150", PreLineWait = 0.3, RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- How...!
            { Cue = "/VO/MegaeraField_0151", PreLineWait = 0.3, RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- How...?!
            { Cue = "/VO/MegaeraField_0152", PreLineWait = 0.3, RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- What...?!
            { Cue = "/VO/MegaeraField_0153", PreLineWait = 0.3, RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- Impossible!
            { Cue = "/VO/MegaeraField_0154", PlayOnce = true },
            -- I can't--!
            { Cue = "/VO/MegaeraField_0155", PreLineWait = 0.6, RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- Again?!
            { Cue = "/VO/MegaeraField_0156", RequiredPlayed = { "/VO/MegaeraField_0154" }, RequiredKills = { Harpy = 3 } },
            -- Not again?!
            { Cue = "/VO/MegaeraField_0157", RequiredPlayed = { "/VO/MegaeraField_0154" }, RequiredKills = { Harpy = 5 } },
            -- Ungh, damn...
            { Cue = "/VO/MegaeraField_0316", PreLineWait = 0.3, RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- Damn you...
            { Cue = "/VO/MegaeraField_0317", RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- Ngh, blood and--
            { Cue = "/VO/MegaeraField_0318", RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- Lord Hades, I...
            { Cue = "/VO/MegaeraField_0319", RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- Sisters...
            { Cue = "/VO/MegaeraField_0320", RequiredPlayed = { "/VO/MegaeraField_0154" }, RequiredTextLines = { "Fury2FirstAppearance", "Fury3FirstAppearance" } },
            -- Why, you...
            { Cue = "/VO/MegaeraField_0321", RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- This is...
            { Cue = "/VO/MegaeraField_0322", RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- How could I--!
            { Cue = "/VO/MegaeraField_0323", RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- Absurd...
            { Cue = "/VO/MegaeraField_0324", RequiredPlayed = { "/VO/MegaeraField_0154" } },
            -- Why...
            { Cue = "/VO/MegaeraField_0325", RequiredPlayed = { "/VO/MegaeraField_0154" } },
        },
        {
            BreakIfPlayed = true,
            RandomRemaining = true,
            SkipAnim = true,
            PreLineWait = 1.0,
            RequiredTextLines = { "MegaeraGift10" },

            -- Nggh... not... bad...
            { Cue = "/VO/MegaeraField_0680" },
            -- Ungh, heh heh...
            { Cue = "/VO/MegaeraField_0681" },
            -- Guh, got... me...
            { Cue = "/VO/MegaeraField_0682" },
            -- Unghh! That was...
            { Cue = "/VO/MegaeraField_0683" },
            -- Kh!! Keep... go...
            { Cue = "/VO/MegaeraField_0684" },
            -- No! You're... good...
            { Cue = "/VO/MegaeraField_0685" },
            -- Ngh! Every... time...!
            { Cue = "/VO/MegaeraField_0686" },
            -- Mmph! Well... fought...
            { Cue = "/VO/MegaeraField_0687" },
            -- Ungh, you... can't...
            { Cue = "/VO/MegaeraField_0688" },
            -- Augh, can't... be...
            { Cue = "/VO/MegaeraField_0689" },
            -- Guh, fine.... then....
            { Cue = "/VO/MegaeraField_0690" },
            -- Sisters... go...
            { Cue = "/VO/MegaeraField_0691", PreLineWait = 0.3, RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
            -- Sorry... sisters...
            { Cue = "/VO/MegaeraField_0692", PreLineWait = 0.3, RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
            -- Ughh... Alecto....
            { Cue = "/VO/MegaeraField_0693", RequiredMaxSupportAINames = 1,	RequiredSupportAINames = { "Alecto" }, },
            -- Guh... Tis, I....
            { Cue = "/VO/MegaeraField_0694", RequiredMaxSupportAINames = 1,	RequiredSupportAINames = { "Tisiphone" }, },
            -- Don't... like... you...
            { Cue = "/VO/MegaeraField_0695" },
            -- Ngh... not... yet...
            { Cue = "/VO/MegaeraField_0696" },
        },
    },
    OnKillGlobalVoiceLines = "FuryVanquishedGlobalVoiceLines",
    KillsRequiredForVoiceLines = 1,

    Binks =
    {
        "Enemy_Fury_Idle_Bink",
        "Enemy_Fury_Run_Bink",
        "Enemy_Fury_StartStop_Bink",
        "Enemy_Fury_Lunge_Bink",
        "Enemy_Fury_Beam_Bink",
        "Enemy_Fury_Lightning_Bink",
        "Enemy_Fury_WhipWhirl_Bink",
        "Enemy_Fury_Shielded_Bink",
        "Enemy_Fury_Dead_Bink",
        "Enemy_Fury_Taunt_Bink",

        "Enemy_Alecto_Taunt_Bink",
        "Enemy_Tisiphone_Taunt_Bink",
        "Enemy_AlectoMultiFuryHover_Bink",
        "Enemy_AlectoMultiFuryTakeOff_Bink",
        "Enemy_AlectoMultiFurySkyDive_Bink",
        "Enemy_TisiphoneMultiFuryHover_Bink",
        "Enemy_TisiphoneMultiFuryTakeOff_Bink",
        "Enemy_TisiphoneMultiFurySkyDive_Bink",

    },
}

UnitSetData.Enemies.MegSupportUnit =
{
    InheritFrom = { "IsNeutral" },
    DamageType = "Enemy",
    RequiredKill = false,
    HideHealthBar = true,
	AlwaysTraitor = true,

    DefaultAIData =
    {
        DeepInheritance = true,
		IgnoreInvulnerable = true,
    },

    AIOptions =
    {
        HarpySupportAI,
    },

    SupportAIWeaponOptions = { Megaera = {}, Alecto = {}, Tisiphone = {} },
    AttackRateMin = 5.0,
    AttackRateMax = 6.5,
    WakeUpDelayMin = 4,
    WakeUpDelayMax = 6,
}

OverwriteTableKeys( EnemyData, UnitSetData.Enemies )