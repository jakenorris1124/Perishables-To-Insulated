--[[

***************************************************************
Created by: Emoinm
Date: May 17, 2022
Description: Mod that automatically moves perishables to an insulated pack if there is room upon picking up.
***************************************************************

]]

local params = require("containers").params
local deepcopy = GLOBAL.deepcopy

params.icepack = deepcopy(params.backpack)

local function isPerishable(container, item, slot)
    return (item:HasTag("fresh") or item:HasTag("stale") or item:HasTag("spoiled"))
end

params.icepack.priorityfn = isPerishable