addrs = {
    selectFile = 0x01,
    loadFile = 0x05,
    inDungeon = 0x7,
    transition = 0xF, --room to overworld 
    dungeon = 0xA,
    lightWorld = 0x1,
    lightWorld = 0x2,
    swordUP = 0x24,
    masterGet = 0x17,
    sanctuary = 0x0,
    eastern = 0x04,
    desert = 0x06,
    tower = 0x08,
    swamp = 0x0a,
    PoD = 0x0c,
    mire = 0x0e,
    skullWoods = 0x10,
    ice = 0x12,
    hera = 0x14,
    thieves = 0x16,
    turtleRock = 0x18,
    GT = 0x1a,
    pyramid = 0x20,
    bossMusic = 0x15,
    fadeOut = 0x93,
    ganonRoom = 0x0,
    sancDoor = 0x12,
    door = 0x3E3
    -- pendants = 0xF374,
    -- crystals = 0xF37A
}

-- pendantVals = {
--     ep = 0x04,
--     dp = 0x02,
--     toh = 0x01
-- }

-- crystalVals = {
--     mm = 0x01,
--     pod = 0x02,
--     ip = 0x04,
--     tr = 0x08,
--     sp = 0x10,
--     tt = 0x20,
--     sw = 0x40
-- }

state = {
    started = false,
    escape = false,
    ep = false,
    dp = false,
    toh = false,
    castleTower = false,
    agaDead = false,
    pod = false,
    sp = false,
    sw = false,
    tt = false,
    ip = false,
    mm = false,
    tr = false,
    ganon_dead = false
}

function onTick()
    if not started then
        checkStart()
    end
    if started then
        checkReset()
    end
    checkStage()
end

function checkStage()
    -- Escaped
    if world == dungeon
    and mapID == sanctuary
    and yPos == door
    and maptile == sancDoor
    and gamemode == transition
    and gamemode_last == inDungeon then
        split()
        return
    end
    -- Eastern Palace
    if world == dungeon
    and mapID == eastern
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Desert Palace
    if world == dungeon
    and mapID == desert
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Tower of Hera
    if world == dungeon
    and mapID == hera
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Master Sword
    if  world == lightWorld
    and linkState == masterGet
    and linkState_last ~= masterGet then
        split()
        return
    end
    -- Castle Conquered entering Agh 1
    if world == dungeon
    and mapID == tower
    and music == bossMusic
    and music_last ~= bossMusic then
        split()
        return
    end
    -- Agh 1 beaten on pyramid
    if world == darkWorld
    and maptile == pyramid
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Palace of Darkness
    if world == dungeon
    and mapID == PoD
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Thieves Town
    if world == dungeon
    and mapID == thieves
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Skull Woods
    if world == dungeon
    and mapID == skullWoods
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Ice Palace
    if world == dungeon
    and mapID == ice
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Swamp Palace
    if world == dungeon
    and mapID == swamp
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Misery Mire
    if world == dungeon
    and mapID == mire
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Turtle Rock
    if world == dungeon
    and mapID == turtleRock
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- Ganon's Tower entering Agh 2
    if world == dungeon
    and mapID == GT
    and music == bossMusic
    and music_last ~= bossMusic then
        split()
        return
    end
    -- Agh 2 beaten
    if world == darkWorld
    and maptile == pyramid
    and linkState == swordUP
    and linkState_last ~= swordUP then
        split()
        return
    end
    -- finish
    if world == dungeon
    and maptile == ganonRoom
    and triforce == fadeOut then
        split()
        return
    end
end

function checkStart()
    if gamemode == loadFile
    gamemode_last == selectFile
    and ((0xD0 & player1input) ~= 0
    or (0xC0 & player1inputcont) ~= 0) then
        split()
        started == true
        return
    end
end

function checkReset()
    if fileloaded ~= 0xFFFF
    and fileloaded_last == 0xFFFF then
        reset()
        started == false
        return
    end
end
