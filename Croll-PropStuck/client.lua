-- Only props near the ped can be attached; skip the rest of the world pool (major win on busy servers).
local ATTACH_SCAN_RADIUS = 32.0

RegisterCommand("propstuck", function()
    local ped = PlayerPedId()
    if ped == 0 then return end

    local pedCoords = GetEntityCoords(ped)
    local count = 0

    for _, obj in ipairs(GetGamePool("CObject")) do
        if DoesEntityExist(obj) then
            local oc = GetEntityCoords(obj)
            if #(pedCoords - oc) <= ATTACH_SCAN_RADIUS and IsEntityAttachedToEntity(obj, ped) then
                SetEntityAsMissionEntity(obj, true, true)
                DeleteEntity(obj)
                count = count + 1
            end
        end
    end

    if count > 0 then
        Notify(("Removed %d attached props."):format(count), "success")
    else
        Notify("No props found on your player.", "error")
    end
end, false)

function Notify(msg, notifyType)
    local color = "~w~"
    if notifyType == "success" then
        color = "~g~"
    elseif notifyType == "error" then
        color = "~r~"
    end
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(color .. msg)
    EndTextCommandThefeedPostTicker(false, true)
end
