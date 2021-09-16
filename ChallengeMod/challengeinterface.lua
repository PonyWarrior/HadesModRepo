--Returns a challenge object to use for editing and as a hardmode object
--@param id: the table key of the challenge
--@param name: the name of the challenge (displayed in game) 
--@param args: all the args to put into 
    --@subparam Author: author field in challenge, optional just gives you credit
    --@subparam ForcedPactOptions: Forces pact options (pact option object table)
    --{
    --    Name = "EnemyDamageShrineUpgrade",
    --    Level = 5,
    --  },
    --@subparam HellMode: Adds Hell Mode challenges to ForcedPactOptions
    --@subparam SetupFunction: calls name of function from global when button to start challenge pressed  
    --@subparam Description: The rich text Description in the window that pops up
    --@subparam HardMode: Adds a hard mode on initalization (pass in a ChallengeObject generated from this function)
function ChallengeMod.GenerateChallengeObject(name, args)
    local challengeObject = {}

    challengeObject.Name = name
    challengeObject.Description = args.Description
    challengeObject.Author = args.Author
    challengeObject.HellMode = args.HellMode
    challengeObject.SetupFunction = args.SetupFunction
    challengeObject.RestoreRoomData = true

    if args.HardMode ~= nil and type(args.HardMode) == "table" then
        challengeObject.HardMode = args.HardMode
    elseif args.HardMode ~= nil then
        error("Incorrect HardMode arg type, Incorrect type: " .. type(args.HardMode) .. " requires type table")
    end

    return challengeObject
end

--Only adds a hard mode to a normal object already in the table, will return an error if a HardMode in that challenge already exists
--@param id: the id that was set when adding the object to the ChallengeData table
--@param hardModeObject: the object that was generated in GenerateChallengeObject
function ChallengeMod.SetHardMode(id, hardModeObject)
    if type(challengeObject) == "table" then
        if ChallengeMod.ChallengeData[id] == nil then
            ChallengeMod.ChallengeData[id].HardMode = hardModeObject
        else
             error("HardMode in object with id: " .. id .. " already set", 2)
        end
     else
        error("Incorrect hardModeObject type: " .. type(hardModeObject), 2)
     end
end

--Removes a hard mode from a challenge, will return an error if no challenge with id exists or no HardMode in that challenge exists
--@param id: the id of the ChallengeMode to remove
function ChallengeMod.RemoveHardMode(id)
    if ChallengeMod.ChallengeData[id] == nil then
        error("challenge with id ".. id .." does not exist", 2)
    else
        if ChallengeMod.ChallengeData[id].HardMode == nil then
            error("challenge with id ".. id .." has no HardMode to remove", 2)
        else
            ChallengeMod.ChallengeData[id].HardMode = nil
        end
    end
end

--Only adds a new challenge, will not override any with the same id, wil lreturn an error if a challenge already has that id
--@param id: the id to set in the table, maps to key
--@param challengeObject: An object returned from GenerateChallengeObject
function ChallengeMod.AddChallenge(id, challengeObject)
    if type(challengeObject) == "table" then
       if ChallengeMod.ChallengeData[id] == nil then
            ChallengeMod.ChallengeData[id] = challengeObject
       else
            error("id " .. id .. " already used in other challenge", 2)
       end
    else
        error("Incorrect challengeObject type: " .. type(challengeObject), 2)
    end
end

--Removes a Challenge from the list
--@param id: the id to remove from the table
function ChallengeMod.RemoveChallenge(id)
    if ChallengeMod.ChallengeData[id] == nil then
        error("challenge with id ".. id .." does not exist", 2)
    else
        ChallengeMod.ChallengeData[id] = nil
    end
end

--Changes the value of a challenge already in the table, will set the value meaning it will oevrride nils
--@param id: The id of the challenge i nthe table
--@param fieldName: The name of the field you wish to edit
--@param newvalue: The new value of the field, must be the same type as the old value or an error will be thrown
function ChallengeMod.ChangeChallengeField(id, fieldName, newValue)
    if ChallengeMod.ChallengeData[id] == nil then
        error("challenge with id ".. id .." does not exist", 2)
    else
        if ChallengeMod.ChallengeData[id][fieldName] == nil or type(newValue) == type(ChallengeMod.ChallengeData[id][fieldName]) then
            ChallengeMod.ChallengeData[id][fieldName] = newValue
        else
            error("incorrect type when changing challenge with id " .. id .. "'s value " .. fieldName .. " Old Type: " .. type(ChallengeMod.ChallengeData[id][fieldName]) .. ", New Type" .. type(newValue), 2)
        end
    end
end

--Changes the value of a hardmode in a function already in the table, if there is no HardMode an error will be thrown, will set the value meaning it will oevrride nils
--@param id: The id of the challenge in the table
--@param fieldName: The name of the field in the HardMode object you wish to edit
--@param newvalue: The new value of the field, must be the same type as the old value or an error will be thrown
function ChallengeMod.ChangeChallengeHardModeField(id, fieldName, newValue)
    if ChallengeMod.ChallengeData[id] == nil then
        error("challenge with id ".. id .." does not exist", 2)
    else
        if ChallengeMod.ChallengeData[id].HardMode == nil then
            error("challenge with id ".. id .." has no HardMode", 2)
        else
            if ChallengeMod.ChallengeData[id].HardMode[fieldName] == nil or type(newValue) == type(ChallengeMod.ChallengeData[id].HardMode[fieldName]) then
                ChallengeMod.ChallengeData[id].HardMode[fieldName] = newValue
            else
                error("incorrect type when changing challenge with id " .. id .. "'s HardMode value " .. fieldName .. " Old Type: " .. type(ChallengeMod.ChallengeData[id].HardMode[fieldName]) .. ", New Type" .. type(newValue), 2)
            end
        end
    end
end