local cooldowns = {}

RegisterCommand("motor", function(source, args, rawCommand)
    local player = source
    local currentTime = os.time()
    
    if cooldowns[player] and (currentTime - cooldowns[player]) < 120 then
        TriggerClientEvent("okokNotify:Alert", player, "Wacht...", "Je moet 2 minuten wachten voordat je weer /motor kan doen.", 3500, "info")
        return
    end
    
    cooldowns[player] = currentTime
    
    TriggerClientEvent("wd-spawnMotor", player)
end, false)
