if not cheat then cheat = {} end
require "prototypes.gui"
require "prototypes.functions"

script.on_event("cheat-menu", function(event)
  local player = game.players[event.player_index]
  if cheat.gui_is_open(player) then
    cheat.close_gui(player)
  else
    cheat.open_gui(player)
  end
end
)
