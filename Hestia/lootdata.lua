LootData.HestiaUpgrade =
{
  InheritFrom = { "BaseLoot", "BaseSoundPackage" },
  CanReceiveGift = true,
  AlwaysShowDefaultUseText = true,
  Weight = 10,
  BoonInfoIcon = "BoonInfoSymbolZeusIcon",
  Icon = "BoonSymbolZeus",
  DoorIcon = "BoonSymbolBaseIsometric",
  Color = { 250, 250, 215, 255 },
  LightingColor = {235, 206, 87, 255},
  LootColor = {255, 255, 64, 255},
  SubtitleColor = {1.000, 0.973, 0.733, 1.0},
  ColorGrade = "ZeusLightning",
  LootRejectionAnimation = "BoonDissipateA_Zeus",
  EventEndSound = "/SFX/ZeusBoonThunder",
  UpgradeSelectedSound = "/SFX/ZeusBoonChoice",

  RequiredMinCompletedRuns = 1,

  PriorityUpgrades = { "HestiaWeaponTrait", "HestiaRangedTrait", "HestiaRushTrait", "HestiaSecondaryTrait", "HestiaShoutTrait" },
  WeaponUpgrades = { "HestiaWeaponTrait", "HestiaRangedTrait", "HestiaRushTrait", "HestiaSecondaryTrait", "HestiaShoutTrait" },
  Traits = { },
  Consumables = { },
  LinkedUpgrades = { },

  Speaker = "NPC_Zeus_01",
  Portrait = "Portrait_Zeus_Default_01",
  WrathPortrait = "Portrait_Zeus_Wrath_01",
  OverlayAnim = "ZeusOverlay",
  Gender = "Male",
  SpawnSound = "/SFX/ZeusBoonThunder",
  FlavorTextIds =
  {
    "ZeusUpgrade_FlavorText01",
    "ZeusUpgrade_FlavorText02",
    "ZeusUpgrade_FlavorText03",
  },
}
