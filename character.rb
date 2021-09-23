class Character
  attr_reader :name, :race, :hp, :max_hp, :mana, :max_mana, :stamina, :max_stamina, :ap, :max_ap, :attack, :defence

  @@characters = []
  @@character_count = @@characters.length

  def initialize(name, race = 'Human')
    @name = name.capitalize
    @race = race.capitalize
    @@characters << self
  end

  def change_name
    puts "What would you like to change #{name}'s name to?"
    new_name = gets.chomp.capitalize
    @name = new_name
  end

  def change_race
    puts "What would you like to change #{name}'s race to?"
    new_race = gets.chomp.capitalize
    @race = new_race
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
end
