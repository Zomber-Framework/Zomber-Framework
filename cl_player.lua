Player = {}

function Player.IsSpawnHost()
    local mPlayerId = PlayerId()
    local mServerId = GetPlayerServerId(mPlayerId)
    local mPlayerPedPos = GetEntityCoords(PlayerPedId())

    for _, playerId in ipairs(GetActivePlayers()) do
        if playerId ~= mPlayerId then
            if GetPlayerServerId(playerId) > mServerId and Utils.GetDistanceBetweenCoords(mPlayerPedPos,
                GetEntityCoords(GetPlayerPed(playerId))) <= Config.Spawning.HOST_DECIDE_DIST then
                return false
            end
        end
    end

    return true
end
