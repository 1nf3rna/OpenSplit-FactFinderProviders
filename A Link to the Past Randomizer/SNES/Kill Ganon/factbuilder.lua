addrs = {
    selectFile = 0x01,
    loadFile = 0x05,
    inDungeon = 0x7,
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
    fadeOut = 0x93,
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
    -- if state.started then
    --     checkReset()
    -- end
    checkStage()
end

function checkStage()
    if maptile == addrs.ganonRoom
    and triforce == addrs.fadeOut then
        split()
        state.started = false
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

-- function checkReset()
--     if fileloaded ~= running
--     and fileloaded_last == running then
--         reset()
--         state.started = false
--         return
--     end
-- end
