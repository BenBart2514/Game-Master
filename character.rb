require 'tty-prompt'
require 'tty-table'
require 'json'

class Character
  def initialize(name = 'Anonymous', prompt = nil)
    name(name)
    prompt(prompt)
  end

  def prompt(prompt = nil)
    @prompt = prompt unless prompt.nil?
    @prompt
  end

  def name(name = nil)
    @name = name unless name.nil?
    @name
  end

  def race(race = nil)
    @race = race unless race.nil?
    @race
  end

  def gender(gender = nil)
    @gender = gender unless gender.nil?
    @gender
  end

  def lvl(lvl = nil)
    @lvl = lvl unless lvl.nil?
    @lvl
  end

  def xp(xp = nil)
    @xp = xp unless xp.nil?
    @xp
  end

  def hp(hp = nil)
    @hp = hp unless hp.nil?
    @hp
  end

  def max_hp(max_hp = nil)
    @max_hp = max_hp unless max_hp.nil?
    @max_hp
  end

  def mana(mana = nil)
    @mana = mana unless mana.nil?
    @mana
  end

  def max_mana(max_mana = nil)
    @max_mana = max_mana unless max_mana.nil?
    @max_mana
  end

  def stamina(stamina = nil)
    @stamina = stamina unless stamina.nil?
    @stamina
  end

  def max_stamina(max_stamina = nil)
    @max_stamina = max_stamina unless max_stamina.nil?
    @max_stamina
  end

  def ap(ap = nil)
    @ap = ap unless ap.nil?
    @ap
  end

  def max_ap(max_ap = nil)
    @max_ap = max_ap unless max_ap.nil?
    @max_ap
  end

  def attack(attack = nil)
    @attack = attack unless attack.nil?
    @attack
  end

  def defence(defence = nil)
    @defence = defence unless defence.nil?
    @defence
  end

  def status(status = nil)
    @status ||= []
    @status << status unless status.nil?
    @status
  end

  def change_name
    puts "What would you like to change #{@name}'s name to?"
    sleep(0.2)
    new_name = gets.chomp.capitalize
    name(new_name)
    puts "Your character's name is now #{@name}"
    sleep(0.2)
  end

  def set_race
    puts "What would you like to change #{@name}'s race to?"
    sleep(0.2)
    race = gets.chomp.capitalize
    race(race)
    puts "#{@name}'s race is now #{@race}"
    sleep(0.2)
  end

  def set_gender
    x = @prompt.select("What is #{@name}'s Gender") do |menu|
      sleep(0.2)
      menu.choice 'Male'
      menu.choice 'Female'
      menu.choice 'Other'
    end
    gender(x)
    puts "#{@name}'s gender is now #{@gender}"
    sleep(0.2)
  end

  def set_level
    puts "Enter #{@name}'s Level: "
    sleep(0.2)
    x = gets.chomp
    lvl = x.to_i
    while lvl.zero?
      puts 'Invalid value, please enter a number that is not zero: '
      sleep(0.2)
      x = gets.chomp
      lvl = x.to_i
    end
    lvl(lvl)
    puts "Enter #{@name}'s' XP: "
    sleep(0.2)
    x = gets.chomp
    xp = x.to_i
    xp(xp)
    puts "#{@name}'s level is now #{@lvl} and their XP is #{@xp}"
    sleep(0.2)
  end

  def set_hp
    puts "Enter #{@name}'s max HP: "
    sleep(0.2)
    x = gets.chomp
    hp = x.to_i
    while hp.zero?
      puts 'Invalid value, please enter a number that is not zero: '
      sleep(0.2)
      x = gets.chomp
      hp = x.to_i
    end
    max_hp(hp)
    puts "Enter #{@name}'s current HP: "
    sleep(0.2)
    x = gets.chomp
    hp = x.to_i
    while hp > @max_hp
      puts "Invalid value, please enter a value not above #{max_hp}: "
      sleep(0.2)
      x = gets.chomp
      hp = x.to_i
    end
    hp(hp)
    puts "#{@name}'s HP is now #{@hp}/#{max_hp}"
  end

  def set_mana
    puts "Enter #{@name}'s max Mana: "
    sleep(0.2)
    x = gets.chomp
    mana = x.to_i
    while mana.zero?
      puts 'Invalid value, please enter a number that is not zero: '
      sleep(0.2)
      x = gets.chomp
      mana = x.to_i
    end
    max_mana(mana)
    puts "Enter #{@name}'s current Mana: "
    sleep(0.2)
    x = gets.chomp
    mana = x.to_i
    while mana > @max_mana
      puts "Invalid value, please enter a value not above #{max_mana}: "
      sleep(0.2)
      x = gets.chomp
      mana = x.to_i
    end
    mana(mana)
    puts "#{@name}'s Mana is now #{@mana}/#{max_mana}"
  end

  def set_stamina
    puts "Enter #{@name}'s max Stamina: "
    sleep(0.2)
    x = gets.chomp
    stamina = x.to_i
    while stamina.zero?
      puts 'Invalid value, please enter a number that is not zero: '
      sleep(0.2)
      x = gets.chomp
      stamina = x.to_i
    end
    max_stamina(stamina)
    puts "Enter #{@name}'s current Stamina: "
    sleep(0.2)
    x = gets.chomp
    stamina = x.to_i
    while stamina > @max_stamina
      puts "Invalid value, please enter a value not above #{max_stamina}: "
      sleep(0.2)
      x = gets.chomp
      stamina = x.to_i
    end
    stamina(stamina)
    puts "#{@name}'s Stamina is now #{@stamina}/#{max_stamina}"
  end

  def set_ap
    puts "Enter #{@name}'s max AP: "
    sleep(0.2)
    x = gets.chomp
    ap = x.to_i
    while ap.zero?
      puts 'Invalid value, please enter a number that is not zero: '
      sleep(0.2)
      x = gets.chomp
      ap = x.to_i
    end
    max_ap(ap)
    puts "Enter #{@name}'s current AP: "
    sleep(0.2)
    x = gets.chomp
    ap = x.to_i
    while ap > @max_ap
      puts "Invalid value, please enter a value not above #{max_ap}"
      sleep(0.2)
      x = gets.chomp
      ap = x.to_i
    end
    ap(ap)
    puts "#{@name}'s AP is now #{@ap}/#{max_ap}"
  end

  def set_attack
    puts "Enter #{@name}'s Attack: "
    sleep(0.2)
    x = gets.chomp
    attack = x.to_i
    while attack.zero?
      puts 'Invalid value, please enter a number that is not zero: '
      sleep(0.2)
      x = gets.chomp
      attack = x.to_i
    end
    attack(attack)
    puts "#{@name}'s Attack is now #{@attack}"
  end

  def set_defence
    puts "Enter #{@name}'s Defence: "
    sleep(0.2)
    x = gets.chomp
    defence = x.to_i
    while defence.zero?
      puts 'Invalid value, please enter a number that is not zero: '
      sleep(0.2)
      x = gets.chomp
      defence = x.to_i
    end
    defence(defence)
    puts "#{@name}'s Defence is now #{@defence}"
  end

  def edit_options
    sleep(0.2)
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
    sleep(0.5)
    @prompt.keypress('Press any key to continue...')
  end

  def set_status
    sleep(0.2)
    @y = @prompt.select('Would you like add or remove status effects? ', cycle: true, show_help: :always) do |menu|
      menu.enum '.'
      menu.choice 'Add', 1
      menu.choice 'Remove', 2
      menu.choice 'Go Back', 3
    end
    case @y
    when 1
      add_status
    when 2
      remove_status
    end
  end

  def add_status
    effect = @prompt.ask('What status effect is active on this character? ')
    status(effect)
  end

  def remove_status
    choice = @prompt.multi_select('What status effect(s) would you like to remove? ', @status, cycle: true,
                                                                                               show_help: :always,
                                                                                               filter: true)
    choice.each do |x|
      @status.delete(x)
    end
  end

  def view_stats
    puts @name
    puts "#{@gender} #{@race}" unless @gender.nil? && @race.nil?
    unless hp.nil?
      if @hp.zero?
        puts 'Status: Dead'
      elsif status.empty?
        puts 'Status: Alive'
      else
        puts "Status: Alive, #{@status}"
      end
    end
    table = TTY::Table.new do |t|
      t << ['Level:', @lvl.to_s]
      t << ['XP:', @xp.to_s]
      t << ['HP:', "#{@hp}/#{@max_hp}"]
      t << ['Mana: ', "#{@mana}/#{@max_mana}"]
      t << ['Stamina: ', "#{@stamina}/#{@max_stamina}"]
      t << ['Action Points: ', "#{@ap}/#{@max_ap}"]
      t << ['Attack:', @attack.to_s]
      t << ['Defence:', @defence.to_s]
    end
    puts table.render(:unicode)
    @y = @prompt.select('Select an action: ', cycle: true, show_help: :always) do |menu|
      menu.enum '.'
      menu.choice 'Edit Character', 1
      menu.choice 'Set Status', 2
      menu.choice 'Go Back', 3
    end
    case @y
    when 1
      edit_options
      system 'clear'
      view_stats
    when 2
      set_status
      system 'clear'
      view_stats
    end
  end

  def to_s
    json_status = @status unless @status.nil?
    JSON.generate({
                    name: @name,
                    gender: @gender,
                    race: @race,
                    lvl: @lvl,
                    xp: @xp,
                    hp: @hp,
                    max_hp: @max_hp,
                    mana: @mana,
                    max_mana: @max_mana,
                    stamina: @stamina,
                    max_stamina: @max_stamina,
                    ap: @ap,
                    max_ap: @max_ap,
                    attack: @attack,
                    defence: @defence,
                    status: json_status
                  })
    # puts attributes
  end

  def hydrate(headers, _data)
    headers.each do |header|
      header_index = headers.index(header)

      # @race = race
    end
  end
end
