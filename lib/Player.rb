class Player

  attr_reader :name, :points, :asleep

  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @points = hp
    @asleep = false
  end

  def receive_damage(damage)
    @points -= damage
  end

  def asleep?
    @asleep
  end

  def send_to_sleep
    @asleep = true
  end

  def update
    @asleep = false
  end

end
