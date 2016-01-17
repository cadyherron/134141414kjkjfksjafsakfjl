
class BattleBot

  attr_accessor :dead, :count
  attr_reader :name, :health, :enemies, :weapon

  @@count = 0

  def self.count
    @@count
  end


  def initialize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @dead = false
    @@count += 1
  end


  def dead?
    @dead
  end


  def has_weapon?
    !!@weapon
  end


  def pick_up(weapon)
    raise ArgumentError unless weapon.is_a? Weapon
    raise ArgumentError if weapon.picked_up?
    return if has_weapon?

    weapon.bot = self
    @weapon = weapon
  end


  def drop_weapon
    @weapon.bot = nil
    @weapon = nil 
  end


  def take_damage(amount)
    raise ArgumentError unless amount.is_a? Integer
    amount < @health ? @health -= amount : @health = 0

    if @health <= 0
      @dead = true
      @@count -= 1
    end
    @health
  end


  def heal
    @health += 10 unless dead?
    @health = 100 if @health > 90
    @health
  end


  def attack(battle_bot)
    raise ArgumentError unless battle_bot.is_a? BattleBot
    raise ArgumentError if battle_bot == self
    raise ArgumentError unless @weapon

    battle_bot.receive_attack_from(self)
  end


  def receive_attack_from(enemy)
    raise ArgumentError unless enemy.is_a? BattleBot
    raise ArgumentError if enemy == self
    raise ArgumentError unless enemy.weapon

    take_damage(enemy.weapon.damage)
    @enemies << enemy unless @enemies.include? enemy

    self.defend_against(enemy)
  end


  def defend_against(enemy)
    return if dead? || ! has_weapon?
    self.attack(enemy) if has_weapon? 
  end


end
