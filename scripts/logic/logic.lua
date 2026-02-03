-- Core Functions
function has(item)
    return Tracker:ProviderCountForCode(item) > 0
end

function has_not(item)
    return Tracker:ProviderCountForCode(item) == 0
end

-- Item Accessibilty Rules
function hasDungeonCellKey()
    return true
end

function hasUAF2EastKey()
    return true
end

function hasBigPilgrimsKey()
    return true
end

function canUnlockSensCage()
    return has("cage_key") or has("master_key")
end

function canUnlockNewLondoVotD()
    return has("new_londo_key") or has("master_key")
end

function hasMysteryKey()
    return false
end

function canUnlockBasement()
    return has("watchtower_basement_key") or has("master_key")
end

function hasPineResinChest()
    return has("residence_key") or has("master_key")
end

-- Event Accessibility Rules
-- Since events are not locations (yet), they are always assumed to be true
function hasAsylumDemonDefeated() return true end
function hasTaurusDemonDefeated() return true end
function hasBellGargoylesDefeated() return true end
function hasCapraDemonDefeated() return true end
function hasCeaselessDischargeDefeated() return true end
function hasCentipedeDemonDefeated() return true end
function hasQuelaagDefeated() return true end
function hasPriscillaDefeated() return true end
function hasDemonFiresageDefeated() return true end
function hasOrnsteinSmoughDefeated() return true end
function hasFourKingsDefeated() return true end
function hasGapingDragonDefeated() return true end
function hasNitoDefeated() return true end
function hasGreyWolfSifDefeated() return true end
function hasGwynLordofCinderDefeated() return true end
function hasIronGolemDefeated() return true end
function hasMoonlightButterflyDefeated() return true end
function hasPinwheelDefeated() return true end
function hasSeathDefeated() return true end
function hasKalameetDefeated() return true end
function hasBedOfChaosDefeated() return true end
function hasManusDefeated() return true end
function hasArtoriasDefeated() return true end
function hasSanctuaryGuardianDefeated() return true end
function hasGwyndolinDefeated() return true end
function hasStrayDemonDefeated() return true end

function hasFirelinkShrinelit() return true end
function hasUndeadParishlit() return true end
function hasDepthslit() return true end
function hasUndeadBurgSunlightAltarlit() return true end
function hasQuelaagsDomainlit() return true end
function hasAnorLondolit() return true end
function hasAnorLondoChamberofthePrincesslit() return true end
function hasUndeadAsylumCourtyardlit() return true end
function hasUndeadAsylumInteriorlit() return true end
function hasUndeadBurglit() return true end
function hasDarkrootGardenlit() return true end
function hasDarkrootBasinlit() return true end
function hasBlighttownCatwalklit() return true end
function hasBlighttownSwamplit() return true end
function hasTheGreatHollowlit() return true end
function hasAshLakelit() return true end
function hasAshLakeStoneDragonlit() return true end
function hasDemonRuinsEntrancelit() return true end
function hasDemonRuinsStaircaselit() return true end
function hasDemonRuinsCatacombslit() return true end
function hasLostIzalithLavaPitslit() return true end
function hasLostIzalithPastIllusoryWalllit() return true end
function hasLostIzalithHeartofChaoslit() return true end
function hasSensFortresslit() return true end
function hasAnorLondoDarkmoonTomblit() return true end
function hasAnorLondoResidencelit() return true end
function hasPaintedWorldlit() return true end
function hasDukesArchivesEntrancelit() return true end
function hasDukesArchivesCelllit() return true end
function hasDukesArchivesBalconylit() return true end
function hasCrystalCavelit() return true end
function hasCatacombsNecromancerCavelit() return true end
function hasCatacombsVamoslit() return true end
function hasCatacombsPastIllusoryWalllit() return true end
function hasTomboftheGiantsPatcheslit() return true end
function hasTomboftheGiantslit() return true end
function hasTomboftheGiantsAltaroftheGravelordlit() return true end
function hasTheAbysslit() return true end
function hasOolacileSanctuaryGardenlit() return true end
function hasOolacileSanctuarylit() return true end
function hasOolacileTownshipDungeonlit() return true end
function hasChasmoftheAbysslit() return true end
function hasDepthsShortcutopened() return true end
function hasDepthsBlighttownopened() return true end
function hasDepthsBonfireRoomopened() return true end
function hasUndeadBurgFemaleMerchantShortcutopened() return true end
function hasUndeadBurgLowerUndeadBurgopened() return true end
function hasUndeadBurgBasementopened() return true end
function hasUndeadBurgWatchtowerUpperopened() return true end
function hasUndeadBurgWatchtowerLoweropened() return true end
function hasUndeadBurgSunlightAltaropened() return true end
function hasOolacileCrestKeyDooropened() return true end
function hasCatacombsDoor1opened() return true end
function hasCatacombsDoor2opened() return true end
function hasDemonRuinsShortcutopened() return true end
function hasSensFortressMainGateopened() return true end
function hasAnorLondoMainHallDooropened() return true end
function hasAnorLondoGiantBlacksmithShortcutopened() return true end
function hasAnorLondoBonfireShortcutopened() return true end
function hasNewLondoRuinsDoortotheSealopened() return true end
function hasNewLondoRuinsValleyoftheDrakesopened() return true end
function hasDukesArchivesBookshelfDooropened() return true end
function hasDukesArchivesCellDooropened() return true end
function hasUndeadAsylumCellDooropened() return true end
function hasUndeadAsylumF2WestDooropened() return true end
function hasUndeadAsylumShortcutDooropened() return true end
function hasUndeadAsylumF2EastDooropened() return true end
function hasUndeadAsylumBigPilgrimDooropened() return true end
function hasUndeadAsylumBossDooropened() return true end
function hasOolacileTownshiplit() return true end
function hasBellofAwakening1() return true end
function hasBellofAwakening2() return true end
function hasDemonRuinsShortcut() return true end

-- Location Accessibilty Rules
function canPassUAFog(item)
    return (not has("setting_fogwall_lock")) or (not has("setting_fogwall_lock_ua")) or has(item)
end

function canPassFog(item)
    return (not has("setting_fogwall_lock")) or has(item)
end

function canPassBossFog(item)
    return (not has("setting_fogwall_lock_boss")) or has(item)
end

-- Visibility Rules
function hasGoalOfAtLeastGwyn()
    return true
end