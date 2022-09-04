--================================--
--      hp-orders 1.0             --
--      by BreezyTheDev           --
--		GNU License v3.0		  --
--================================--

NDCore = exports["ND_Core"]:GetCoreObject()

function pay(source, amount, players, target, paymentType)
    local money = players[source].bank
    if paymentType == "cash" then
        money = players[source].cash
    end
    if money >= amount then
        NDCore.Functions.DeductMoney(amount, source, "cash")
        NDCore.Functions.AddMoney(amount, target, "cash")
        return true
    end
    return false
end

-- Create an order and open the menu on the customer.
RegisterNetEvent("HPOrders:CreateOrder")
AddEventHandler("HPOrders:CreateOrder", function(customer, price, order, payment, id)
    local player = source

    -- check if the customer exists.
    if GetPlayerPing(customer) == 0 then
        TriggerClientEvent("HPOrders:Notify", player, "Order Menu", "Player not found.", "error", "#C53030")
        return
    end

    -- check if the customer is nearby.
    local customerCoords = GetEntityCoords(GetPlayerPed(customer))
    if #(customerCoords - Config.Menus[id].coords) > 2.0 then
        TriggerClientEvent("HPOrders:Notify", player, "Order Menu", "Player not in range.", "error", "#C53030")
        return
    end

    -- check if the client has the right perms.
    local players = NDCore.Functions.GetPlayers()
    local job = players[player].job
    if job ~= Config.Menus[id].job then
        return
    end

    -- finally, open the menu on the customers screen.
    TriggerClientEvent("HPOrders:giveMenu", customer, price, order, payment, player)
end)

-- Customer confirms payment.
RegisterNetEvent("HPOrders:Confirm")
AddEventHandler("HPOrders:Confirm", function(price, requestingPlayer, paymentType)
    local player = source
    local players = NDCore.Functions.GetPlayers()
    local success = pay(player, price, players, requestingPlayer, paymentType)
    if success then
        TriggerClientEvent("HPOrders:Notify", player, "Order Menu", "Confirmed payment $" .. price, "error", "#27ae60")
        TriggerClientEvent("HPOrders:Notify", requestingPlayer, "Order Menu", "Received $" .. price .. " from " .. players[player].firstName .. " " .. players[player].lastName, "error", "#27ae60")
    else
        TriggerClientEvent("HPOrders:Notify", player, "Order Menu", "Not enough cash.", "error", "#C53030")
        TriggerClientEvent("HPOrders:Notify", requestingPlayer, "Order Menu", "Card declined.", "error", "#C53030")
    end
end)

-- customer cancels payment.
RegisterNetEvent("HPOrders:Cancel")
AddEventHandler("HPOrders:Cancel", function(requestingPlayer)
    local player = source   
    TriggerClientEvent("HPOrders:Notify", player, "Order Menu", "Payment Canceled.", "error", "#C53030")
    TriggerClientEvent("HPOrders:Notify", requestingPlayer, "Order Menu", "Payment Canceled.", "error", "#C53030")
end)