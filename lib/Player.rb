class Player

  attr_reader :name, :points, :asleep

  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @points = hp
    @asleep = false
    @poisoned = false
    @paralized = false
    @attack_recieved = nil
  end

  def receive_damage(damage)
    @points -= damage
  end

  def attacked(damage)
    receive_damage(damage)
    @attack_recieved = "attacked"
  end

  def asleep?
    @asleep
  end

  def send_to_sleep
    @asleep = true
    @attack_recieved = "sleep"
  end

  def update
    @asleep = false
    @poisoned = false if rand(10) < 3
    receive_damage(rand(1..5)) if poisoned?
    p @name
    p @attack_recieved
    @paralized = false if @attack_recieved != "paralize"
    @attack_recieved = nil
  end

  def poisoned
    @poisoned = true
    @attack_recieved = "poison"
  end

  def poisoned?
    @poisoned
  end

  def paralized
    @paralized = true
    @attack_recieved = "paralize"
  end

  def paralized?
    @paralized
  end
end
