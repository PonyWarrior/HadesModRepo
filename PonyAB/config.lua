PAB =
{
    Config =
    {
        Gameplay =
		{
			-- When enabled :
			-- Can no longer roll Demeter's Nourished Soul with Lasting Consequences 4 Pact option
			-- Lucifer beam now destroys projectiles (only the base of the beam destroys projectiles, like it works with reflect)
			-- Any extra last stand charges are now consumed before regular ones from the mirror, unless you have stubborn defiance
			Enabled = true,
			GilgameshChanges =
			{
				-- Disabling Gameplay also disables this
				-- When enabled :
				-- Changes Maim from Aspect of Gilgamesh to deal -25% total damage, but the damage is applied over time instead of a burst at the end
				Enabled = true,
				BaseDamage = 25,	-- multiplied by aspect level
			},
			OldChaosShield =
			{
				-- Disabling Gameplay also disables this
				-- Restores Shield of Chaos - Aspect of Chaos to it's early access version
				-- Extra shields are now fired in a star pattern
				-- Extra shields can now bounce
				-- Extra shields are 30% faster
				Enabled = true,
			},
			ExtraHammers =
			{
				-- Adds extra hammer upgrades
				Enabled = true,
				SuperGunManualReloadTrait =
				{
					-- Hestia's Secret Gunpowder Recipe
					-- Requires Adamant Rail - Aspect of Hestia
					-- Empowered shots deal 300% total damage and have 150% range
					-- Max ammo reduced to 2
					-- Reload duration +100%
					-- Can't dash anymore
					Enabled = true,
				},
                BowChainPerfectShotTrait =
                {
                    -- Echoing Perfection
                    -- Requires any bow
                    -- Perfect shots empower subsequent perfect shots by 25%
                    -- Stacks up to 10 times
                    -- Effect is lost when failing a perfect shot
                    Enabled = true,
                    BonusDamagePerShot = 0.25, -- default 0.25 = +25%
                    BonusCap = 10, -- default 10
                }
			},
			BetterBalance =
			{
				Enabled = true,
					-- Demeter
					FrostStrikeBaseDamage = 1.4, -- vanilla 1.4 (+40%)
					FrostFlourishBaseDamage = 1.6, -- vanilla 1.6 (+60%)
					MistralDashHitCount = 3, -- vanilla 1
					KillingFreezePommable = true, -- vanilla false
					ArcticBlastPommable = true, -- vanilla false
					RavenousWillPommable = false, -- vanilla false
					DemeterAidBaseDamage = 15, -- vanilla 10
					DemeterAidExpansionSpeed = 1.5, -- vanilla 1.0 (100%)
                    GlacialGlarePrereqForArcticBlastAndKillingFreeze = true, -- vanilla false
                    -- Zeus
                    ThunderFlareRemake = true, -- vanilla false
					-- Guan Yu
					GuanYuComboAttack1Damage = 60, -- vanilla 40
					GuanYuComboAttack2Damage = 80, -- vanilla 60
					GuanYuComboAttack3Damage = 200, -- vanilla 100
					GuanYuDashAttackDamage = 50, -- vanilla 30
					GuanYuSpecialDamage = 60, -- vanilla 45
					-- Zagreus Shield
					ZagreusShieldIncreaseSpecialDamage = true, -- vanilla false
                    -- Beowulf Shield
                    BeowulfMirageShotBugFix = true, -- vanilla false (deals +100% dmg instead of 30%)
					-- Duo Boons
					ColdEmbraceBonusDamage = 1.6, -- vanilla 1.3 (+30%)
					FreezingVortexSizeChange = 23, -- vanilla -23 (-15%)
					BlizzardShotShardDamage = 40, -- vanilla 20
					PartingShotUniversalBackstab = true, -- vanilla false
					PartingShotBonusDamage = 1.60, -- vanilla 1.35 (+35%)
					-- Swords
					SwordComboAttacksChargeTime = 0.5, -- vanilla 1.0
					SwordThrustKnockBack = 0, -- vanilla 3000
					SwordSlashDisabledDuration = 2.0, -- vanilla 1.0 = 5 frames
					-- Hades Spear
					HadesSpearGlobalSweepBuff = true, -- vanilla false
					HadesSpearBaseSweepBuff = 0.3, -- vanilla 0.3
                    -- Sword Hammers
                    HoardingSlashGoldMultiplier = 0.15, -- vanilla 0.05 (5%)
                    CursedSlashWorksOnDashStrikes = true, -- vanilla false
                    ShadowSlashWorksOnDashStrikes = true, -- vanilla false
                    FlurrySlashDealsRampingDamage = true, -- vanilla false
                    FlurrySlashRampingDamage = 5, -- vanilla none
                    FlurrySlashRampingDamageTimeWindow = 0.8, -- vanilla none
                    SuperNovaDamageMultiplier = 1.5, -- vanilla 1.2 (+20%)
                    SuperNovaRangeMultiplier = 1.5, -- vanilla 1.2 (+20%)
                    DoubleNovaDamageInterval = 0.1, -- vanilla 0.2 (in seconds)
                    -- Rail Hammers
                    ClusterBombsRocketBombBugFix = true, -- vanilla false (rockets deal 100% dmg instead of 70%)
                    TripleBombsRocketBombFireInterval = 0.25, -- vanilla 1.0 (in seconds)
			},
		},
    }
}

SaveIgnores["PAB"] = true