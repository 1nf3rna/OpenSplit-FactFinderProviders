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
    if level == 0xF
    and world == 0x5 then
        -- check final boss state
        if BossHP == 0x0
        and BossHP_last > 0
        and (shopPlayerID == 0x33
        or shopPlayerID == 0xEF) then
            split()
            return
        end
        --check 4-4 "finish" state
        if exitCount > 0
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
    and exitCount > 0
    and scoreScreen_last == 0x0
    and scoreScreen == 0x80 then
        -- check 5th shop
        if shopScreen_last == 0x0
        and shopScreen == 0x0A
        and shopPlayerID_last == 0x1D
        and shopPlayerID == 0x1D
        and levelComplete == 0x0 then
            split()
            return
        end
        -- check shop state
        if shopScreen_last == 0x0A
        and shopScreen == 0x80
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
        if levelComplete == 0x40
        and shopScreen_last == 0x0
        and shopScreen == 0x80 then
            split()
            return
        end
    end
end


function checkStart()
    if world == 0xFF
    and exitCount == 0x0
    and levelComplete == 0x0 then
        if shopScreen_last == 0x0
        and shopScreen == 0x80 then
            split()
            state.started = true
            return
        end
    end
end

function checkReset()
    if level == 0
    and world == 0 then
        reset()
        state.started = false
        return
    end
end
