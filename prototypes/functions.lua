function cheat.close_gui(player)
  player.gui.left.cheat_gui.destroy()
end

function cheat.gui_is_open(player)
  if player.gui.left.cheat_gui then
    return true
  else
    return false
  end
end

-- Button functions
-- Become God when pressing the God Mode
function become_god(player)
    if player.character == nil then return end
    local inventories = {
        defines.inventory.player_quickbar,
        defines.inventory.player_main,
        defines.inventory.player_guns,
        defines.inventory.player_ammo,
        defines.inventory.player_armor,
        defines.inventory.player_tools,
        defines.inventory.player_vehicle,
        defines.inventory.player_trash
    }
    local playerCharacter = player.character

    player.character = nil
    for _, inv in pairs(inventories) do
        transferInventory(playerCharacter, player, inv)
    end
    playerCharacter.destroy()
end
-- Become Mortal when pressing God Mode again
function become_mortal(player)
    local position = player.position
    if player.character == nil then
        player.create_character()
        player.teleport(position)
    end
end

function kill_enemies(player)
    for key, entity in pairs(player.surface.find_entities_filtered({ force = "enemy" })) do
        entity.destroy()
    end
end

-- Transfer all items from one inventory to the other
function transferInventory(origin, destination, inventory)
    if origin.get_inventory(inventory) == nil then return end
    for i, v in pairs(origin.get_inventory(inventory).get_contents()) do
        destination.insert({ name = i, count = v })
        origin.remove_item({ name = i, count = v })
    end
end

script.on_event(defines.events.on_gui_click, function(event)
  local player = game.players[event.player_index]
  local gui = game.players[event.player_index].gui.left
  local element = event.element

  local parent = element.parent.name;

  if element.parent and ( parent == "cheatcommands" or parent == "timeflow" or parent == "uiFrame" ) and ( element.type == "sprite-button" or element.type == "button" ) then
    local btn_name = element.name
    -- Toggle Godmode
    if btn_name == "GodMode" then
      if player.character == nil then
        become_mortal(player)
        game.print("You became Mortal!")
      else
        become_god(player)
        game.print("You became a God!")
    end
      -- Kill All visible enemies
    elseif btn_name == "KillAll" then
      kill_enemies(player)
    end
    elseif ( btn_name == "time_1" ) then
			game.speed=1;
		elseif ( btn_name == "time_2" ) then
			game.speed=2;
		elseif ( btn_name == "time_4" ) then
			game.speed=4;
		elseif ( btn_name == "time_8" ) then
			game.speed=8;
		elseif ( btn_name == "time_16" ) then
			game.speed=16;
		elseif ( btn_name == "time_32" ) then
			game.speed=32;
    elseif (btn_name == "creativebtn") then
        game.print("CHEATER!")
    end
  end)
  -- end of buttons
  function table.contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end
