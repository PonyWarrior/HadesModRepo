
OnAnyLoad{
  function ()
    SetWeaponProperty({ WeaponName = "BowWeapon", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeWindowDuration", Value = 0.25, ValueChangeType = "Absolute" })
    SetWeaponProperty({ WeaponName = "BowWeapon", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeDamageMultiplier", Value = 2.0, ValueChangeType = "Absolute" })
    SetWeaponProperty({ WeaponName = "BowWeapon", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeRangeMultiplier", Value = 10.0, ValueChangeType = "Absolute" })
    SetWeaponProperty({ WeaponName = "BowWeapon", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeSpeedMultiplier", Value = 10.3, ValueChangeType = "Absolute" })
    SetWeaponProperty({ WeaponName = "BowWeapon", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeVelocityMultiplier", Value = 1.8, ValueChangeType = "Absolute" })

    SetWeaponProperty({ WeaponName = "BowWeaponDash", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeWindowDuration", Value = 0.25, ValueChangeType = "Absolute" })
    SetWeaponProperty({ WeaponName = "BowWeaponDash", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeDamageMultiplier", Value = 2.0, ValueChangeType = "Absolute" })
    SetWeaponProperty({ WeaponName = "BowWeaponDash", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeRangeMultiplier", Value = 10.0, ValueChangeType = "Absolute" })
    SetWeaponProperty({ WeaponName = "BowWeaponDash", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeSpeedMultiplier", Value = 10.3, ValueChangeType = "Absolute" })
    SetWeaponProperty({ WeaponName = "BowWeaponDash", DestinationId = CurrentRun.Hero.ObjectId,
    Property = "PerfectChargeVelocityMultiplier", Value = 1.8, ValueChangeType = "Absolute" })
  end
 }
