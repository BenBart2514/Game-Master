require 'test/unit'
require_relative '../character'

# Test cases for character editing feature
class CharacterEditTest < Test::Unit::TestCase
  def setup
    @character = Character.new('Anonymous')
  end

  # Testing of editing character race
  def test_race
    @character.set_race
    assert_not_nil(@character.race)
  end

  # Testing of editing character level
  def test_lvl
    @character.set_lvl
    assert_not_nil(@character.lvl)
  end

  # Testing of editing character hitpoints
  def test_hp
    @character.set_hp
    assert_not_nil(@character.hp)
  end

  # Testing of editing character mana
  def test_mana
    @character.set_mana
    assert_not_nil(@character.mana)
  end

  # Testing of editing character stamina
  def test_stamina
    @character.set_stamina
    assert_not_nil(@character.stamina)
  end

  # Testing of editing character action points
  def test_ap
    @character.set_ap
    assert_not_nil(@character.ap)
  end

  # Testing of editing character attack
  def test_attack
    @character.set_attack
    assert_not_nil(@character.attack)
  end

  # Testing of editing character defence
  def test_defence
    @character.set_defence
    assert_not_nil(@character.defence)
  end
end
