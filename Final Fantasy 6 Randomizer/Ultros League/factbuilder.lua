state = {
  started   = false,
  espers = 0,
  characters = 0,
  go_mode   = false,
  kefka_dead = false,
}

function onTick()
    state.characters = characters
    state.espers = espers
    
  if not state.started and mapid == 36 then
    state.started = true
    split()
  end

  if not state.go_mode then
    if characters >= 6 and espers >= 9 then
      state.go_mode = true
      split()
    end
  end

  if battleidx == 514 and sfx == 227 and not state.kefka_dead then
    state.kefka_dead = true
    split()
  end
end