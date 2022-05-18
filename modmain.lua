--[[

***************************************************************
Created by: Emoinm
Date: May 17, 2022
Description: Mod that automatically moves perishables to an insulated pack if there is room upon picking up.
***************************************************************

]]

local Player

local function wearingIcePack()
    local packType = Player.replica.inventory:GetEquippedItem("body")

    if packType~=nil and packType.prefab == "icepack" then
        return packType
    end
    return nil
end

local function isPerishable(inst, data)
    if data.item:HasTag("fresh") or data.item:HasTag("stale") or data.item:HasTag("spoiled") then
        return true
    end
    return false
end

local function pickupEvent(inst)
    inst:ListenForEvent("gotnewitem", function(inst, data)
        local equipped_icepack = wearingIcePack()
        if equipped_icepack ~= nil and isPerishable(inst, data) then
        end
    end)
end

local function init(inst)
    inst:DoTaskInTime(1,function()
        Player = GLOBAL.ThePlayer

        pickupEvent(inst)
    end)
end
AddPlayerPostInit(init)