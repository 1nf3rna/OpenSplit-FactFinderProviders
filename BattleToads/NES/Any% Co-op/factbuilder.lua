function onTick()
    checkStart()
    checkReset()
    checkStage()
end

function checkStage()
    if level == 0xD
    and qdead == 0x5
    and qdead_last == 0x0 then
        split()
        return
    end
    if level_last == 0xFF
    and (level == 0x3
    or level == 0x5
    or level == 0x6
    or level == 0x8
    or level == 0x9
    or level == 0xA
    or level == 0xB
    or level == 0xC
    or level == 0xD) then
        split()
        return
    end
end


function checkStart()
    if level == 0x1
    and level_last == 0x0
    and player2 > 0 then
        split()
    end
end

function checkReset()
    if level == 0
    and level_last != 0 then
        reset()
        return
    end
end
