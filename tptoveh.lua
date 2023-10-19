ESX = exports["es_extended"]:getSharedObject()
--local gotovehWebhook = 'https://discord.com/api/webhooks/1157386709038813264/7F-ilPPY15OS9dTnRr7bRGrkgZ1089lfci1uwNUtSng4cBqhB26EyPe_mb_cIBx637y3'
RegisterCommand('gotoveh', function(source, args)
    local entities = GetAllVehicles()
    local ped = GetPlayerPed(source)
    local plate = ESX.Math.Trim(table.concat(args, ' '))
    local xPlayer = ESX.GetPlayerFromId(source)
    local msg1 = 'Tens de especificar uma matrícula!'
    local msg2 = 'Não há veículos ativos!'
    local steamid = GetPlayerName(source)
    if not args[1] then
        xPlayer.showNotification(msg1)
    elseif #entities < 1 then
        xPlayer.showNotification(msg2)
    else
        for i = 1, #entities, 1 do
            if plate == ESX.Math.Trim(GetVehicleNumberPlateText(entities[i])) then
                SetEntityCoords(ped, GetEntityCoords(entities[i]))
                xPlayer.showNotification('Foste teleportado para o veículo com a matrícula' .. plate)
                --logs('✩✩✩ Comando Admin ✩✩✩\n[Comando]: /mapper \n[Staff]: '..steamid..'\n[Plate]: '..plate..'', gotovehWebhook, '#00FF00')
            else
                return 
            end
        end
    end
end, true)
--[[
function logs (message,webhook)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Mirandex Gotoveh Logs', embeds = {{["color"] = corfinal, ["author"] = {["name"] = 'Mirandex Gotoveh Logs', ["icon_url"] = ''}, ["description"] = message, ["footer"] = {["text"] = "Mirandex Gotoveh Logs - "..os.date("%x %X %p"),["icon_url"] = "",},}}, avatar_url = ''}), { ['Content-Type'] = 'application/json' })
end
]]--