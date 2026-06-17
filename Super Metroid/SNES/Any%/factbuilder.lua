addrs = {
    OptionsMenu = 0x2,
    PostCutscene = 0x1F,
    ceresRidley == 0xE0B5,
    flatRoom == 0xE06B,
    morphBall == 0x9E9F,
    metroidOne == 0xDAE1,
    metroidTwo == 0xDB31,
    metroidThree == 0xDB7D,
    metroidFour == 0xDBCD,
    bombTorizo == 0x9804,
    terminator == 0x990D,
    earlySupers == 0x9BC8,
    bigPink == 0x9D19,
    kraid == 0xA59F,
    varia == 0xA6E2,
    hiJumpShaft == 0xAA41,
    hiJump == 0xA9E5,
    speedBooster == 0xAD1B,
    doubleChamber == 0xADAD,
    waveBeam == 0xADDE,
    phantoon == 0xCD13,
    wreckedShipLeftSuperRoom == 0xCDA8,
    gravity == 0xCE40,
    tourianHopper == 0xDC19,
    seaweedVert == 0xDCFF,
    bigBoy == 0xDCB1,
    botwoon == 0xD95E,
    botwoonETankRoom == 0xD7E4,
    draygon == 0xDA60,
    spaceJump == 0xD9AA,
    plasmaBeam == 0xD2AA,
    iceBeam == 0xA890,
    mainHall == 0xB236,
    ridley == 0xB32E,
    statues == 0xA66A,
    statuesHallway == 0xA5ED,
    lowerNorfairElevator == 0xAF3F,
    ceresElevator == 0xDF45,
    startOfCeresCutscene == 0x20,
    normalGameplay == 0x8,
    glassTunnel == 0xCEFB,
    tunnelBreak == 0xD5,
    motherBrain == 0xDD58,
    motherBrainHPP2 == 0x4650,
    motherBrainHPP3 == 0x8CA0,
    landingSite == 0x91F8,
    endShip == 0xAA4F,
}

state = {
    started = false,
    roomID = 0x0,
    ceresBosses = 0x0,
    crateriaBosses = 0x0,
    brinstarBosses = 0x0,
    norfairBosses = 0x0,
    wreckedShipBosses = 0x0,
    maridiaBosses = 0x0,
    tourianBosses = 0x0,
    shipAI = 0x0,
    gameState = 0x0,
    tunnelBreak = 0x0,
    motherBrainHP = 0x0,
    unlockedEquipment1 = 0x0,
    unlockedEquipment2 = 0x0,
    unlockedBeams = 0x0,
    unlockedCharge = 0x0,
    crateriaItems = 0x0,
    brinteriaItems = 0x0,
    brinstarItems2 = 0x0,
    brinstarItems3 = 0x0,
    brinstarItems4 = 0x0,
    brinstarItems5 = 0x0,
    norfairItems1 = 0x0,
    norfairItems2 = 0x0,
    norfairItems3 = 0x0,
    norfairItems4 = 0x0,
    norfairItems5 = 0x0,
    wreckedShipItems = 0x0,
    maridiaItems1 = 0x0,
    maridiaItems2 = 0x0,
    maridiaItems3 = 0x0,
}

function onTick()
    updateState()
    if not state.started then
        checkStart()
    end
    if state.started then
        checkReset()
    end
    checkStage()
end

