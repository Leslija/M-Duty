if Config.ScriptEnabled then
        if GetCurrentResourceName() == "M-Duty" then
        
local Job = Config.Hud.DefaultJob
RegisterCommand(Config.Duty.Command, function(source, args, raw)
    for _, i in pairs(Config.LEOJobs) do 
    i.Onduty = not i.Onduty
    if IsPlayerAceAllowed(source, i.Ace) or i.PublicDepartment then 
    if args[1] then

    if string.upper(args[1]) == i.argument and i.Onduty then 
        i.Onduty = true
        Job = i.HudText
        TriggerClientEvent("M:OnDuty", source, i.HudText, i.name, i.Onduty --[[table.unpack(i.Loadout[1])]])
        TriggerEvent("M:WebhookLog", "Player Went On duty", "Name: ["..source.."] " ..GetPlayerName(source).. "\nWent on duty as " ..i.name)
        TriggerEvent("eblips:add", {name = GetPlayerName(source), src = source, color = i.BlipColour})
        TriggerEvent("M:SmallNotification", source, "success", Config.Duty.OndutyMsg.." "..i.name)
    end

    if string.upper(args[1]) == i.argument and not i.Onduty then 
        i.Onduty = false
        Job = Config.Hud.DefaultJob
        TriggerClientEvent("M:OffDuty", source, Config.LEOJobs[i], i.name, i.Onduty)
        TriggerEvent("M:WebhookLog", "Player Went Off duty", "Name: ["..source.."] " ..GetPlayerName(source).. "\nWent off duty as " ..i.name)
        TriggerEvent("eblips:remove", source)
        TriggerEvent("M:SmallNotification", source, "error", Config.Duty.OffdutyMsg.." "..i.name)
                        end
                    end
                else
                    TriggerEvent("M:SmallNotification", source, "error", "You do not have permission to go onduty as the " ..i.name)
            end
        end
end)

RegisterCommand(Config.Duty.CurrentJobCmd, function(source, args, raw)
    TriggerEvent("M:SmallNotification", source, "info", Config.Duty.CurJobMsg.." "..Job:gsub("~%a~", ""))
end)

-------------------------------------
-------------- Events ---------------
-------------------------------------

RegisterNetEvent("M:WebhookLog")
AddEventHandler("M:WebhookLog", function(name, message)
    if Config.Discord.LoggingEnabled then
            local embed = {
                  {
                    ["color"] = 44270,
                    ["title"] = "**".. name .."**",
                    ["description"] = message,
                    ["footer"] = {
                    ["text"] = GetCurrentResourceName().." Created by FuriousFoxGG.#0001",
                  },
                }
            }
          
        PerformHttpRequest(Config.Discord.Webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
end)

RegisterNetEvent("M:SmallNotification")
AddEventHandler("M:SmallNotification", function(user, style, msg)
    TriggerClientEvent('t-notify:client:Alert', user, {style  =  style, message  =  msg})
end)

RegisterNetEvent("M:LargeNotification")
AddEventHandler("M:LargeNotification", function(user, style, title, msg)
    TriggerClientEvent('t-notify:client:Custom', user, {style  =  style, duration  =  10000, title  =  title, message  =  msg, sound  =  false})
end)

end
end
