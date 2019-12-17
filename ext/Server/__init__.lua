class 'PositionServer'

function PositionServer:__init()
	print("Initializing PositionServer")
	self:RegisterEvents()
end

function PositionServer:RegisterEvents()
	NetEvents:Subscribe("Event:RequestPosition", self, self.RequestPosition)
end

function PositionServer:RequestPosition(player)
    print(player.name .. ' is requesting position')
    local transform = player.soldier.transform.trans
    NetEvents:SendTo('Event:ReceivedPosition', player, transform)
end

g_PositionServer = PositionServer()