function checkStage()
    -- Ceres Ridley
    if roomID == addrs.ceresRidley
    and ceresBosses > ceresBosses_last then
        split()
        return
    end
    -- Escaped Ceres Station
    if roomID == addrs.ceresElevator
    and gameState == addrs.startOfCeresCutscene
    and gameState_last == addrs.normalGameplay then
        split()
        return
    end
    -- Morph Aquired
    if roomID == addrs.morphBall
    and unlockedEquipment2 > unlockedEquipment2_last then
        split()
        return
    end
    -- First Missile
    if maxMissiles == 0x5
    and maxMissiles_last == 0x0 then
        split()
        return
    end
    -- Bombs Aquired
    if roomID == addrs.bombTorizo
    and unlockedEquipment1 > unlockedEquipment1_last then
        split()
        return
    end
    -- Bomb Torizo
    if roomID == addrs.bombTorizo
    and crateriaBosses > crateriaBosses_last then
        split()
        return
    end
    -- Terminator Tank
    if roomID == addrs.terminator
    and brinteriaItems == (brinteriaItems_last + 1) then
        split()
        return
    end
    -- Early Supers
    if roomID == addrs.earlySupers
    and brinstarItems2 == (brinstarItems2_last + 1) then
        split()
        return
    end
    -- Charge Missile
    if roomID == addrs.bigPink
    and brinstarItems2 == (brinstarItems2_last + 64) then
        split()
        return
    end
    -- Charge Beam Aquired
    if roomID == addrs.bigPink
    and unlockedCharge > unlockedCharge_last then
        split()
        return
    end
    -- Kraid
    if roomID == addrs.kraid
    and brinstarBosses > brinstarBosses_last then
        split()
        return
    end
    -- Varia Suit Aquired
    if roomID == addrs.varia
    and unlockedEquipment2 > unlockedEquipment2_last then
        split()
        return
    end
    -- High Jump Boots Tank
    if roomID == addrs.hiJumpShaft
    and norfairItems2 == (norfairItems2_last + 1) then
        split()
        return
    end
    -- High Jump Boots
    if roomID == addrs.hiJump
    and unlockedEquipment1 > unlockedEquipment1_last then
        split()
        return
    end
    -- Speed Booster Aquired
    if roomID == addrs.speedBooster
    and unlockedEquipment1 > unlockedEquipment1_last then
        split()
        return
    end
    -- Wave Missile
    if roomID == addrs.doubleChamber
    and norfairItems3 == (norfairItems3_last + 8) then
        split()
        return
    end
    -- Wave Beam Aquired
    if roomID == addrs.waveBeam
    and unlockedBeams > unlockedBeams_last then
        split()
        return
    end
    -- Alpha Power Bombs Aquired
    if maxPowerBombs == 0x5
    and maxPowerBombs_last == 0x0 then
        split()
        return
    end
    -- Phantoon
    if roomID == addrs.phantoon
    and wreckedShipBosses > wreckedShipBosses_last then
        split()
        return
    end
    -- Left Supers
    if roomID == addrs.wreckedShipLeftSuperRoom
    and wreckedShipItems == (wreckedShipItems_last + 32) then
        split()
        return
    end
    -- Gravity Suit Aquired
    if roomID == addrs.gravity
    and unlockedEquipment2 > unlockedEquipment2_last then
        split()
        return
    end
    -- Tunnel Broken
    if roomID == addrs.glassTunnel
    and tunnelBreak == 0xD5
    and tunnelBreak_last == 0x0 then
        split()
        return
    end
    -- Botwoon
    if roomID == addrs.botwoon
    and maridiaBosses > maridiaBosses_last then
        split()
        return
    end
    -- Botwoon Tank
    if roomID == addrs.botwoonETankRoom
    and maridiaItems3 == (maridiaItems3_last + 1) then
        split()
        return
    end
    -- Draygon
    if roomID == addrs.draygon
    and maridiaBosses > maridiaBosses_last then
        split()
        return
    end
    -- Space Jump Aquired
    if roomID == addrs.spaceJump
    and unlockedEquipment1 > unlockedEquipment1_last then
        split()
        return
    end
    -- Plasma Aquired
    if roomID == addrs.plasmaBeam
    and unlockedBeams > unlockedBeams_last then
        split()
        return
    end
    -- Ice Beam Aquired
    if roomID == addrs.iceBeam
    and unlockedBeams > unlockedBeams_last then
        split()
        return
    end
    -- Entering Lower Norfair
    if roomID == addrs.mainHall
    and roomID_last == addrs.lowerNorfairElevator then
        split()
        return
    end
    -- Ridley Dead/Room
    if roomID == addrs.ridley
    and norfairBosses > norfairBosses_last then
        split()
        return
    end
    -- Golden 4
    if roomID == addrs.statues
    and roomID_last == addrs.statuesHallway then
        split()
        return
    end
    -- metroid 1
    if roomID == addrs.metroidTwo
    and roomID_last == addrs.metroidOne then
        split()
        return
    end
    -- metroid 2
    if roomID == addrs.metroidThree
    and roomID_last == addrs.metroidTwo then
        split()
        return
    end
    -- metroid 3
    if roomID == addrs.metroidFour
    and roomID_last == addrs.metroidThree then
        split()
        return
    end
    -- metroid 4
    if roomID == addrs.tourianHopper
    and roomID_last == addrs.metroidFour then
        split()
        return
    end
    -- baby
    if roomID == addrs.seaweedVert
    and roomID_last == addrs.bigBoy then
        split()
        return
    end
    -- Mother Brain 1
    if roomID == addrs.motherBrain
    and gameState == addrs.normalGameplay
    and motherBrainHP == addrs.motherBrainHPP2
    and motherBrainHP_last == 0 then
        split()
        return
    end
    -- Mother Brain 2
    if roomID == addrs.motherBrain
    and gameState == addrs.normalGameplay
    and motherBrainHP == addrs.motherBrainHPP3
    and motherBrainHP_last == 0 then
        split()
        return
    end
    -- Mother Brain 3
    if roomID == addrs.motherBrain
    and tourianBosses > tourianBosses_last then
        split()
        return
    end
    -- Final Escape need to add 1 frame
    if roomID == addrs.landingSite
    and shipAI == addrs.endShip
    and shipAI_last ~= addrs.endShip then
        split()
        state.started = false
        return
    end
