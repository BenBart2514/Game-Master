require 'json'
require 'tty-prompt'
require_relative 'character'

class CharacterManager
  attr_accessor :characters

  def initialize(prompt)
    @prompt = prompt
    @characters = []
  end

  def cm_menu
    sleep(0.2)
    system 'clear'
    @y = if @characters.length.zero?
           @prompt.select('Character Manager', cycle: true, show_help: :always, per_page: 8) do |menu|
             menu.enum '.'
             menu.choice 'New Character', 1
             menu.choice 'Edit Character', 2, disabled: '        (No characters)'
             menu.choice 'List Characters', 3, disabled: '       (No characters)'
             menu.choice 'Export Character(s)', 4, disabled: '   (No characters)'
             menu.choice 'Import Character(s)', 5
             menu.choice 'Help', 6
             menu.choice 'Go Back', 7
             menu.choice 'Exit', 8
           end
         else
           @prompt.select('Character Manager', cycle: true, show_help: :always, per_page: 8) do |menu|
             menu.enum '.'
             menu.choice 'New Character', 1
             menu.choice 'Edit Character', 2
             menu.choice 'List Characters', 3
             menu.choice 'Export Character(s)', 4
             menu.choice 'Import Character(s)', 5
             menu.choice 'Help', 6
             menu.choice 'Go Back', 7
             menu.choice 'Exit', 8
           end
         end

    exit if @y == 8

    case @y
    when 1
      prompt_name
      @characters << Character.new(@name, @prompt)
      @current_character = @characters.last
      puts "#{@current_character.name} has been created!"
      @prompt.keypress('Press any key to continue...')
      @current_character.edit_options
      cm_menu
    when 2
      sleep(0.2)
      choices = []
      @characters.each_with_index { |char, index| choices.push({ name: char.name, value: index }) }
      choice = @prompt.select('Choose a character to edit: ', choices, cycle: true, show_help: :always, filter: true)
      character = @characters[choice]
      puts "You are now editing #{character.name}"
      sleep(0.2)
      character.edit_options
      cm_menu
    when 3
      sleep(0.2)
      choices = []
      @characters.each_with_index { |char, index| choices.push({ name: char.name, value: index }) }
      choice = @prompt.select('Choose a character to view: ', choices, cycle: true, show_help: :always, filter: true)
      character = @characters[choice]
      sleep(0.2)
      character.view_stats
      cm_menu
    when 4
      begin
        puts 'WARNING: Choosing a file name that already exists WILL erase that file!'
        file_name = @prompt.ask('What would you like to call this file?')

        export_data = JSON.generate(@characters)
        File.write("#{file_name}.json", export_data)
        puts export_data
      rescue StandardError
        puts 'Something went wrong...'
        sleep(0.5)
        puts 'Returning to character manager menu...'
        sleep(1)
        cm_menu
      end
    when 5
      begin
        puts "Do NOT include file type, e.g for 'example.csv' enter 'example' only."
        file_name = @prompt.ask('What file would you like to import? ')
        import_data = JSON.parse(File.read(file_name + '.json'))
      rescue NoMethodError
        puts 'Import impossible, file may not exist...'
        sleep(0.5)
        @prompt.keypress('Press any key to return to previous menu...')
        cm_menu
      rescue StandardError
        puts 'Something went wrong...'
        sleep(0.5)
        puts 'Returning to character manager menu...'
        sleep(1)
        cm_menu
      end

      import_data.each do |char|
        data = JSON.parse(char)
        char = Character.new
        char.prompt(@prompt)

        data.each do |key, value|
          char.send(key, value)
        end
        @characters << char
      end

      puts "#{file_name} has been successfully imported!"

      @prompt.keypress('Press any key to return to previous menu...')

      puts "#{file_name} has been successfully exported!"
      @prompt.keypress('Press any key to return to previous menu...')
    when 6
      puts 'The CHARACTER MANAGER is the central feature of this application.'
      puts "\n"
      puts "The process of using this feature is simple.
You will first be asked to enter a name for the character being created.
Then you will be given the ability to set various statistics for that character.
These stats range from health points and mana to action points, attack points and defence points."
      puts "\n"
      puts "Once the character has been created any stats of the character can be edited or changed at any time using the 'Edit Characters' Menu.
You can also create custom statuses for other stats not offered automatically using the 'Set Status' feature in the 'List Characters' Menu.
Characters can be exported into named files which can be imported by the app during later uses."
      puts "\n"
      puts "More help can be found in the README which you can access by visiting:"
      puts "https://github.com/BenBart2514/Game-Master/blob/main/README.md"
      puts "\n"
      @prompt.keypress('Press any key to return to previous menu...')
      cm_menu
    end
  end

  def prompt_name
    sleep(0.2)
    begin
      name = @prompt.ask("What is your character's name? ")
    rescue StandardError
      puts 'Something went wrong...'
      sleep(0.5)
      puts 'Returning to character manager menu...'
      sleep(1)
      cm_menu
    end
    while name.nil?
      puts 'Invalid name'
      sleep(0.5)
      puts 'Returning to character manager menu...'
      sleep(1)
      cm_menu
    end
    @name = name.capitalize
  end
end
