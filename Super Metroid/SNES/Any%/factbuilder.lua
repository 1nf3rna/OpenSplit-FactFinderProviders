state = {
    started = false
}

function onTick()
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
    if roomID == 0xE0B5
    and (ceresBosses & 0x1) > 0
    and (ceresBosses_last & 0x1) == 0 then
        split()
        return
    end
    -- Escaped Ceres Station
    if roomID == 0xDF45
    and gameState == 0x20
    and gameState_last == 0x8 then
        split()
        return
    end
    -- Morph Aquired
    if roomID == 0x9E9F
    and (unlockedEquipment2 & 0x4) > 0
    and (unlockedEquipment2_last & 0x4) == 0 then
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
    if roomID == 0x9804
    and (unlockedEquipment1 & 0x10) > 0
    and (unlockedEquipment1_last & 0x10) == 0 then
        split()
        return
    end
    -- Bomb Torizo
    if roomID == 0x9804
    and (crateriaBosses & 0x4) > 0
    and (crateriaBosses_last & 0x4) == 0 then
        split()
        return
    end
    -- Terminator Tank
    if roomID == 0x990D
    and brinteriaItems == (brinteriaItems_last + 1) then
        split()
        return
    end
    -- Early Supers
    if roomID == 0x9BC8
    and brinstarItems2 == (brinstarItems2_last + 1) then
        split()
        return
    end
    -- Charge Missile
    if roomID == 0x9D19
    and brinstarItems2 == (brinstarItems2_last + 64) then
        split()
        return
    end
    -- Charge Beam Aquired
    if roomID == 0x9D19
    and (unlockedCharge & 0x10) > 0
    and (unlockedCharge_last & 0x10) == 0 then
        split()
        return
    end
    -- Kraid
    if roomID == 0xA59F
    and (brinstarBosses & 0x1) > 0
    and (brinstarBosses_last & 0x1) == 0 then
        split()
        return
    end
    -- Varia Suit Aquired
    if roomID == 0xA6E2
    and (unlockedEquipment2 & 0x1) > 0
    and (unlockedEquipment2_last & 0x1) == 0 then
        split()
        return
    end
    -- High Jump Boots Tank
    if roomID == 0xAA41
    and norfairItems2 == (norfairItems2_last + 1) then
        split()
        return
    end
    -- High Jump Boots
    if roomID == 0xA9E5
    and (unlockedEquipment1 & 0x1) > 0
    and (unlockedEquipment1_last & 0x1) == 0 then
        split()
        return
    end
    -- Speed Booster Aquired
    if roomID == 0xAD1B
    and (unlockedEquipment1 & 0x20) > 0
    and (unlockedEquipment1_last & 0x20) == 0 then
        split()
        return
    end
    -- Wave Missile
    if roomID == 0xADAD
    and norfairItems3 == (norfairItems3_last + 8) then
        split()
        return
    end
    -- Wave Beam Aquired
    if roomID == 0xADDE
    and (unlockedBeams & 0x1) > 0
    and (unlockedBeams_last & 0x1) == 0 then
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
    if roomID == 0xCD13
    and (wreckedShipBosses & 0x1) > 0
    and (wreckedShipBosses_last & 0x1) == 0 then
        split()
        return
    end
    -- Left Supers
    if roomID == 0xCDA8
    and wreckedShipItems == (wreckedShipItems_last + 32) then
        split()
        return
    end
    -- Gravity Suit Aquired
    if roomID == 0xCE40
    and (unlockedEquipment2 & 0x20) > 0
    and (unlockedEquipment2_last & 0x20) == 0 then
        split()
        return
    end
    -- Tunnel Broken
    if roomID == 0xCEFB
    and (eventFlags & 0x8) > 0
    and (eventFlags_last & 0x8) == 0 then
        split()
        return
    end
    -- Botwoon
    if roomID == 0xD95E
    and (maridiaBosses & 0x2) > 0
    and (maridiaBosses_last & 0x2) == 0 then
        split()
        return
    end
    -- Botwoon Tank
    if roomID == 0xD7E4
    and maridiaItems3 == (maridiaItems3_last + 1) then
        split()
        return
    end
    -- Draygon
    if roomID == 0xDA60
    and (maridiaBosses & 0x1) > 0
    and (maridiaBosses_last & 0x1) == 0 then
        split()
        return
    end
    -- Space Jump Aquired
    if roomID == 0xD9AA
    and (unlockedEquipment1 & 0x2) > 0
    and (unlockedEquipment1_last & 0x2) == 0 then
        split()
        return
    end
    -- Plasma Aquired
    if roomID == 0xD2AA
    and (unlockedBeams & 0x8) > 0
    and (unlockedBeams_last & 0x8) == 0 then
        split()
        return
    end
    -- Ice Beam Aquired
    if roomID == 0xA890
    and (unlockedBeams & 0x2) > 0
    and (unlockedBeams_last & 0x2) == 0 then
        split()
        return
    end
    -- Entering Norfair
    if roomID == 0xA7DE
    and roomID_last == 0xA6A1 then
        split()
        return
    end
    -- Ridley Dead/Room
    if roomID == 0xB32E
    and (norfairBosses & 0x1) > 0
    and (norfairBosses_last & 0x1) == 0 then
        split()
        return
    end
    -- Golden 4
    if roomID == 0xA66A
    and roomID_last == 0xA5ED
    and (norfairBosses & 0x1) > 0
    and (brinstarBosses & 0x1) > 0
    and (maridiaBosses & 0x1) > 0
    and (wreckedShipBosses & 0x1) > 0 then
        split()
        return
    end
    -- metroid 1
    if roomID == 0xDB31
    and roomID_last == 0xDAE1 then
        split()
        return
    end
    -- metroid 2
    if roomID == 0xDB7D
    and roomID_last == 0xDB31 then
        split()
        return
    end
    -- metroid 3
    if roomID == 0xDBCD
    and roomID_last == 0xDB7D then
        split()
        return
    end
    -- metroid 4
    if roomID == 0xDC19
    and roomID_last == 0xDBCD then
        split()
        return
    end
    -- baby
    if roomID == 0xDCFF
    and roomID_last == 0xDCB1 then
        split()
        return
    end
    -- Mother Brain 1
    if roomID == 0xDD58
    and gameState == 0x8
    and motherBrainHP == 0x4650
    and motherBrainHP_last == 0 then
        split()
        return
    end
    -- Mother Brain 2
    if roomID == 0xDD58
    and gameState == 0x8
    and motherBrainHP == 0x8CA0
    and motherBrainHP_last == 0 then
        split()
        return
    end
    -- Mother Brain 3
    if roomID == 0xDD58
    and (tourianBosses & 0x2) > 0
    and (tourianBosses_last & 0x2) == 0 then
        split()
        return
    end
    -- Final Escape
    if shipAI == 0xAA4F
    and shipAI_last ~= 0xAA4F
    and (eventFlags & 0x40) > 0 then
        split()
        state.started = false
        return
    end
end

function checkStart()
    -- normal start
    if gameState == 0x1F
    and gameState_last == 0x2 then
        split()
        state.started = true
    end
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