end

function checkStart()
    -- normal start 17 frames late add a 283 ms offset
    -- 125510 0x02
    -- 125526 0x1F   17
    -- 125720 0x07   194   211
    if gameState == addrs.PostCutscene
    and gameState_last == addrs.OptionsMenu then
        split()
        state.started = true
    end
    -- if gameState_last == addrs.OptionsMenu
    -- and gameState == 0x1E
    -- and option_menu == 0x0 then
    -- and (player1input == (player1input_last + 128) --player1input bit7 set +128 dec
    -- or player1input2 == (player1input2_last + 16)) then --player1input2 bit4 set +16 dec) then
        -- split()
        -- state.started = true
    -- end
    -- -- cutscene ended start
    -- if gameState == 0x1F
    -- and gameState_last == 0x1E then
    --     split()
        -- state.started = true
    -- end
    -- -- zebes start
    -- if gameState == 0x6
    -- and gameState_last == 0x5 then
    --     split()
        -- state.started = true
    -- end
end

function checkReset()
    if roomID == 0x0
    and roomID_last ~= 0 then
        reset()
        state.started = false
        return
    end
end

function updateState()
    state.roomID = roomID
    state.ceresBosses = ceresBosses
    state.crateriaBosses = crateriaBosses
    state.brinstarBosses = brinstarBosses
    state.norfairBosses = norfairBosses
    state.wreckedShipBosses = wreckedShipBosses
    state.maridiaBosses = maridiaBosses
    state.tourianBosses = tourianBosses
    state.shipAI = shipAI
    state.gameState = gameState
    state.tunnelBreak = tunnelBreak
    state.motherBrainHP = motherBrainHP
    state.unlockedEquipment1 = unlockedEquipment1
    state.unlockedEquipment2 = unlockedEquipment2
    state.unlockedBeams = unlockedBeams
    state.unlockedCharge = unlockedCharge
    state.crateriaItems = crateriaItems
    state.brinteriaItems = brinteriaItems
    state.brinstarItems2 = brinstarItems2
    state.brinstarItems3 = brinstarItems3
    state.brinstarItems4 = brinstarItems4
    state.brinstarItems5 = brinstarItems5
    state.norfairItems1 = norfairItems1
    state.norfairItems2 = norfairItems2
    state.norfairItems3 = norfairItems3
    state.norfairItems4 = norfairItems4
    state.norfairItems5 = norfairItems5
    state.wreckedShipItems = wreckedShipItems
    state.maridiaItems1 = maridiaItems1
    state.maridiaItems2 = maridiaItems2
    state.maridiaItems3 = maridiaItems3
end