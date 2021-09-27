require 'tty-prompt'
require_relative 'character'

prompt = TTY::Prompt.new

class CharacterManager
  attr_accessor :characters

  def initialize(prompt)
    @prompt = prompt
    @characters = [
      Character.new('Bob', prompt),
      Character.new('Ross', prompt),
      Character.new('Damien', prompt)
    ]
  end

  def cm_menu
    sleep(0.2)
    system 'clear'
    @y = @prompt.select('Character Manager', cycle: true, show_help: :always) do |menu|
      menu.enum '.'
      menu.choice 'New Character', 1
      menu.choice 'Edit Character', 2
      menu.choice 'List Characters', 3
      menu.choice 'Help', 4
      menu.choice 'Go Back', 5
      menu.choice 'Exit', 6
    end

    exit if @y == 6
    case @y
    when 1
      sleep(0.2)
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
      @prompt.keypress('Press any key to return to previous menu...')
      cm_menu
    when 4
      # display help document
      puts 'does nothing yet'
      @prompt.keypress('Press any key to return to previous menu...')
      cm_menu
    when 5
      # go back to main menu
      # main_menu
    end
  end

  def prompt_name
    @name = @prompt.ask("What is your character's name? ")
    if @name.nil?
      puts 'Invalid name'
      sleep(1)
      cm_menu
    end
  end
end
