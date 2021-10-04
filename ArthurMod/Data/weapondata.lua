if ArthurMod.Config.Enabled then

    WeaponData.SwordWeapon.SpecialKitInteractFunctionName = "ArthurMod.WeaponKitSpecialInteractPresentation"
    WeaponData.SwordWeapon.SpecialKitInteractSpecialUnlockSound = "/Leftovers/Menu Sounds/EmoteAscendedArthurChoir"
    WeaponData.SwordWeapon.SpecialKitInteractGameStateRequirements =
    {
        RequiredTextLines = { "NyxRevealsArthurAspect01" },
        RequiredPlayed = { "/VO/ZagreusField_3250", },
    }

end