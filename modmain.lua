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
            print("Item picked up")
        end)
    end)
end
AddPlayerPostInit(pickupEvent)