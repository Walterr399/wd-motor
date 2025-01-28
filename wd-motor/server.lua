local cooldowns = {}

RegisterCommand("motor", function(source, args, rawCommand)
    local player = source
    local currentTime = os.time()
    
    if cooldowns[player] and (currentTime - cooldowns[player]) < 120 then
        TriggerClientEvent("okokNotify:Alert", player, "Wait...", "You must wait 2 minutes before you can use /motor again.", 3500, "info")
        return
    end
    
    cooldowns[player] = currentTime
    
    TriggerClientEvent("wd-spawnMotor", player)
end, false)
