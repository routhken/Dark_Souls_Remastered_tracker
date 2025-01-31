ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")


CURRENT_INDEX = -1

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

function onClear(slotData)
    CURRENT_INDEX = -1

    -- Reset Locations
    for _, layoutLocationPath in pairs(LOCATION_MAPPING) do
        -- if layoutLocationPath[1] then
        --     local layoutLocationObject = Tracker:FindObjectForCode(layoutLocationPath[1])

        --     if layoutLocationObject then
        --         if layoutLocationPath[1]:sub(1, 1) == "@" then
        --             layoutLocationObject.AvailableChestCount = layoutLocationObject.ChestCount
        --         else
        --             layoutLocationObject.Active = false
        --         end
        --     end
        -- end

        if  layoutLocationPath and layoutLocationPath[1] then
            
            for _,layoutLocationElement in pairs(layoutLocationPath) do
                local layoutLocationObject = Tracker:FindObjectForCode(layoutLocationElement)

                if layoutLocationObject then
                    if layoutLocationElement:sub(1, 1) == "@" then
                        layoutLocationObject.AvailableChestCount = layoutLocationObject.ChestCount
                    else
                        layoutLocationObject.Active = false
                    end
                end
            end
        end

    end

    -- Reset Items
    for _, layoutItemData in pairs(ITEM_MAPPING) do
        if layoutItemData[1] and layoutItemData[2] then
            local layoutItemObject = Tracker:FindObjectForCode(layoutItemData[1])

            if layoutItemObject then
                if layoutItemData[2] == "toggle" then
                    layoutItemObject.Active = false
                elseif layoutItemData[2] == "progressive" then
                    layoutItemObject.CurrentStage = 0
                    layoutItemObject.Active = false
                elseif layoutItemData[2] == "consumable" then
                    layoutItemObject.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: Unknown item type %s for code %s", layoutItemData[2], layoutItemData[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: Could not find object for code %s", layoutItemData[1]))
            end
        end
    end

    -- Reset Settings
    -- no settings to reset

    --print("Slotdata: ") --debug
    --print(dump(slotData)) --debug
end


function onItem(index, itemId, itemName, playerNumber)
    if index <= CURRENT_INDEX then
        return
    end

    CURRENT_INDEX = index

    local itemObject = ITEM_MAPPING[itemId]
    
    if not itemObject or not itemObject[1] then
        return
    end

    local trackerItemObject = Tracker:FindObjectForCode(itemObject[1])

    if trackerItemObject then
        if itemObject[2] == "toggle" then
            trackerItemObject.Active = true
        elseif itemObject[2] == "progressive" then
            if trackerItemObject.Active then
                trackerItemObject.CurrentStage = trackerItemObject.CurrentStage + 1
            else
                trackerItemObject.Active = true
            end
        elseif itemObject[2] == "consumable" then
            trackerItemObject.AcquiredCount = trackerItemObject.AcquiredCount + trackerItemObject.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: Unknown item type %s for code %s", itemObject[2], itemObject[1]))
        end
    else
        print(string.format("onItem: Could not find object for code %s", itemObject[1]))
    end
end


function onLocation(locationId, locationName)
    local locationObject = LOCATION_MAPPING[locationId]

    if not locationObject or not locationObject[1] then
        return
    end

    for _,layoutLocationElement in pairs(locationObject) do

        local trackerLocationObject = Tracker:FindObjectForCode(layoutLocationElement)

        if trackerLocationObject then
            if layoutLocationElement:sub(1, 1) == "@" then
                trackerLocationObject.AvailableChestCount = trackerLocationObject.AvailableChestCount - 1
            else
                trackerLocationObject.Active = false
            end
        else
            print(string.format("onLocation: Could not find object for code %s", layoutLocationElement))
        end
    end
end


Archipelago:AddClearHandler("Clear", onClear)
Archipelago:AddItemHandler("Item", onItem)
Archipelago:AddLocationHandler("Location", onLocation)