require 'tty-prompt'
require_relative 'character_manager'

prompt = TTY::Prompt.new

main_select = prompt.select('Main Menu', cycle: true, show_help: :always) do |menu|
  menu.enum '.'

  menu.choice 'Charcter Manager', 1
  menu.choice 'Damage/Healing Calculator', 2
  menu.choice 'Dice Roller, Coin Flipper', 3
  menu.choice 'Help', 4
  menu.choice 'Exit', 5
end
exit if main_select == 5
if main_select == 1
  character = CharacterManager.new(prompt)
  y = character.cm_menu
end
