WeaponUpgradeData =
{
	DefaultGameStateRequirement =
	{
		RequiredTrueFlags = { "AspectsUnlocked" },
	},
	SwordWeapon =
	{
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			UpgradeUnequippedId = "SwordWeapon_Unequipped",
			StartsUnlocked = true,
			RequiredInvestmentTraitName = "SwordBaseUpgradeTrait",
			Image = "Codex_Portrait_Sword"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			--TraitName = "SwordAmmoWaveTrait"
			TraitName = "SwordCriticalParryTrait",
			EquippedKitAnimation = "WeaponSwordAlt01FloatingIdleOff",
			UnequippedKitAnimation = "WeaponSwordAlt01FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponSwordAlt01FloatingIdleBonus",
			Image = "Codex_Portrait_SwordAlt01"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			TraitName = "DislodgeAmmoTrait",
			EquippedKitAnimation = "WeaponSwordAlt02FloatingIdleOff",
			UnequippedKitAnimation = "WeaponSwordAlt02FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponSwordAlt02FloatingIdleBonus",
			Image = "Codex_Portrait_SwordAlt02"
		},
		{
			MaxUpgradeLevel = 5,
			DisableBuy = true,
			DisableUpgrade = true,
		},
	},
	SpearWeapon =
	{
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			UpgradeUnequippedId = "SpearWeapon_Unequipped",
			StartsUnlocked = true,
			RequiredInvestmentTraitName = "SpearBaseUpgradeTrait",
			UnequipFunctionName = "RemoveSpearBase",
			Image = "Codex_Portrait_Spear"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			TraitName = "SpearTeleportTrait",
			UnequipFunctionName = "RemoveSpearTeleport",
			EquipSound = "/SFX/Player Sounds/ZeusLightningWrathImpact",
			EquippedKitAnimation = "WeaponSpearAlt01FloatingIdleOff",
			UnequippedKitAnimation = "WeaponSpearAlt01FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponSpearAlt01FloatingIdleBonus",
			Image = "Codex_Portrait_SpearAlt01"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			TraitName = "SpearWeaveTrait",
			UnequipFunctionName = "RemoveSpearWeave",
			EquippedKitAnimation = "WeaponSpearAlt02FloatingIdleOff",
			UnequippedKitAnimation = "WeaponSpearAlt02FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponSpearAlt02FloatingIdleBonus",
			Image = "Codex_Portrait_SpearAlt02"
		},
		{
			TraitName = "SpearSpinTravel",
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			GameStateRequirements =
			{
				RequiredTextLines = { "AchillesRevealsGuanYuAspect01" },
			},
			UnequipFunctionName = "RemoveSpearGuanYu",
			-- To be replaced
			EquippedKitAnimation = "WeaponSpearAlt03FloatingIdleOff",
			UnequippedKitAnimation = "WeaponSpearAlt03FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponSpearAlt03FloatingIdleBonus",
			Image = "Codex_Portrait_SpearAlt03"
		},

	},
	GunWeapon =
	{
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			UpgradeUnequippedId = "GunWeapon_Unequipped",
			StartsUnlocked = true,
			RequiredInvestmentTraitName = "GunBaseUpgradeTrait",
			Image = "Codex_Portrait_Gun"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			--TraitName = "GunLoadedGrenadeTrait"
			TraitName = "GunGrenadeSelfEmpowerTrait",
			EquippedKitAnimation = "WeaponGunAlt02FloatingIdleOff",
			UnequippedKitAnimation = "WeaponGunAlt02FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponGunAlt02FloatingIdleBonus",
			Image = "Codex_Portrait_GunAlt02"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			TraitName = "GunManualReloadTrait",
			UnequipFunctionName = "RemoveManualReloadBonus",
			EquippedKitAnimation = "WeaponGunAlt01FloatingIdleOff",
			UnequippedKitAnimation = "WeaponGunAlt01FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponGunAlt01FloatingIdleBonus",
			Image = "Codex_Portrait_GunAlt01"
		},
		{
			MaxUpgradeLevel = 5,
			DisableBuy = true,
			DisableUpgrade = true,
		},

	},
	BowWeapon =
	{
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			UpgradeUnequippedId = "BowWeapon_Unequipped",
			StartsUnlocked = true,
			RequiredInvestmentTraitName = "BowBaseUpgradeTrait",
			Image = "Codex_Portrait_Bow"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			TraitName = "BowMarkHomingTrait",
			EquippedKitAnimation = "WeaponBowAlt01FloatingIdleOff",
			UnequippedKitAnimation = "WeaponBowAlt01FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponBowAlt01FloatingIdleBonus",
			Image = "Codex_Portrait_BowAlt01",
			MaxedTraitDescription = "BowMarkHomingTrait_Max"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			TraitName = "BowLoadAmmoTrait",
			UnequipFunctionName = "RemoveAmmoLoad",
			EquippedKitAnimation = "WeaponBowAlt02FloatingIdleOff",
			UnequippedKitAnimation = "WeaponBowAlt02FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponBowAlt02FloatingIdleBonus",
			Image = "Codex_Portrait_BowAlt02"
		},
		{
			MaxUpgradeLevel = 5,
			DisableBuy = true,
			DisableUpgrade = true,
		},

	},
	ShieldWeapon =
	{
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			UpgradeUnequippedId = "ShieldWeapon_Unequipped",
			StartsUnlocked = true,
			RequiredInvestmentTraitName = "ShieldBaseUpgradeTrait",
			Image = "Codex_Portrait_Shield"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			TraitName = "ShieldRushBonusProjectileTrait",
			EquippedKitAnimation = "WeaponShieldAlt01FloatingIdleOff",
			UnequippedKitAnimation = "WeaponShieldAlt01FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponShieldAlt01FloatingIdleBonus",
			Image = "Codex_Portrait_ShieldAlt01"
		},
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			TraitName = "ShieldTwoShieldTrait",
			EquippedKitAnimation = "WeaponShieldAlt02FloatingIdleOff",
			UnequippedKitAnimation = "WeaponShieldAlt02FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponShieldAlt02FloatingIdleBonus",
			Image = "Codex_Portrait_ShieldAlt02"
		},
		{
			MaxUpgradeLevel = 5,
			DisableBuy = true,
			DisableUpgrade = true,
		},

	},
}
