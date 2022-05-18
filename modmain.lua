--[[

***************************************************************
Created by: Emoinm
Date: May 17, 2022
Description: Mod that automatically moves perishables to an insulated pack if there is room upon picking up.
***************************************************************

]]

local function pickupEvent(inst)
    inst:DoTaskInTime(1,function()
        inst:ListenForEvent("gotnewitem", function(inst, data)
            if data.item:HasTag("fresh") then
                print("Fresh Item Picked Up")
            end
            if data.item:HasTag("stale") then
                print("Stale Item Picked Up")
            end
            if data.item:HasTag("spoiled") then
                print("Spoiled Item Picked Up")
            end
        end)
    end)
end
AddPlayerPostInit(pickupEvent)