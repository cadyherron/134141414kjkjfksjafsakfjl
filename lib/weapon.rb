require_relative 'battle_bot'

class Weapon

  attr_reader :name, :damage
  attr_accessor :bot


  def initialize(name, damage=20)
    raise ArgumentError unless name.is_a? String
    raise ArgumentError unless damage.is_a? Integer
    @name = name
    @damage = damage
  end


  def check_bot
    raise ArgumentError unless @bot == bot
  end


  def picked_up?
    !!@bot
  end


  def bot=(new_bot)
    raise ArgumentError unless new_bot.nil? || new_bot.is_a?(BattleBot)
    @bot = new_bot
  end


  def bot
    @bot
  end


end