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
            if data.item:HasTag("fresh") or data.item:HasTag("stale") or data.item:HasTag("spoiled") then
                print("Perishable Picked Up")
            end
        end)
    end)
end
AddPlayerPostInit(pickupEvent)