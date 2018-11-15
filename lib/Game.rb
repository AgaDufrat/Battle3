class Game
  attr_reader :attacker, :defender

  def initialize(player_1, player_2)
    @player = [player_1, player_2]
    @attacker = player_2
    @defender = player_1
    @@game_in_progress = nil
  end

  def self.set_game(game)
    @@game_in_progress = game
  end

  def self.game_in_progress
    @@game_in_progress
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

  def player_lost?
    (player_1.points == 0 || player_2.points == 0)
  end

  def loser
    @player.select { |player| player.points <= 0 }.first
  end

end
