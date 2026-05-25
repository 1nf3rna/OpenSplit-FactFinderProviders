addrs = {
    DinoSafari = 0x0,
    TempleOfTools = 0x1,
    MonsterTheater = 0x2,
    LostOnMars = 0x3,
    Stage1 = 0x0,
    Stage2 = 0x1,
    Stage3 = 0x2,
    Stage4 = 0x3,
    BossStage = 0x4,
    Dead = 0x0,
    Alive = 0x1,
    Tool = 0x4,
    Win = 0x6,
    BonusCountdown = 0xD8,
    Opening1 = 0xC0,
    Opening2 = 0xD0,
    ToolScene = 0xC8,
    InStage = 0x0,
    Menus = 0x11,
    Gamplay = 0x13,
    NoWeap = 0xFE,
    NailGun = 0x0,
    Welder = 0x2,
    Flame = 0x4,
    Chain = 0x6,
    Dynamite = 0x8,
    Active = 0x13,
    InActive = 0x11,
}

state = {
    started = false,
    stage = 0x0,
    substage = 0x0,
    crates = 0x0,
    game_state = 0x0,
    play_state = 0x0,
    scene = 0x0,
    scene2 = 0x0,
    gameplay = 0x0,
    BossHP = 0x0,
    W2P1HP = 0x0,
    FBossHP = 0x0
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
    state.stage = stage
    state.substage = substage
    state.crates = crates
    state.game_state = game_state
    state.play_state = play_state
    state.scene = scene
    state.scene2 = scene2
    state.gameplay = gameplay
    state.BossHP = BossHP
    state.W2P1HP = W2P1HP
    state.FBossHP = FBossHP


    if game_state_last == addrs.ToolScene
    and game_state == addrs.InStage
    and gameplay == addrs.Active then
        if stage == addrs.DinoSafari
        and substage == addrs.BossStage then
            if BossHP == 0x0 then 
                split()
            	return
            end
    	end

        if stage == addrs.TempleOfTools
        and substage == addrs.BossStage then
            if W2P1HP == 0x0 then
                split()
            	return
            end
        end

        if stage == addrs.MonsterTheater
        and substage == addrs.BossStage then
            if crates == 0x7 then 
                split()
            	return
            end
        end

        if stage == addrs.LostOnMars
        and substage == addrs.BossStage then
            if FBossHP == 0x0 then
                split()
                state.started = false
            	return
            end
        end

        split()
    end
end


function checkStart()
    state.stage = stage
    state.substage = substage
    state.crates = crates
    state.game_state = game_state
    state.play_state = play_state
    state.scene = scene
    state.scene2 = scene2
    state.gameplay = gameplay
    state.BossHP = BossHP
    state.W2P1HP = W2P1HP
    state.FBossHP = FBossHP

    if game_state_last == addrs.Opening1
    or game_state_last == addrs.Opening2 then
        if game_state == 0x0
        and stage == addrs.DinoSafari
        and substage == addrs.Stage1
        and gameplay == addrs.InActive
        and play_state == addrs.Dead then
            split()
            state.started = true
        end
    end
end

function checkReset()
    state.stage = stage
    state.substage = substage
    state.crates = crates
    state.game_state = game_state
    state.play_state = play_state
    state.scene = scene
    state.scene2 = scene2
    state.gameplay = gameplay
    state.BossHP = BossHP
    state.W2P1HP = W2P1HP
    state.FBossHP = FBossHP

    if game_state_last == addrs.Opening2
    and game_state == 0x0
    and gameplay_last == addrs.InActive
    and gameplay == 0x0 then
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

    if gameplay_last == addrs.Active
    and gameplay == 0x0
    and crates == 0x0
    and substage == addrs.Stage1
    and stage == addrs.DinoSafari then
        reset()
        state.started = false
        return
    end
end
