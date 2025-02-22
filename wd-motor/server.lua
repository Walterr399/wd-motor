local cooldowns = {}

---@param source number
---@param args table
---@param rawCommand string
RegisterCommand("motor", function(source, args, rawCommand)
    local player = source
    local currentTime = os.time()
    
    if cooldowns[player] and (currentTime - cooldowns[player]) < 300 then -- Pas aan let op is in seconden, dus bijv 300 seconden = 5 minuten
        TriggerClientEvent("okokNotify:Alert", player, "Wacht...", "Je moet 5 minuten wachten voordat je weer /motor kan doen!", 3500, "info")
        return
    end
    
    cooldowns[player] = currentTime
    TriggerClientEvent("helmond-spawnmotor", player)
end, false)
