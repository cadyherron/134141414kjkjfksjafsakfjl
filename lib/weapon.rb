require_relative 'battle_bot'

class Weapon

  attr_reader :name, :damage
  attr_accessor :bot

  def initialize(name, damage=nil)
    raise ArgumentError unless name.is_a? String
    # raise ArgumentError if damage.is_a? Fixnum || damage.nil?
    @name = name
    @damage = damage
    @bot = nil
    @picked_up = false
    check_name?
  end

  def check_name?
    @name.is_a? String
  end

  def check_bot
    raise ArgumentError unless @bot == bot
  end

  def picked_up?
    @picked_up
  end

  def bot=(new_bot)
    @bot = new_bot
  end


end