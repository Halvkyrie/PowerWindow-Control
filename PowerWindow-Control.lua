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

local windows = {
    {name = "Front Left", number = 0},
    {name = "Front Right", number = 1},
    {name = "Rear Left", number = 2},
    {name = "Rear Right", number = 3},
    {name = "Front Windscreen", number = 4},
    {name = "Rear Windscreen", number = 5},
    {name = "Mid Left", number = 6},
    {name = "Mid Right", number = 7}
}

drawScriptMenu = function()
    menu.divider(menu.my_root(), "Vehicle Window Options")
menu.action(menu.my_root(), "Roll all down", {"pwcalldown"}, "Rolls all windows of the current vehicle down", function()
    VEHICLE.ROLL_DOWN_WINDOWS(currentVehicle)
end)

menu.action(menu.my_root(), "Roll all up", {"pwcallup"}, "Rolls all windows of the current vehicle up", function()
    for k, v in pairs(windows) do
        VEHICLE.ROLL_UP_WINDOW(currentVehicle, v.number)
    end
end)

ROLL_DOWN_INDIVIDUAL = menu.list(menu.my_root(), "Roll down individual windows")
    for k, v in pairs(windows) do
        menu.action(ROLL_DOWN_INDIVIDUAL, "Roll down " .. v.name .. " window", {}, "Rolls down " .. v.name .. " window", function()
        VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, v.number)
        end)
    end

ROLL_UP_INDIVIDUAL = menu.list(menu.my_root(), "Roll up individual windows")
    for k, v in pairs(windows) do
        menu.action(ROLL_UP_INDIVIDUAL, "Roll up " .. v.name .. " window", {}, "Rolls up " .. v.name .. " window", function()
        VEHICLE.ROLL_UP_WINDOW(currentVehicle, v.number)
        end)
    end

end



drawScriptMenu()

while true do
    util.yield()
end