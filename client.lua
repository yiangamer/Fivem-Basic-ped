local npcModel = "s_m_y_cop_01"
local npcCoords = vector3(452.1, -988.2, 30.6)
local npcHeading = 90.0


local function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
end


local function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
end


CreateThread(function()
    loadModel(npcModel)
    

    local npc = CreatePed(4, GetHashKey(npcModel), npcCoords.x, npcCoords.y, npcCoords.z - 1.0, npcHeading, false, true)
    

    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    TaskSetBlockingOfNonTemporaryEvents(npc, true)
    

    local animDict = "random@arrests"
    local animName = "idle_2_hands_up"
    
    loadAnimDict(animDict)
    TaskPlayAnim(npc, animDict, animName, 8.0, -8.0, -1, 49, 0, false, false, false)
    FreezeEntityPosition(npc, true)
end)



