require 'csv'
require 'tty-prompt'
require_relative 'character'

class CharacterManager
  attr_accessor :characters

  def initialize(prompt)
    @prompt = prompt
    # @characters = []
    # DEBUG
    @characters = [
      Character.new('Bob', prompt),
      Character.new('Ross', prompt),
      Character.new('Damien', prompt)
    ]
  end

  def cm_menu
    sleep(0.2)
    system 'clear'
    @y = if @characters.length.zero?
           1
         else
           @prompt.select('Character Manager', cycle: true, show_help: :always, per_page: 8) do |menu|
             menu.enum '.'
             menu.choice 'New Character', 1
             menu.choice 'Edit Character', 2
             menu.choice 'List Characters', 3
             menu.choice 'Import Character(s)', 4
             menu.choice 'Export Character(s)', 5
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
      # # Import from file
      # file_name = @prompt.ask('What file would you like to import? ')

      # # # with File.read
      # # file = File.read(file_name)
      # # file.each_line { |line|
      # #   @characters.push line
      # # }

      puts 'Import function incomplete'
      sleep(1)
      @prompt.keypress('Press any key to return to previous menu...')
    when 5
      # # Export to file
      # puts 'WARNING: Choosing a file name that already exists WILL erase that file!'
      # file_name = @prompt.ask('What would you like to call this file?')
      
      # # with CSV
      # CSV.open("#{file_name}.csv", 'w') do |csv|
      #   csv << @characters
      # end

      # # with File.write
      # # File.write(file_name, @characters.join)

      # puts "#{file_name} has been created!"

      puts 'Export function incomplete'
      sleep(1)
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
      @prompt.keypress('Press any key to try again...')
      cm_menu
    end
    while name.nil?
      puts 'Invalid name'
      sleep(0.5)
      @prompt.keypress('Press any key to try again...')
      cm_menu
    end
    @name = name.capitalize
  end
end
