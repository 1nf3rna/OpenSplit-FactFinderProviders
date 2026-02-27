function onTick()
    checkStart()
    -- checkReset()
    checkStage()
end

function checkStage()
    if triforce == 0x93 then
        split()
        return
    end
end

function checkStart()
    if gamemode == 0x05
    gamemode_last == 0x01
    and ((0xD0 & player1input) ~= 0
    or (0xC0 & player1inputcont) ~= 0) then
        split()
        return
    end
end

-- function checkReset()
--     if level == 0 and world == 0 then
--         reset()
--         return
--     end
-- end
