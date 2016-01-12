require_relative 'weapon.rb'

class BattleBot

  attr_accessor :dead
  attr_reader :name, :health, :enemies, :weapon


  def initialize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @dead = false
  end

  def dead?
    @dead
  end

  def has_weapon?
    false if [false, nil].include? @weapon
  end

  def create_weapon(name, damage)
    Weapon.new(name, damage)
  end

  def pick_up(weapon)
    if @weapon.nil?
      @weapon = weapon
    end
      # weapon.picked_up = true
      # @weapon.bot = bot
      # weapon.bot = bot
    # raise ArgumentError unless weapon == Weapon
    # raise ArgumentError if weapon.picked_up?
  end


  def drop_weapon
    weapon.picked_up = false
  end





end