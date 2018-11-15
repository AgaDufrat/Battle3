class Player

  attr_reader :name, :points, :asleep

  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @points = hp
    @asleep = false
    @poisoned = false
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
    @poisoned = false if rand(10) < 3
    receive_damage(rand(1..5)) if poisoned?
  end

  def poisoned
    @poisoned = true
  end

  def poisoned?
    @poisoned
  end
end
