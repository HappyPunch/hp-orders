--================================--
--      hp-orders 1.0             --
--      by BreezyTheDev           --
--		GNU License v3.0		  --
--================================--

NDCore = exports["ND_Core"]:GetCoreObject()

local pedCoords
local job

function drawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(true)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(_x, _y)
end

RegisterNetEvent("HPOrders:Notify")
AddEventHandler("HPOrders:Notify", function(title, desc, icon, iconColor)
    Config.Notification(title, desc, icon, iconColor)
end)

-- open the menu on the target player.
RegisterNetEvent("HPOrders:giveMenu")
AddEventHandler("HPOrders:giveMenu", function(price, order, payment, requestingPlayer)
    local alert = lib.alertDialog({
        header = "Payment requested",
        content = "**Price:** $" .. price .. "  \n**Payment Method:** " .. payment .. "  \n**Order:** " .. order,
        centered = true,
        cancel = true
    })

    if alert == "confirm" then
        TriggerServerEvent("HPOrders:Confirm", price, requestingPlayer, payment)  
    elseif alert == "cancel" then
        TriggerServerEvent("HPOrders:Cancel", requestingPlayer)
    end
end)

-- Update the job
RegisterNetEvent("ND:setCharacter")
AddEventHandler("ND:setCharacter", function(character)
    job = character.job
    print(job)
end)

AddEventHandler("playerSpawned", function()
    local selectedCharacter = NDCore.Functions.GetSelectedCharacter()
    if selectedCharacter then
        job = selectedCharacter.job
    end
end)

AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    Wait(2000)
    job = NDCore.Functions.GetSelectedCharacter().job
end)

-- Get ped info every half second.
CreateThread(function()
    while true do
        pedCoords = GetEntityCoords(PlayerPedId())
        Wait(500)
    end
end)

-- Main thread for checking distance and opening the order menu.
CreateThread(function()
    local wait = 500
    while true do
        Wait(wait)
        for id, menu in pairs(Config.Menus) do
            if #(pedCoords - menu.coords) <= menu.distance then
                if job == menu.job then
                    wait = 0
                    drawText3D(menu.coords, menu.text)
                    if IsControlPressed(0, 51) then
                        local input = lib.inputDialog("Create an order", {
                            {type = "number", label = "Player ID", default = 0},
                            {type = "number", label = "Price", default = 0},
                            {type = "input", label = "Order information"},
                            {type = "select", label = "Payment method", options = {
                                {value = "cash", label = "cash"},
                                {value = "card", label = "card"}
                            }}
                        })
                        if input then
                            local customer = tonumber(input[1])
                            local price = tonumber(input[2])
                            local order = input[3]
                            local payment = input[4]
                            if customer == nil then
                                Config.Notification("Order Menu", "Make sure to include an ID.", "error", "#C53030")
                            elseif price == nil then
                                Config.Notification("Order Menu", "Make sure to include a price.", "error", "#C53030")
                            elseif order == nil then
                                Config.Notification("Order Menu", "Make sure to include order information.", "error", "#C53030")
                            elseif payment == nil then
                                Config.Notification("Order Menu", "Make sure to select a payment method.", "error", "#C53030")
                            else
                                TriggerServerEvent("HPOrders:CreateOrder", customer, price, order, payment, id)
                            end
                        end
                    end
                else
                    wait = 500
                end
            end
        end
    end
end)
