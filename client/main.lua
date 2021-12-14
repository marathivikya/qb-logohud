local QBCore = exports['qb-core']:GetCoreObject()

local loaded = false


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    loaded = true
    SendNUIMessage(
        {
            type = "toggle",
            value = true
        }
    )
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    loaded = false
    SendNUIMessage(
        {
            type = "toggle",
            value = false
        }
    )
end)

Citizen.CreateThread(
    function()
        while true do
            Wait(1000)
            if loaded and not IsPauseMenuActive() then
                QBCore.Functions.TriggerCallback(
                    "me_logohud:getInfo",
                    function(money, bank, date, time, players)
                        SendNUIMessage(
                            {
                                type = "update",
                                online = players or 0,
                                id = GetPlayerServerId(PlayerId()) or 0,
                                money = ("₹" .. money) or "0",
                                bank = ("₹" .. bank) or "0",
                                playtime = time or 0,
                                date = date,
                            }
                        )
                    end
                )
            else
                SendNUIMessage(
                    {
                        type = "toggle",
                        value = false
                    }
                )
            end
        end
    end
)

