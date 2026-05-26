addrs = {
    Start = 00,
    OldUnderpass = 01, -- Stage 2
    TunnelofIce = 02, -- Stage 2
    CorridorofDisorder = 03, -- Stage 3
    PathoftheCrystal = 04, -- Stage 3
    Ruins = 05, -- Stage 4 
    UndergroundStream = 06, -- Stage 4
    L_Graves = 07, -- Stage 5
    R_Graves = 08, -- Stage 6
    RoomofMagma = 09, -- Stage 7
    ForkBoss = 0a, -- Forks/Boss rooms
    Normal = 0x0, -- Game A
    Hard = 0x1, -- Game B
    NormalEnd = 0x4,
}

state = {
    started = false,
    level = 0x0,
    mode = 0x0,
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
    -- Stage 1
    if stage == addrs.OldUnderpass || stage == addrs.TunnelofIce then
        split()
        return
    end
    -- Stage 2
    if stage == addrs.CorridorofDisorder || stage == addrs.PathoftheCrystal then
        split()
        return
    end
    -- Stage 3
    if stage == addrs.Ruins || stage == addrs.UndergroundStream then
        split()
        return
    end
    -- Stage 4
    if stage == addrs.L_Graves then
        split()
        return
    end
    -- Stage 5
    if stage == addrs.R_Graves then
        split()
        return
    end
    -- Stage 6
    if stage ==addrs.RoomofMagma then
        split()
        return
    end
    -- Final Boss
    if mode == addrs.NormalEnd then
        split()
        return
    end
end


function checkStart()
    if stage == Start then
        split()
        state.started = true
    end
end

function checkReset()
    if level == 0 and world == 0 then
        reset()
        state.started = false
        return
    end
end

function updateState()
    state.level = level
    state.mode = mode
end