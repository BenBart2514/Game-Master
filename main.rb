require 'tty-prompt'
require_relative 'character_manager'

prompt = TTY::Prompt.new

puts 'Welcome to Game Master'
sleep(0.5)
prompt.keypress('Press any key to start...')

x = 0

while x.zero?
  sleep(0.2)
  system 'clear'
  main_select = prompt.select('Main Menu', cycle: true, show_help: :always) do |menu|
    menu.enum '.'

    menu.choice 'Charcter Manager', 1
    menu.choice 'Damage/Healing Calculator', 2
    menu.choice 'Dice Roller, Coin Flipper', 3
    menu.choice 'Help', 4
    menu.choice 'Exit', 5
  end
  exit if main_select == 5
  case main_select
  when 1
    character = CharacterManager.new(prompt)
    character.cm_menu
  when 2
    puts 'DHC under construction'
    sleep(1)
    prompt.keypress('Press any key to return to previous menu...')
  when 3
    puts 'DRCF under construction'
    sleep(1)
    prompt.keypress('Press any key to return to previous menu...')
  when 4
    puts 'Help is on the way!'
    sleep(0.5)
    puts '(Coming soon...)'
    sleep(1)
    prompt.keypress('Press any key to return to previous menu...')
  end
end
