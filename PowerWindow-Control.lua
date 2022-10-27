-- PowerWindow-Control by Halvkyrie
-- TODO: Github link
-- Don't steal

SCRIPT_VERSION = "0.1"

-- Requirements --
util.require_natives(1651208000)

-- Meta info things -- 
SCRIPT_NAME = "PowerWindow-Control"

-- end Meta info things -- 

-- Main thing for the interface? --

SCRIPT_META_LIST = menu.list(menu.my_root(), "About this Script")
menu.divider(SCRIPT_META_LIST, SCRIPT_NAME .. " Version " .. SCRIPT_VERSION)
menu.divider(SCRIPT_META_LIST, "By Halvkyrie")


local currentVehicle = entities.get_user_vehicle_as_handle()


drawScriptMenu = function()
    menu.divider(menu.my_root(), "Vehicle Window Options")
menu.action(menu.my_root(), "Roll all down", {"pwcalldown"}, "Rolls all windows of the current vehicle down", function()
    VEHICLE.ROLL_DOWN_WINDOWS(currentVehicle)
end)

end



drawScriptMenu()

while true do
    util.yield()
end