ENABLE_DEBUG_LOG = false
IS_ITEMS_ONLY = false

ScriptHost:LoadScript("scripts/logic/logic.lua")

Tracker:AddItems("items/items.json")

Tracker:AddMaps("maps/maps.json")

Tracker:AddLocations("locations/locations.json")
Tracker:AddLayouts("layouts/settings.json")

if (string.find(Tracker.ActiveVariantUID,"a_standard")) then
    Tracker:AddLayouts("layouts/items.json")
    Tracker:AddLayouts("layouts/tracker.json")
end

if (string.find(Tracker.ActiveVariantUID,"b_vertical")) then
    Tracker:AddLayouts("layouts/items_vertical.json")
    Tracker:AddLayouts("layouts/tracker_vertical.json")
end

if (string.find(Tracker.ActiveVariantUID,"c_items_only")) then
    Tracker:AddLayouts("layouts/items.json")
    Tracker:AddLayouts("layouts/tracker_items.json")
    IS_ITEMS_ONLY = true
end


if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end