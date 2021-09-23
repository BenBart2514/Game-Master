require 'test/unit'
require_relative '../character'

class CharacterTest < Test::Unit::TestCase
  def setup
    @character = Character.new('aragorn')
  end

  def test_create
    assert_not_nil(@character)
  end

  def test_name
    assert_equal('Aragorn', @character.name)
  end

  def test_change_name
    input = @character.change_name
    assert_equal(input, @character.name)
  end

  def test_race
    assert_not_nil(@character.race)
  end

  def test_race_change
    input = @character.change_race
    assert_equal(input, @character.race)
  end

  def test_hp
    input = @character.set_hp
    assert_equal(input, @character.max_hp)
    assert_equal(input, @character.hp)
  end

  def test_mana
    input = @character.set_mana
    assert_equal(input, @character.max_mana)
    assert_equal(input, @character.mana)
  end

  def test_stamina
    input = @character.set_stamina
    assert_equal(input, @character.max_stamina)
    assert_equal(input, @character.stamina)
  end

  def test_ap
    input = @character.set_ap
    assert_equal(input, @character.max_ap)
    assert_equal(input, @character.ap)
  end

  def test_attack
    input = @character.set_attack
    assert_equal(input, @character.attack)
  end

  def test_defence
    input = @character.set_defence
    assert_equal(input, @character.defence)
  end
end
