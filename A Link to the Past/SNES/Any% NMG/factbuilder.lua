addrs = {
    selectFile = 0x01,
    loadFile = 0x05,
    inDungeon = 0x7,
    triforceRoom = 0x19,
    transition = 0xF, --room to overworld
    dungeon = 0xA,
    lightWorld = 0x1,
    darkWorld = 0xB,
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
    overworld = 0xFF,
    pyramid = 0x20,
    pyramidOpen = 0xD,
    bossMusic = 0x15,
    -- triforceMusic = 0xF1,
    -- fadeOut = 0x93,
    ganonRoom = 0x0,
    sancDoor = 0x12,
    door = 0x3E2,
    hole = 0x65C,
    default = 0x0,
    flying = 0x1D,
    running = 0xFFFF,
}

state = {
    started = false,
    escape = false,
    completeDungeons = 0,
    masterSword = false,
    aga1Dead = false,
    aga2Dead = false,
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
            state.escape = true
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
                state.completeDungeons = state.completeDungeons + 1
                return
            end
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
        -- finish
        if maptile == addrs.ganonRoom
            and gamemode == addrs.triforceRoom
            and gamemode_last == addrs.inDungeon then
            split()
            state.ganon_dead = true
            state.started = false
            return
        end
    end
    -- Master Sword
    if world == addrs.lightWorld
        and linkState == addrs.masterGet
        and linkState_last ~= addrs.masterGet then
        split()
        state.masterSword = true
        return
    end
    if world == addrs.darkWorld
        and mapID == addrs.overworld
        and (maptile == addrs.pyramid
            or maptile == addrs.pyramidOpen) then
        -- Agh 1 beaten on pyramid
        if linkState == addrs.swordUP
            and linkState_last ~= addrs.swordUP then
            split()
            state.aga1Dead = true
            return
        end
        -- Agh 2 beaten
        if linkState == addrs.default
            and linkState_last == addrs.flying then
            split()
            state.aga2Dead = true
            return
        end
    end
end

function checkStart()
    if gamemode == addrs.loadFile
        and gamemode_last == addrs.selectFile then
        split()
        state.started = true
        return
    end
end

function checkReset()
    if fileLoaded ~= addrs.running
        and fileLoaded_last == addrs.running then
        reset()
        state.started = false
        state.escape = false
        state.completeDungeons = 0
        state.masterSword = false
        state.collectionComplete = false
        state.aga1Dead = false
        state.aga2Dead = false
        state.ganon_dead = false
        return
    end
end
