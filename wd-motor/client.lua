RegisterNetEvent("wd-spawnMotor")
AddEventHandler("wd-spawnMotor", function()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local heading = GetEntityHeading(player)
    local vehicleHash = GetHashKey("sanchez")
    
    RequestModel(vehicleHash)
    while not HasModelLoaded(vehicleHash) do
        Wait(100)
    end
    
    local vehicle = CreateVehicle(vehicleHash, coords.x, coords.y, coords.z, heading, true, false)
    SetPedIntoVehicle(player, vehicle, -1)
end)