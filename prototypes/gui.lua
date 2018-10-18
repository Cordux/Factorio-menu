require "mod-gui"
local ui = nil;

function menuheader()
  local header = ui.add{
    type = "frame",
    name = "header",
    caption = "Cheat Menu",
    direction = "horizontal"
  }
  header.style.visible = true
  header.style.bottom_padding = 0
  header.style.title_bottom_padding = 0
end

function check()
  local checkFrame = ui.add{
    type = "frame",
    name = "checkboxes",
    direction = "horizontal"
  }
  local text = checkFrame.add{
    type = "label",
    caption = "Check this to enable cheatmode"
  }
  local check1 = checkFrame.add{
    type = "checkbox",
    state = false
  }
end

function timecontrol()
  local timeflow = ui.add{
    type = "frame",
  	name = "timeflow",
  	caption = "Time control",
  	direction = "horizontal"
  }
  timeflow.style.visible = true
  timeflow.style.title_bottom_padding = 0

  local btn_time_1 = timeflow.add {
  	type = "button",
  	name = "time_1",
  	tooltip = "",
  	caption = "1X",
  	style = "play_tutorial_button"
  }
  btn_time_1.style.minimal_height = 40

  local btn_time_2 = timeflow.add {
  	type = "button",
  	name = "time_2",
  	tooltip = "",
  	caption = "2X",
  	style = "play_tutorial_button"
  }
  btn_time_2.style.minimal_height = 40

  local btn_time_4 = timeflow.add {
  	type = "button",
  	name = "time_4",
  	tooltip = "",
  	caption = "4X",
  	style = "play_tutorial_button"
  }
  btn_time_4.style.minimal_height = 40

  local btn_time_8 = timeflow.add {
  	type = "button",
  	name = "time_8",
  	tooltip = "",
  	caption = "8X",
  	style = "play_tutorial_button"
  }
  btn_time_8.style.minimal_height = 40

  local btn_time_16 = timeflow.add {
  	type = "button",
  	name = "time_16",
  	tooltip = "",
  	caption = "16X",
  	style = "play_tutorial_button"
  }
  btn_time_16.style.minimal_height = 40

  local btn_time_32 = timeflow.add {
  	type = "button",
  	name = "time_32",
  	tooltip = "",
  	caption = "32X",
  	style = "play_tutorial_button"
  }
  btn_time_32.style.minimal_height = 40
end

function cheatcommands()
  local cheatcommands = ui.add{
    type = "frame",
    name = "uiFrame",
    direction = "horizontal"
  }
  local btn_god = cheatcommands.add {
    type = "button",
    name = "GodMode",
    caption = "GodMode",
    tooltip = "Toogle GodMode",
    style = "play_tutorial_button"
  }
  btn_god.style.minimal_height = 15
  btn_god.style.minimal_width = 15

  local btn_kill = cheatcommands.add {
    type = "button",
    name = "KillAll",
    caption = "Kill All!",
    tooltip = "Kill All Visible Enemies",
    style = "play_tutorial_button"
  }
  btn_kill.style.minimal_height = 15
  btn_kill.style.minimal_width = 15

  local btn_creative = cheatcommands.add{
    type = "button",
    name = "creativebtn",
    caption = "Creative mode",
    tooltip = "Start Creative mode A.k.a can make items without having the ingredients for it",
    style = "play_tutorial_button"
  }
  btn_creative.style.minimal_height = 15
  btn_creative.style.minimal_width = 15

  local dropdownTimer = cheatcommands.add{
    type = "drop-down",
    name = "DropTimer"
  }
end

function cheat.open_gui(player)
  if cheat.gui_is_open(player) then
    cheat.close_gui(player)
  end
  ui = player.gui.left.add({
    type = "table",
    name = "cheat_gui",
    caption = "Cheat Menu",
    direction = "vertical",
    column_count = 1
  })
  ui.style.horizontal_spacing = 0
  ui.style.vertical_spacing = 0

  local flow1 = ui.add({
    type = "flow",
    name = "flow1",
    direction = "horizontal"
  })
  menuheader()
  check()
  cheatcommands()
  timecontrol()
end
