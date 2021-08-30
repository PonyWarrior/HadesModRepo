
if PQOL.Config.CompleteAllBounties.Enabled then
    table.insert(EncounterData.BossHarpy1.PostUnthreadedEvents, {FunctionName = "CompleteAllAvailableBounties"})
    table.insert(EncounterData.BossHarpyTriumvirate.PostUnthreadedEvents, {FunctionName = "CompleteAllAvailableBounties"})
    table.insert(EncounterData.BossHydra.PostUnthreadedEvents, {FunctionName = "CompleteAllAvailableBounties"})
    table.insert(EncounterData.BossTheseusAndMinotaur.PostUnthreadedEvents, {FunctionName = "CompleteAllAvailableBounties"})
    table.insert(EncounterData.BossHades.PostUnthreadedEvents, {FunctionName = "CompleteAllAvailableBounties"})
end