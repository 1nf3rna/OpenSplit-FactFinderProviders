addrs = {
    TheBeginning = 0x0,
    MudRivers = 0x1,
    Rings = 0x2,
    TheRockies = 0x3,
    Maze = 0x4,
    Traps = 0x5,
    Steam = 0x6,
    Quarters = 0x7,
    ThePits = 0x8,
    Confusion = 0x9,
    Reverse = 0xA,
    WayOut = 0xB,
    Sewers = 0xC,
    PumpRoom = 0xD,
    HallOfMachines = 0xE,
    TimeForChaos = 0xF,
    Start = 0xFF,
    Forest = 0x1,
    Workshops = 0x2,
    Mansion = 0x3,
    Cellars = 0x4,
    Chaos = 0x5,
    Complete = 0x40,
    Score = 0x80,
    DuringShop = 0x80,
    BeforeShop = 0xA,
}

state = {
    started = false,
    level = 0x0,
    world = 0x0,
    player1input = 0x0,
    player2input = 0x0,
    BossHP = 0x0,
    exitCount = 0x0,
    levelComplete = 0x0,
    scoreScreen = 0x0,
    shopPlayerID = 0x0,
    shopScreen = 0x0,
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
    if level == addrs.TimeForChaos
    and world == addrs.Chaos then
        -- check final boss state
        if BossHP == 0x0
        and BossHP_last > 0x0 then
            if shopPlayerID == 0x33 then
                split()
                return
            end
            if shopPlayerID == 0xEF then
                split()
                state.started = false
                return
            end
        end
        --check 4-4 "finish" state
        if exitCount > 0x0
        and (player1input_last == 0x0
        or player2input_last == 0x0)
        and shopScreen_last == 0x78
        and shopScreen == 0x08 then
            split()
            return
        end
    end
    -- check level finish state
    if (player1input > 0x0
    or player2input > 0x0)
    and exitCount > 0x0
    and scoreScreen_last == 0x0
    and scoreScreen == addrs.Score then
        -- check 5th shop
        if shopScreen_last == 0x0
        and shopScreen == addrs.BeforeShop
        and shopPlayerID_last == 0x1D
        and shopPlayerID == 0x1D
        and levelComplete == 0x0 then
            split()
            return
        end
        -- check shop state
        if shopScreen_last == addrs.BeforeShop
        and shopScreen == addrs.DuringShop
        and ((shopPlayerID_last == 0x23
        and shopPlayerID == 0x24)
        or (shopPlayerID_last == 0x17
        and shopPlayerID == 0x18)
        or (shopPlayerID_last == 0x26
        and shopPlayerID == 0x27)
        or (shopPlayerID_last == 0x34
        and shopPlayerID == 0x35)
        or (shopPlayerID_last == 0x1A
        and shopPlayerID == 0x1B)
        or (shopPlayerID_last == 0x30
        and shopPlayerID == 0x31))
        and levelComplete == 0x0 then
            split()
            return
        end
        -- check main levels state
        if levelComplete == addrs.Complete
        and shopScreen_last == 0x0
        and shopScreen == addrs.DuringShop then
            split()
            return
        end
    end
end


function checkStart()
    if world == addrs.Start
    and exitCount == 0x0
    and levelComplete == 0x0 then
        if shopScreen_last == 0x0
        and shopScreen == addrs.DuringShop then
            split()
            state.started = true
            return
        end
    end
end

function checkReset()
    if level == addrs.TheBeginning
    and world == 0x0 then
        reset()
        state.started = false
        return
    end
end
