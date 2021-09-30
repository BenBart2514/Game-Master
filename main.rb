require 'tty-prompt'
require_relative 'character_manager'

prompt = TTY::Prompt.new

puts 'Welcome to Game Master'
sleep(0.2)
prompt.keypress('Press any key to start...')

cm = CharacterManager.new(prompt)
main_menu = true
dhc_menu = false
drcf_menu = false

while main_menu == true
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
    drcf_menu = true
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

      puts 'This calculator only accepts whole numbers.'
      puts 'Decimals will not be rounded and any entry containing letters or special characters will default to 0.'
      prompt.keypress('Press any key to continue...')

      begin
        puts 'What is the starting value?'
        health = gets.chomp.to_i
        puts 'What is the damage ammount?'
        damage = gets.chomp.to_i
        puts 'How much damage will be reduced, if any?'
        armour = gets.chomp.to_i
        puts 'Does this character have any resistances? (Will be converted into a percentage)'
        resist = gets.chomp.to_i
        puts 'Does this character have any weaknesses? (Will be converted into a percentage)'
        weaker = gets.chomp.to_i
      rescue StandardError
        puts 'Something went wrong.'
        sleep(0.5)
        puts 'Returning to main menu...'
        sleep(2)
      end

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
      health = nil
      healing = nil
      red = nil
      amp = nil

      puts 'This calculator only accepts whole numbers'
      puts 'Decimals will not be rounded and any entry containing letters or special characters will default to 0.'
      prompt.keypress('Press any key to continue...')

      begin
        puts 'What is the starting value?'
        health = gets.chomp.to_i
        puts 'What is the healing ammount?'
        healing = gets.chomp.to_i
        puts 'How much, if any, should the healing be reduced? (Will be converted into a percentage)'
        red = gets.chomp.to_i
        puts 'How much, if any, should the healing be amplified? (Will be converted into a percentage)'
        amp = gets.chomp.to_i
      rescue StandardError
        puts 'Something went wrong.'
        sleep(0.5)
        puts 'Returning to main menu...'
        sleep(2)
      end

      reduction = healing * red / 100
      amplification = healing * amp / 100
      final_healing = healing - reduction + amplification
      final_value = health + final_healing

      puts "Starting Value: #{health}"
      puts "Total Damage:   #{final_healing}"
      puts "Final Value:    #{final_value}"
      prompt.keypress('Press any key to return to previous menu...')
      healing_calc = false
    end
  end

  while drcf_menu == true
    results = prompt.ask('How many results do you want? ')
    begin
      results = results.to_i
    rescue StandardError
      puts 'Invalid input, returning to main menu... '
      sleep(2)
      break
    end
    if results.zero?
      puts 'Invalid value, please enter a number greater than 0. '
      sleep(0.5)
      puts 'Returning to main menu...'
      sleep(2)
      break
    end
    max_result = prompt.ask("What is the highest result possible? Enter '2' for a coin flip. ")
    max_result = max_result.to_i
    if [1, 0].include?(max_result)
      puts 'Invalid maximum result, please enter a number greater than 1. '
      sleep(0.5)
      puts 'Returning to main menu...'
      sleep(2)
      break
    end
    case max_result
    when 2
      results.times do
        x = rand(2)
        if x == 1
          puts 'Heads'
        else
          puts 'Tails'
        end
      end
    else
      results.times do
        puts rand(1..max_result)
      end
    end
    prompt.keypress('Press any key to return to previous menu...')
    drcf_menu = false
  end
end
