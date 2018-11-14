class Game

  def initialize(player_1, player_2)
    @player = [player_1, player_2]
  end

   def player_1
     @player.first
   end

   def player_2
     @player.last
   end

  def attack(player)
    player.receive_damage
  end

end
