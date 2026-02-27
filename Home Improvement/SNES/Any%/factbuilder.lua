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
    if state_last == 200
    and state == 0
    and gameplay == 19 then
        if stage == 0
        and substage == 4 then
            if BossHP == 0 then 
                split()
            	return
            end
    	end

        if stage == 1
        and substage == 4 then
            if W2P1HP == 0 then
                split()
            	return
            end
        end

        if stage == 2
        and substage == 4 then
            if crates == 7 then 
                split()
            	return
            end
        end

        if stage == 3
        and substage == 4 then
            if FBossHP == 0 then
                split()
                state.started = false
            	return
            end
        end

        split()
    end
end


function checkStart()
    if state_last == 192
    or state_last == 208 then
        if state == 0
        and stage == 0
        and substage == 0
        and gameplay == 17
        and play_state == 0 then
            split()
            state.started = true
        end
    end
end

function checkReset()
    if state_last == 208
    and state == 0
    and gameplay_last == 17
    and gameplay == 0 then
        reset()
        state.started = false
        return
    end

    --[[
    if gameplay_last == 17 
        and gameplay == 0
        and scene_last == 4
        and scene == 0
        and scene2_last == 3
        and scene2 ==0 then
        reset()
        return
    end
    --]]

    if gameplay_last == 19
    and gameplay == 0
    and crates == 0
    and substage == 0
    and stage == 0 then
        reset()
        state.started = false
        return
    end
end
