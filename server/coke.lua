local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('ps-drugprocessing:pickedUpcoke_pure', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("coke_pure", 1) then 
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["coke_pure"], "add")
		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_pure"), "success")
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coke_pure"), "error")
	end
end)

RegisterServerEvent('ps-drugprocessing:processcoke_pure', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke_pure', Config.CokeProcessing.coke_pure) then
		if Player.Functions.AddItem('coke', Config.CokeProcessing.Processcoke_pure) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke_pure'], "remove", Config.CokeProcessing.coke_pure)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "add", Config.CokeProcessing.Processcoke_pure)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke"), "success")
		else
			Player.Functions.AddItem('coke_pure', Config.CokeProcessing.coke_pure)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coke_pure"), "error")
	end
end)

RegisterServerEvent('ps-drugprocessing:processCocaPowder', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke', Config.CokeProcessing.Coke) then
		if Player.Functions.RemoveItem('bakingsoda', Config.CokeProcessing.BakingSoda) then
			if Player.Functions.AddItem('coke_small_brick', Config.CokeProcessing.SmallCokeBrick) then
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "remove", Config.CokeProcessing.Coke)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['bakingsoda'], "remove", Config.CokeProcessing.BakingSoda)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke_small_brick'], "add", Config.CokeProcessing.SmallCokeBrick)
				TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_small_brick"), "success")
			else
				Player.Functions.AddItem('coke', Config.CokeProcessing.Coke)
				Player.Functions.AddItem('bakingsoda', Config.CokeProcessing.BakingSoda)
			end
		else
			Player.Functions.AddItem('coke', Config.CokeProcessing.Coke)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_bakingsoda"), "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_cokain"), "error")
	end
end)

RegisterServerEvent('ps-drugprocessing:processCocaBrick', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke_small_brick', Config.CokeProcessing.SmallBrick) then
		if Player.Functions.AddItem('coke_brick', Config.CokeProcessing.LargeBrick) then
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke_small_brick'], "remove", Config.CokeProcessing.SmallBrick)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke_brick'], "add", Config.CokeProcessing.LargeBrick)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_brick"), "success")
		else
			Player.Functions.AddItem('coke_small_brick', Config.CokeProcessing.SmallBrick)
		end
	end
end)
