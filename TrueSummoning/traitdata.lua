TraitData.	FuryAssistTrait =
{
    InheritFrom = { "AssistTrait" },
    InRackTitle = "FuryAssistTrait_Rack",
    InRackIcon = "Keepsake_Meg_Plush_Menu",
    Icon = "Keepsake_Meg_Plush",

    EquipSound = "/SFX/Menu Sounds/KeepsakeMegLegendary",
    KeepsakeRarityGameStateRequirements =
    {
        [1] = {
            AssistUpgradeLevel =
            {
                Name = "FuryAssistTrait",
                Level = 0,
            }
        },
        [2] = {
            AssistUpgradeLevel =
            {
                Name = "FuryAssistTrait",
                Level = 1,
            }
        },
        [3] = {
            AssistUpgradeLevel =
            {
                Name = "FuryAssistTrait",
                Level = 2,
            }
        },
        [4] = {
            AssistUpgradeLevel =
            {
                Name = "FuryAssistTrait",
                Level = 3,
            }
        },
        [5] = {
            AssistUpgradeLevel =
            {
                Name = "FuryAssistTrait",
                Level = 4,
            }
        },
    },
    AddAssist =
    {
        FunctionName = "TrueSummoning.MegaeraAssist",
        GameStateRequirements = {
            CurrentRoomValueFalse = "BlockHadesAssistTraits",
            RequiredFalseRooms = { "A_Boss01", "A_Boss02", "A_Boss03" },
            },
        AssistPresentationPortrait = "Portrait_FurySister01_Default_01",
        AssistPresentationPortraitOffsetY = 55,
        AssistPresentationColor = { 200, 0, 255, 255 },
        AssistPostWeaponSlowDuration = 0.1,
    },
    PropertyChanges =
    {

        {
            WeaponName = "NPC_FurySister_01_Assist",
            ProjectileProperty = "DamageLow",
            ChangeValue = 2500,
            DepthMult = DepthDamageMultiplier,
            IdenticalMultiplier =
            {
                Value = DuplicateStrongMultiplier,
            },
            ExtractValue =
            {
                ExtractAs = "TooltipDamage",
            }
        },
        {
            WeaponName = "NPC_FurySister_01_Assist",
            ProjectileProperty = "DamageHigh",
            DeriveValueFrom = "DamageLow"
        },
    },
    RemainingUses = { BaseValue = 1 },
    ExtractValues =
    {
        {
            Key = "RemainingUses",
            ExtractAs = "TooltipKeepsakeUses",
        },
    },
    LoadBinks =
    {
        "Enemy_MegaeraMultiFurySkyDive_Bink",
    },
    SignOffData =
    {
      {
        Text = "MegaeraSignoff",
      },
      {
        RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
        RequiredFalseTextLines = { "BecameCloseWithMegaera01Meg_BackOff", "BecameCloseWithMegaera01_BMeg_BackOff" },
        Text = "MegaeraSignoff_AssistMax_A"
      },
      {
          RequiredTextLines = { "MegaeraGift10" },
        RequiredFalseTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
        Text = "MegaeraSignoff_AssistMax_B"
      }
    },
}