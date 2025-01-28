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

    local vehicle = CreateVehicle(vehicleHash, coords.x, coords.y, coords.z, heading, true, true)
    SetPedIntoVehicle(player, vehicle, -1)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)

    Citizen.CreateThread(function()
        while DoesEntityExist(vehicle) do
            Wait(100)
            if not IsPedInVehicle(player, vehicle, false) then
                Wait(1000) 
                if DoesEntityExist(vehicle) then
                    DeleteEntity(vehicle)
                    TriggerEvent("okokNotify:Alert", "Voertuig", "Je motor is verwijderd!", 3500, "info")
                end
                break
            end
        end
    end)
end)
