
local debug = false
local loaded = false
OnAnyLoad{function(triggerArgs)
  if not loaded and ModUtil ~= nil then
    debug = true
    loaded = true
  end
end}

OnControlPressed{ "MoveUp",
  function(triggerArgs)
    local ticks = 3
    while IsControlDown({ Name = "MoveUp" }) and IsControlDown({ Name = "MoveLeft" }) and IsControlDown({ Name = "MoveRight" }) and IsControlDown({ Name = "MoveDown" }) do
      if ticks <= 0 then
        if debug then
          ModUtil.Hades.PrintStack("You died.")
        end
        KillHero(CurrentRun.Hero, triggerArgs)
        return
      else
        if debug then
          ModUtil.Hades.PrintStack('Warning: You will die in '..ticks)
        end
        ticks = ticks - 1
      end
      wait(1)
    end
end}
