require 'tty-prompt'
require 'tty-table'

class Character
  attr_reader :name, :race, :gender, :lvl, :hp, :max_hp, :mana, :max_mana, :stamina, :max_stamina, :ap, :max_ap, :attack,
              :defence

  def initialize(name, prompt)
    @prompt = prompt
    @name = name
  end

  def change_name
    puts "What would you like to change #{name}'s name to?"
    sleep(0.2)
    new_name = gets.chomp.capitalize
    @name = new_name
  end

  def set_race
    puts "What would you like to change #{name}'s race to?"
    sleep(0.2)
    race = gets.chomp.capitalize
    @race = race
  end

  def set_gender
    x = @prompt.select("What is #{name}'s Gender") do |menu|
      sleep(0.2)
      menu.choice 'Male'
      menu.choice 'Female'
      menu.choice 'Other'
    end
    @gender = x
  end

  def set_level
    puts "Enter #{name}'s Level: "
    sleep(0.2)
    x = gets.chomp
    lvl = x.to_i
    while lvl.zero?
      puts 'Invalid value, please enter a number: '
      sleep(0.2)
      x = gets.chomp
      lvl = x.to_i
    end
    @lvl = lvl
    puts "#{name}'s level is now #{@lvl}"
  end

  def set_hp
    puts "Enter #{name}'s HP: "
    sleep(0.2)
    x = gets.chomp
    hp = x.to_i
    while hp.zero?
      puts 'Invalid value, please enter a number: '
      sleep(0.2)
      x = gets.chomp
      hp = x.to_i
    end
    @max_hp = hp
    @hp = hp
    puts "#{name}'s HP is now #{@hp}"
  end

  def set_mana
    puts "Enter #{name}'s Mana: "
    sleep(0.2)
    x = gets.chomp
    mana = x.to_i
    while mana.zero?
      puts 'Invalid value, please enter a number: '
      sleep(0.2)
      x = gets.chomp
      mana = x.to_i
    end
    @max_mana = mana
    @mana = mana
    puts "#{name}'s Mana is now #{@mana}"
  end

  def set_stamina
    puts "Enter #{name}'s Stamina: "
    sleep(0.2)
    x = gets.chomp
    stamina = x.to_i
    while stamina.zero?
      puts 'Invalid value, please enter a number: '
      sleep(0.2)
      x = gets.chomp
      stamina = x.to_i
    end
    @max_stamina = stamina
    @stamina = stamina
    puts "#{name}'s Stamina is now #{@stamina}"
  end

  def set_ap
    puts "Enter #{name}'s AP: "
    sleep(0.2)
    x = gets.chomp
    ap = x.to_i
    while ap.zero?
      puts 'Invalid value, please enter a number: '
      sleep(0.2)
      x = gets.chomp
      ap = x.to_i
    end
    @max_ap = ap
    @ap = ap
    puts "#{name}'s AP is now #{@ap}"
  end

  def set_attack
    puts "Enter #{name}'s Attack: "
    sleep(0.2)
    x = gets.chomp
    attack = x.to_i
    while attack.zero?
      puts 'Invalid value, please enter a number: '
      sleep(0.2)
      x = gets.chomp
      attack = x.to_i
    end
    @attack = attack
    puts "#{name}'s Attack is now #{@attack}"
  end

  def set_defence
    puts "Enter #{name}'s Defence: "
    sleep(0.2)
    x = gets.chomp
    defence = x.to_i
    while defence.zero?
      puts 'Invalid value, please enter a number: '
      sleep(0.2)
      x = gets.chomp
      defence = x.to_i
    end
    @defence = defence
    puts "#{name}'s Defence is now #{@defence}"
  end

  def edit_options
    @y = @prompt.multi_select('What stats would you like to set? ', cycle: true, show_help: :always) do |menu|
      menu.enum '.'
      menu.choice 'Name', 1
      menu.choice 'Race', 2
      menu.choice 'Gender', 3
      menu.choice 'Level', 4
      menu.choice 'HP', 5
      menu.choice 'Mana', 6
      menu.choice 'Stamina', 7
      menu.choice 'Action Points', 8
      menu.choice 'Attack', 9
      menu.choice 'Defence', 10
    end
    change_name if @y.include? 1
    set_race if @y.include? 2
    set_gender if @y.include? 3
    set_level if @y.include? 4
    set_hp if @y.include? 5
    set_mana if @y.include? 6
    set_stamina if @y.include? 7
    set_ap if @y.include? 8
    set_attack if @y.include? 9
    set_defence if @y.include? 10
    @prompt.keypress('Press any key to continue...')
  end

  def view_stats
    puts name
    puts "#{gender} #{race}"
    table = TTY::Table.new do |t|
      t << ['Level:', lvl.to_s]
      t << ['HP:', "#{hp}/#{max_hp}"]
      t << ['Mana: ', "#{mana}/#{max_mana}"]
      t << ['Stamina: ', "#{stamina}/#{max_stamina}"]
      t << ['Action Points: ', "#{ap}/#{max_ap}"]
      t << ['Attack:', attack.to_s]
      t << ['Defence:', defence.to_s]
    end
    puts table.render(:unicode)
    @y = @prompt.select('Select an action: ', cycle: true, show_help: :always) do |menu|
      menu.enum '.'
      menu.choice 'Edit Character', 1
      menu.choice 'Go Back', 2
    end
    edit_options if @y == 1
  end
end
