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
    if @characters.length.zero?
      @y = @prompt.select('Character Manager', cycle: true, show_help: :always, per_page: 8) do |menu|
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
      @y = @prompt.select('Character Manager', cycle: true, show_help: :always, per_page: 8) do |menu|
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
      # display help document
      puts 'Help is on the way!'
      sleep(0.5)
      puts '(Coming soon...)'
      sleep(1)
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
