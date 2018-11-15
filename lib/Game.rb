class Game
  attr_reader :attacker, :defender

  def initialize(player_1, player_2)
    @player = [player_1, player_2]
    @attacker = player_2
    @defender = player_1
  end

   def player_1
     @player.first
   end

   def player_2
     @player.last
   end

  def attack(attacker,defender)
    defender.receive_damage
  end

  def switch_players
    @attacker, @defender = @defender, @attacker
  end
end
