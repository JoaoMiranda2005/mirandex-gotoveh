ESX = exports["es_extended"]:getSharedObject()
RegisterCommand('gotoveh', function(source, args)
    local entities = GetAllVehicles()
    local ped = GetPlayerPed(source)
    local plate = ESX.Math.Trim(table.concat(args, ' '))
    local xPlayer = ESX.GetPlayerFromId(source)
    local msg1 = 'Tens de especificar uma matrícula!'
    local msg2 = 'Não há veículos ativos!'
    if not args[1] then
        xPlayer.showNotification(msg1)
    elseif #entities < 1 then
        xPlayer.showNotification(msg2)
    else
        for i = 1, #entities, 1 do
            if plate == ESX.Math.Trim(GetVehicleNumberPlateText(entities[i])) then
                SetEntityCoords(ped, GetEntityCoords(entities[i]))
                xPlayer.showNotification('Foste teleportado para o veículo com a matrícula' .. plate)
            else
                return
            end
        end
    end
end, true)
