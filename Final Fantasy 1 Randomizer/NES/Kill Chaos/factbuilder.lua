addrs = {
    mainMenu = 0x255,
    outOfBattle = 0x61,
    leavingBattle = 0x63,
    inBattle = 0x68,
    noBattle = 0xFF,
    chaosFloor = 0x59,
    chaosFight = 0x7B,
    inBattleMusic = 0x50,
    victoryMusic = 0x53,
}

state = {
    started = false,
    Input = 0x0,
    mapID = addrs.mainMenu,
    battleStatus = addrs.leavingBattle,
    enemyGroup = 0x0,
    music = 0x0,
}

function onTick()
    updateState()
    if not state.started then
        checkStart()
    else -- state.started
        -- checkReset()
        checkStage()
    end
end

function checkStage()
    -- lute gotten, princess saved, in coneria castle
    -- ship gotten, in pravoka, bikke dead
    -- crown gotten, in marsh
    -- astos dead, in NW castle, got crystal
    -- herb gotten, in matoya cave
    -- tnt turned in, in dawrf cave, elf prince awake
    -- ruby gotten, vamp dead, in earth cave
    -- rod gotten, in sarda cave
    -- lich dead, in earth cave
    -- canoe gotten, in cresent lake
    -- floater gotten, in ice cave
    -- tail gotten, in ordeals
    -- kary dead, in volcano
    -- got oxyale, in gaia
    -- got slab, in sea shrine
    -- kraken dead, in sea
    -- cube gotten, in waterfall
    -- chime gotten, in lefein
    -- tiamat dead, in sky palace
    -- lich 2 dead, in ToFR
    -- solo large chaos dead
    if mapID == addrs.chaosFloor
    and enemyGroup == addrs.chaosFight
    and battleMusic == addrs.victoryMusic 
    and battleMusic_last == addrs.inBattleMusic then
        state.started = false
    end
end


function checkStart()
    -- start timer
    -- 13 frames after pressing start or A overworld starts to load
    -- all characters named, in menu, start or a pressed
    if mapID == addrs.mainMenu
    and battleStatus == addrs.outOfBattle
    and battleStatus_last == addrs.noBattle
    and (playerInput == (playerInput_last + 80) -- Start pressed
    or playerInput == (playerInput_last + 10)) then -- A pressed
        state.started = true
    end
end

-- function checkReset()
--   state.started = false
-- end

function updateState()
    state.Input = playerInput
    state.mapID = mapID
    state.battleStatus = battleStatus
    state.enemyGroup = enemyGroup
    state.music = battleMusic
end