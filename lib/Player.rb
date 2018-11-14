class Player

  attr_reader :name, :points

  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @points = hp
  end

  def attack(player)
    player.receive_damage
  end

  def receive_damage
    @points -= 10
  end

end
