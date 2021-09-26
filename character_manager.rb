require 'tty-prompt'
require_relative 'character'

prompt = TTY::Prompt.new

class CharacterManager
  attr_accessor :characters

  def initialize(prompt)
    @prompt = prompt
    @characters = []
  end

  def cm_menu
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

    if @y == 1
      prompt_name
      @characters << Character.new(@name)
      @current_character = @characters.last
      puts "#{@current_character.name} has been created!"
      @prompt.keypress('Press any key to continue...')
      cm_menu
    end

    # if @y == 2
    #   choices = [
    #     { name: @characters[0].name, value: @characters[0] },
    #     { name: @characters[1].name, value: @characters[1] },
    #     { name: @characters[2].name, value: @characters[2] }
    #   ]
    #   @y = @prompt.select('Choose a character to edit: ', choices, cycle: true, show_help: :always, filter: true)
    #   @y.edit_options
    # end

    if @y == 3
      @characters.each do |x|
        p x.name
      end
      @prompt.keypress('Press any key to return to previous menu...')
      cm_menu
    end
  end

  def prompt_name
    @name = @prompt.ask("What is your character's name? ")
  end
end
