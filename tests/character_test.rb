require 'test/unit'
require_relative '../character'

class CharacterTest < Test::Unit::TestCase
  def setup
    @character = Character.new('Aragorn')
  end

  def test_create
    assert_not_nil(@character)
  end
end
