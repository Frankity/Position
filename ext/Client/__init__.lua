class 'PositionClient'

function PositionClient:__init()
	print("Initializing PositionClient")
	self:RegisterEvents()
end

function PositionClient:RegisterVars()
end

function PositionClient:RegisterEvents()
    Events:Subscribe('Client:UpdateInput', self, self.OnUpdateInput)
    NetEvents:Subscribe('Event:ReceivedPosition', self, self.ReceivedPosition)

end

function PositionClient:OnUpdateInput(deltaTime)
    local player = PlayerManager:GetLocalPlayer()
    if InputManager:WentKeyDown(InputDeviceKeys.IDK_Tab) then
        NetEvents:SendLocal("Event:RequestPosition", player)
    end 
end

function PositionClient:ReceivedPosition(transform)
    print(transform)
end

return PositionClient()