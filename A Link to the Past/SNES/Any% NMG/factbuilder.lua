addrs = {
    selectFile = 0x01,
    loadFile = 0x05,
    inDungeon = 0x7,
    transition = 0xF, --room to overworld 
    dungeon = 0xA,
    lightWorld = 0x1,
    darkWorld = 0x2,
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
    door = 0x3E3,
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
    if not state.started then
        checkStart()
    end
    if state.started then
        checkReset()
    end
    checkStage()
end

function checkStage()
    if world == addrs.dungeon then
        -- Escaped
        if mapID == addrs.sanctuary
        and yPos == addrs.door
        and maptile == addrs.sancDoor
        and gamemode == addrs.transition
        and gamemode_last == addrs.inDungeon then
            split()
            return
        end
        --pendant/crystal collected
        if linkState == addrs.swordUP
        and linkState_last ~= addrs.swordUP then
            -- Eastern Palace
            -- Desert Palace
            -- Tower of Hera
            -- Palace of Darkness
            -- Thieves Town
            -- Skull Woods
            -- Ice Palace
            -- Swamp Palace
            -- Misery Mire
            -- Turtle Rock
            if mapID == addrs.eastern
            or mapID == addrs.desert
            or mapID == addrs.hera
            or mapID == addrs.PoD
            or mapID == addrs.thieves
            or mapID == addrs.skullWoods
            or mapID == addrs.ice
            or mapID == addrs.swamp
            or mapID == addrs.mire
            or mapID == addrs.turtleRock then
                split()
                return
            end
            -- Castle Conquered entering Agh 1
            -- Ganon's Tower entering Agh 2
            if (mapID == addrs.tower
            or mapID == addrs.GT)
            and music == addrs.bossMusic
            and music_last ~= addrs.bossMusic then
                split()
                return
            end
        end
        -- finish
        if maptile == addrs.ganonRoom
        and triforce == addrs.fadeOut then
            split()
            state.started = false
            return
        end
    end
    -- Master Sword
    if  world == addrs.lightWorld
    and linkState == addrs.masterGet
    and linkState_last ~= addrs.masterGet then
        split()
        return
    end
    -- Agh 1 beaten on pyramid
    -- Agh 2 beaten
    if world == addrs.darkWorld
    and maptile == addrs.pyramid
    and linkState == addrs.swordUP
    and linkState_last ~= addrs.swordUP then
        split()
        return
    end
end

function checkStart()
    if gamemode == addrs.loadFile
    and gamemode_last == addrs.selectFile then
    -- and ((0xD0 & player1input) ~= 0
    -- or (0xC0 & player1inputcont) ~= 0) then
        split()
        state.started = true
        return
    end
end

function checkReset()
    if fileloaded ~= 0xFFFF
    and fileloaded_last == 0xFFFF then
        reset()
        state.started = false
        return
    end
end
