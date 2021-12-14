local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('me_logohud:getInfo', function(source, cb)
	local Player = QBCore.Functions.GetPlayer(source)
	local cash = Player.PlayerData.money.cash
	local bank = Player.PlayerData.money.bank
	cb(cash, bank, os.date( "%d/%m/%Y"), os.date( "%I:%M %p"), GetNumPlayerIndices())
end)