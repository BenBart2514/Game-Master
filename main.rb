require 'tty-prompt'
require_relative 'character_manager'
require_relative 'damage_healing_calc'

prompt = TTY::Prompt.new

puts 'Welcome to Game Master'
sleep(0.2)
prompt.keypress('Press any key to start...')

cm = CharacterManager.new(prompt)
main_menu = true
dhc_menu = false
# drcf_menu = false

while main_menu == true && dhc_menu == false
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
    cm.cm_menu
  when 2
    dhc_menu = true
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

  while dhc_menu == true
    sleep(0.2)
    system 'clear'
    @y = prompt.select('Damage/Healing Calculator', cycle: true, show_help: :always) do |menu|
      menu.enum '.'
      menu.choice 'Damage Calculator', 1
      menu.choice 'Healing Calculator', 2
      menu.choice 'Help', 3
      menu.choice 'Go Back', 4
      menu.choice 'Exit', 5
    end

    exit if @y == 5
    case @y
    when 1
      damage_calc = true
    when 2
      healing_calc = true
    when 3
      # display help document
      puts 'Help is on the way!'
      sleep(0.5)
      puts '(Coming soon...)'
      sleep(1)
      prompt.keypress('Press any key to return to previous menu...')
    when 4
      dhc_menu = false
    end

    while damage_calc == true
      health = nil
      damage = nil
      armour = nil
      resist = nil
      weaker = nil

      puts 'What is the starting value?'
      health = gets.chomp.to_i
      puts 'What is the damage ammount?'
      damage = gets.chomp.to_i
      puts 'How much damage will be reduced, if any? (Whole Values ONLY)'
      armour = gets.chomp.to_i
      puts 'Does this character have any resistances? (Percentages ONLY)'
      resist = gets.chomp.to_i
      puts 'Does this character have any weaknesses? (Percentages ONLY)'
      weaker = gets.chomp.to_i

      initial_damage = damage - armour
      reduced_damage = damage * resist / 100
      increased_damage = damage * weaker / 100
      final_damage = initial_damage - reduced_damage + increased_damage
      final_value = health - final_damage

      puts "Starting Value: #{health}"
      puts "Total Damage:   #{final_damage}"
      puts "Final Value:    #{final_value}"
      prompt.keypress('Press any key to return to previous menu...')
      damage_calc = false
    end

    while healing_calc == true
      puts 'Healing Calculator not complete...'
      prompt.keypress('Press any key to return to previous menu...')
      healing_calc = false
    end
  end
end
