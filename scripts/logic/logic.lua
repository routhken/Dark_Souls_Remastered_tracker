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

function hasPeculiarDoll()
    return has("peculiar_doll")
end

function hasBasementKey()
    return has("basement_key")
end

function hasCovenantOfArtorias()
    return has("covenant_of_artorias")
end

function hasCrestOfArtorias()
    return has("crest_of_artorias")
end

function hasCageKey()
    return has("cage_key")
end

function hasArchiveTowerCellKey()
    return has("archive_tower_cell_key")
end

function hasArchiveTowerGiantDoorKey()
    return has("archive_tower_giant_door_key")
end

function hasArchiveTowerGiantCellKey()
    return has("archive_tower_giant_cell_key")
end

function hasBlighttownKey()
    return has("blighttown_key")
end

function hasNewLondoRuinsKey()
    return has("new_londo_key")
end

function hasAnnexKey()
    return has("annex_key")
end

function hasSealKey()
    return has("seal_key")
end

function hasDepthsKey()
    return has("depths_key")
end

function hasUAF2WestKey()
    return has("uaf2_west_key")
end

function hasMysteryKey()
    return false
end

function hasOrangeCharredRing()
    return has("orange_charred_ring")
end

function hasSewerChamberKey()
    return has("sewer_chamber_key")
end

function hasWatchtowerBasementKey()
    return has("watchtower_basement_key")
end

function hasArchivePrisonExtraKey()
    return has("archive_prison_extra_key")
end

function hasResidenceKey()
    return has("residence_key")
end

function hasCrestKey()
    return has("crest_of_artorias")
end

function hasMasterKey()
    return has("master_key")
end

function hasLordSoulNito()
    return has("lord_soul_nito")
end

function hasLordSoulBedOfChaos()
    return has("lord_soul_bedofchaos")
end

function hasLordSoulFourKings()
    return has("lord_soul_fourkings")
end

function hasLordSoulSeath()
    return has("lord_soul_seath")
end

function hasLordvessel()
    return has("lordvessel")
end

function hasPendant()
    return has("pendant")
end

function hasRubbish()
    return has("rubbish")
end

function hasSunlightMedal()
    return has("sunlight_medal")
end

function hasBloodredMossClump()
    return has("bloodred_moss_clump")
end

function hasPurpleMossClump()
    return has("purple_moss_clump")
end

function hasBloomingPurpleMossClump()
    return has("blooming_purple_moss_clump")
end

function hasCrackedRedEyeOrb()
    return has("cracked_red_eye_orb")
end

function hasHumanity()
    return has("humanity")
end

function hasTwinHumanities()
    return has("twin_humanities")
end

function hasPrismStone()
    return has("prism_stone")
end

function hasDungPie()
    return has("dung_pie")
end

function hasPyromancyFlame()
    return has("pyromancy_flame")
end

function hasPyromancyFlameAscended()
    return has("pyromancy_flame_ascended")
end

function hasEggVermifuge()
    return has("egg_vermifuge")
end

function hasSunlightMaggot()
    return has("sunlight_maggot")
end

function hasSack()
    return has("sack")
end

function hasSkullLantern()
    return has("skull_lantern")
end

function hasSunPrincessRing()
    return has("ring_of_the_sun_princess")
end

function hasXanthousCrown()
    return has("xanthous_crown")
end

function hasSoulOfManus()
    return has("soul_of_manus")
end

-- function hasBrokenPendant()
--     return has("pendant")
-- end

-- Event Accessibility Rules
-- Since events are not locations (yet), they are always assumed to be true
function hasTaurusDemonDefeated()
    return true
end

function hasQuelaagDefeated()
    return true
end

function hasIronGolemDefeated()
    return true
end

function hasFourKingsDefeated()
    return true
end

function hasSeathDefeated()
    return true
end

function hasOrnsteinSmoughDefeated()
    return true
end

function hasCentipedeDemonDefeated()
    return true
end

-- Location Accessibilty Rules
function canReachUndeadAsylumCell()
    return true
end

function canReachUndeadAsylumCellDoor()
    return canReachUndeadAsylumCell() and hasDungeonCellKey()
end

function canReachNorthernUndeadAsylum()
    return canReachUndeadAsylumCellDoor() and hasDungeonCellKey()
end

function canReachUAF2EastDoor()
    return canReachNorthernUndeadAsylum() and hasUAF2EastKey()
end

function canReachUABigPilgrimDoor()
    return canReachUAF2EastDoor() and hasBigPilgrimsKey()
end

