addrs = {
    start = 0x0,
    RagnaroksCanyon = 0x1,
    WookieHole = 0x2,
    TurboTunnel = 0x3,
    ArcticCaverns = 0x4,
    SurfCity = 0x5,
    KarnathsLair = 0x6,
    VolkmiresInferno = 0x7,
    IntruderExcluder = 0x8,
    TerraTubes = 0x9,
    RatRace = 0xA,
    ClingerWinger = 0xB,
    TheRevolution = 0xC,
    QueenRoom = 0xD,
    Cutscene = 0xFF,
    QueenDead = 0x5,
    QueenAlive = 0x0,
}

state = {
    started = false,
    currentLevel = 0,
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
    if level == addrs.QueenRoom
    and qdead == addrs.QueenDead
    and qdead_last == addrs.QueenAlive then
        split()
        state.started = false
        return
    end
    if level_last == addrs.Cutscene
    and (level == addrs.TurboTunnel
    or level == addrs.ArcticCaverns
    or level == addrs.KarnathsLair
    or level == addrs.IntruderExcluder
    or level == addrs.TerraTubes
    or level == addrs.RatRace
    or level == addrs.ClingerWinger
    or level == addrs.TheRevolution
    or level == addrs.QueenRoom) then
        split()

        return
    end
end

function checkStart()
    if level == addrs.RagnaroksCanyon
    and level_last == addrs.start
    and player2 > 0 then
        split()
        state.started = true
    end
end

function checkReset()
    if level == addrs.start
    and level_last ~= addrs.start then
        reset()
        state.started = false
        return
    end
end

function updateState()
    state.currentLevel = level
end