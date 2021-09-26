require 'tty-prompt'

prompt = TTY::Prompt.new

class Character
  attr_reader :name, :race, :gender, :hp, :max_hp, :mana, :max_mana, :stamina, :max_stamina, :ap, :max_ap, :attack, :defence

  def initialize(name)
    @name = name
  end

  def change_name
    puts "What would you like to change #{name}'s name to?"
    new_name = gets.chomp.capitalize
    @name = new_name
  end

  def set_race
    puts "What would you like to change #{name}'s race to?"
    race = gets.chomp.capitalize
    @race = race
  end

  def set_gender
    @y = prompt.select("What is #{name}'s Gender") do |menu|
      menu.choice 'Male'
      menu.choice 'Female'
      menu.choice 'Other'
    end
    @gender = @y
  end

  def set_level
    puts "Enter #{name}'s Level: "
    lvl = gets.chomp.to_i
    @lvl = lvl
  end

  def set_hp
    puts "Enter #{name}'s HP: "
    hp = gets.chomp.to_i
    @max_hp = hp
    @hp = hp
  end

  def set_mana
    puts "Enter #{name}'s Mana: "
    mana = gets.chomp.to_i
    @max_mana = mana
    @mana = mana
  end

  def set_stamina
    puts "Enter #{name}'s Stamina: "
    stamina = gets.chomp.to_i
    @max_stamina = stamina
    @stamina = stamina
  end

  def set_ap
    puts "Enter #{name}'s AP: "
    ap = gets.chomp.to_i
    @max_ap = ap
    @ap = ap
  end

  def set_attack
    puts "Enter #{name}'s Attack: "
    attack = gets.chomp.to_i
    @attack = attack
  end

  def set_defence
    puts "Enter #{name}'s Defence: "
    defence = gets.chomp.to_i
    @defence = defence
  end

  def edit_options
    @y = prompt.select('What would you like to edit? ', cycle: true, show_help: :always) do |menu|
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
    change_name if @y == 1
    set_race if @y == 2
    set_gender if @y == 3
    set_level if @y == 4
    set_hp if @y == 5
    set_mana if @y == 6
    set_stamina if @y == 7
    set_ap if @y == 8
    set_attack if @y == 9
    set_defence if @y == 10
  end
end
