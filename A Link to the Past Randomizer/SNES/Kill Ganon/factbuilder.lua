function onTick()
    checkStart()
    -- checkReset()
    checkStage()
end

function checkStage()
    if triforce == 0x93 then
        split()
    end
end


function checkStart()
    if fileSelect == 0x05
    fileSelect_last == 0x01
    and (0x80 & player1input) ~= 0 then
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
