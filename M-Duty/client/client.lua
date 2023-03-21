Citizen.Trace("\n===========\nLoading " ..GetCurrentResourceName().. "\nScript Enabled: " ..tostring(Config.ScriptEnabled).. "\n===========")

if Config.ScriptEnabled then
    if GetCurrentResourceName() == "M-Duty" then

for _, v in pairs(Config.LEOJobs) do
    TriggerEvent('chat:addSuggestion', "/"..Config.Duty.Command, 'Go onduty as a Department', {{ name="DEPARTMENT", help= "Go Onduty as a selected department"}})    
    TriggerEvent('chat:addSuggestion', "/"..Config.Duty.CurrentJobCmd, 'Returns with the Current Department you are active as.')    
end

Job = Config.Hud.DefaultJob
Duty = false

-------------------------------------
-------------- Events ---------------
-------------------------------------

RegisterNetEvent("M:Duty:DebugLog")
AddEventHandler("M:Duty:DebugLog", function(msg)
    if Config.Debugging then
    Citizen.Trace("\n"..msg)
    end
end)

RegisterNetEvent("M:OnDuty")
AddEventHandler("M:OnDuty", function(job, DptName, Onduty --[[loadout]])
    Duty = Onduty
    Job = job
    TriggerEvent("M:Duty:DebugLog", "Loadout as " ..tostring(loadout))
    --GiveWeaponToPed(GetPlayerPed(-1), loadout, 60, false, true)
   TriggerEvent("M:Duty:DebugLog", "Onduty as " ..DptName)
end)

RegisterNetEvent("M:OffDuty")
AddEventHandler("M:OffDuty", function(job, DptName, Onduty)
        Duty = Onduty
        Job = job
    RemoveAllPedWeapons(PlayerPedId())
   TriggerEvent("M:Duty:DebugLog", "Offduty as " ..DptName)
end)


-------------------------------------
-------------- Threads --------------
-------------------------------------

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      for _, i in pairs(Config.LEOJobs) do
      if Config.Hud.Enabled then
       if Duty then
          Draw2DText(Config.Hud.x, Config.Hud.y, Config.Hud.Colour..Config.Hud.JobText.." "..Job, Config.Hud.Scale)
       else 
        Draw2DText(Config.Hud.x, Config.Hud.y, Config.Hud.Colour..Config.Hud.JobText.." "..Config.Hud.DefaultJob, Config.Hud.Scale)
                end
            end
        end
    end
end)

-------------------------------------
------------- Functions -------------
-------------------------------------

function Draw2DText(x, y, text, scale)
SetTextFont(4)
SetTextProportional(7)
SetTextScale(scale, scale)
SetTextColour(255, 255, 255, 255)
SetTextDropShadow(0, 0, 0, 0,255)
SetTextDropShadow()
SetTextEdge(4, 0, 0, 0, 255)
SetTextOutline()
SetTextEntry("STRING")
AddTextComponentString(text)
DrawText(x, y)
end



else 
    Citizen.Trace("\nERROR: " ..GetCurrentResourceName().. " Needs to be Named M-Duty\n===========")
end
else 
    Citizen.Trace("\n"..GetCurrentResourceName().. " is currently disabled as Config.ScriptEnabled = " ..tostring(Config.ScriptEnabled).. "\n===========")
end
