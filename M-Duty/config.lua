--CONFIG TABLES
Config = {}
Config.Hud = {}
Config.Blips = {}
Config.Duty = {}
Config.LEOJobs = {}
Config.CivJobs = {} --Coming Soon

Config.ScriptEnabled = true

--HUD
Config.Hud.Enabled = true 
Config.Hud.x = .165
Config.Hud.y = .93
Config.Hud.Scale = .45
Config.Hud.Colour = "~h~~b~"
Config.Hud.JobText = "Job:"
Config.Hud.DefaultJob = "~w~None"

--BLIPS CONFIG
Config.Blips.UpdateTime = 1

--DEBUGGING
Config.Debugging = true --Set to false if you don't want things to be logged in console

--DUTY CONFIGURATION
Config.Duty.Command = "duty"
Config.Duty.CurrentJobCmd = "currentdpt" --/currentdpt will display what you are currently onduty as, useful for if you don't have Config.Hud.Enabled set to true
Config.Duty.CurJobMsg = "You are onduty as:"
Config.Duty.OndutyMsg = "You are now on duty as the" --Will display You are now onduty as the Blaine County Sheriff's Office etc
Config.Duty.OffdutyMsg = "You are now off duty as the" --Will display You are now offduty as the Blaine County Sheriff's Office etc


--[[EXAMPLE:
Config.LEOJobs.BCSO = {
    argument = "BCSO", --/duty [argument] (The /duty can be changed in Config.OndutyCommand)
    name = "Blaine County Sheriff's Office", --The Name of the Department, for messages etc
    HudText = "~g~Sheriff's Office", --The Text displayed if Config.Hud.Enabled
    PublicDepartment = false, --If it is a public department then anyone can go onduty as it
    Onduty = false, --Keep to false
    Ace = "furiousfoxgg.bcso", --if PublicDepartment = false then the user requires an ace permission for example: add_ace group.bcso furiousfoxgg.bcso allow
    BlipColour = 2, --The colour of the blip, can be found at: https://docs.fivem.net/docs/game-references/blips/ (SCROLL ALL WAY TO BOTTOM)
    Loadout = {force = false, "WEAPON_FLASHLIGHT", "WEAPON_CARBINERIFLE", "WEAPON_COMBATPISTOL"} --Loadout, if forced they cannot spawn any other weapon, if not they can spawn in other weapons. [WORK IN PROGRESS]
}]]

Config.LEOJobs.BCSO = {
    argument = "BCSO",
    name = "Blaine County Sheriff's Office",
    HudText = "~g~Sheriff's Office",
    PublicDepartment = false,
    Onduty = false,
    Ace = "furiousfoxgg.bcso",
    BlipColour = 47,
    Loadout = {force = false, {"WEAPON_FLASHLIGHT", "WEAPON_CARBINERIFLE", "WEAPON_COMBATPISTOL"}}
}

Config.LEOJobs.SAHP = {
    argument = "SAHP",
    name = "San Andreas Highway Patrol",
    HudText = "~c~Highway Patrol",
    PublicDepartment = false,
    Onduty = false,
    Ace = "furiousfoxgg.sahp",
    BlipColour = 29,
    Loadout = {force = false, {"WEAPON_FLASHLIGHT", "WEAPON_CARBINERIFLE", "WEAPON_COMBATPISTOL"}}
}

Config.LEOJobs.LSPD = {
    argument = "LSPD",
    name = "Los Santos Police Department",
    HudText = "~b~Police Department",
    PublicDepartment = false,
    Onduty = false,
    Ace = "furiousfoxgg.lspd",
    BlipColour = 2,
    Loadout = {force = false, {"WEAPON_FLASHLIGHT", "WEAPON_CARBINERIFLE", "WEAPON_COMBATPISTOL"}}
}

Config.LEOJobs.SASP = {
    argument = "SASP",
    name = "San Andreas State Police",
    HudText = "~o~State Police",
    PublicDepartment = false,
    Onduty = false,
    Ace = "furiousfoxgg.sasp",
    BlipColour = 54,
    Loadout = {force = false, {"WEAPON_FLASHLIGHT", "WEAPON_CARBINERIFLE", "WEAPON_COMBATPISTOL"}}
}