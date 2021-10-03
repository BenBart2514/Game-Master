require 'test/unit'
require_relative '../character'

# Test cases for character generation feature
class CharacterGenTest < Test::Unit::TestCase
  def setup
    @character = Character.new('Anonymous')
  end

  # Testing of initialization of new characters
  def test_create
    assert_not_nil(@character)
  end

  # Testing of getting character name
  def test_name
    assert_equal('Anonymous', @character.name)
  end

  # Testing of changing character name
  def test_name_change
    @character.change_name
    assert_not_nil(@character.name)
  end
end