function canReachUpperUndeadBurg()
    return true
end

function canReachUndeadBurgPineResinChest()
    return canReachUpperUndeadBurg() and (hasMasterKey() or hasResidenceKey())
end

function canReachUndeadParish()
    return canReachUpperUndeadBurg() and hasTaurusDemonDefeated()
end

function canReachDarkrootBasin()
    return true
end

function canReachDarkrootGarden()
    return true
end

function canReachWatchtowerBasement()
    return (canReachUpperUndeadBurg() or canReachDarkrootBasin()) and (hasMasterKey() or hasWatchtowerBasementKey())
end

function canReachUAF2WestDoor()
    return hasUAF2WestKey()
end

function canReachBehindArtoriasDoor()
    return canReachDarkrootGarden() and hasCrestOfArtorias()
end

function canReachLowerUndeadBurg()
    return canReachUpperUndeadBurg() and hasTaurusDemonDefeated() and (hasBasementKey() or hasMasterKey())
end

function canReachDepths()
    return canReachLowerUndeadBurg() and hasDepthsKey()
end

function canReachLowerUndeadBurgResidence()
    return canReachLowerUndeadBurg() and (hasResidenceKey() or hasMasterKey())
end

function canReachUpperNewLondo()
    return true
end

function canReachValleyOfTheDrakes()
    return canReachUpperNewLondo() and (hasNewLondoRuinsKey() or hasMasterKey())
end

function canReachSewerChamber()
    return canReachDepths() and (hasSewerChamberKey() or hasMasterKey())
end

function canReachBlighttown()
    return (canReachDepths() and hasBlighttownKey()) or canReachValleyOfTheDrakes()
end

function canReachDemonRuins()
    return canReachBlighttown() and hasQuelaagDefeated()
end

function canReachGreatHollow()
    return canReachBlighttown() and hasLordvessel()
end

function canReachSensFortress()
    return canReachDemonRuins() and canReachUndeadParish()
end

function canReachSensFortressCage()
    return canReachSensFortress() and hasCageKey()
end

function canReachAnorLondo()
    return canReachSensFortress() and hasIronGolemDefeated()
end

function canReachLowerNewLondo()
    return canReachUpperNewLondo() and hasSealKey() --and canReachAnorLondo() --can be reasonably done without anor londo access
end

function canReachAbyss()
    return canReachLowerNewLondo() and hasCovenantOfArtorias()
end

function canReachValleyOfTheDrakesFourKings()
    return canReachValleyOfTheDrakes() and canReachAbyss() and hasFourKingsDefeated()
end

function canReachDukesArchives()
    return canReachAnorLondo() and hasLordvessel()
end

function canReachDukesArchivesCellDoor()
    return canReachDukesArchives() and hasArchiveTowerCellKey()
end

function canReachDukesArchivesCellExit()
    return canReachDukesArchivesCellDoor() and (hasArchivePrisonExtraKey() or hasArchiveTowerGiantCellKey())
end

function canReachDukesArchivesPrison()
    return canReachDukesArchivesCellDoor() and hasArchivePrisonExtraKey()
end

function canReachDukesArchivesGiantDoor()
    return canReachDukesArchivesCellExit() and hasArchiveTowerGiantDoorKey()
end

function canReachDukesArchivesTowerGiantCell()
    return canReachDukesArchivesCellDoor() and hasArchiveTowerGiantCellKey()
end

function canReachDukesArchivesPostSeath()
    return canReachDukesArchives() and hasSeathDefeated()
end

function canReachPaintedWorld()
    return canReachAnorLondo() and hasPeculiarDoll()
end

function canReachPaintedWorldAnnex()
    return canReachPaintedWorld() and hasAnnexKey()
end

function canReachDemonRuinsGoldWall()
    return canReachDemonRuins() and hasLordvessel()
end

function canReachLostIzalith()
    return canReachDemonRuinsGoldWall() and hasOrangeCharredRing() and hasCentipedeDemonDefeated()
end

function canReachCatacombs()
    return canReachAnorLondo() and hasOrnsteinSmoughDefeated()
end

function canReachTombOfTheGiants()
    return canReachCatacombs()
end

function canReachTombOfTheGiantsGoldWall()
    return canReachTombOfTheGiants() and hasLordvessel()
end

function canReachKilnOfTheFirtFlame()
    return hasLordSoulBedOfChaos() and hasLordSoulFourKings() and hasLordSoulNito() and hasLordSoulSeath() and hasLordvessel()
end

-- Visibility Rules
function hasGoalOfAtLeastGwyn()
    return true
end