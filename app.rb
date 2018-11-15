require 'sinatra/base'
require './lib/Player'
require './lib/Game'
class Battle < Sinatra::Base

  get '/' do
    erb(:player_form)
  end

  post '/names' do
    p params
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    if @game.player_lost?
      erb(:game_over)
    else
      @game.switch_players
      erb(:player_names)
    end
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.attacker, @game.defender)

    erb(:attack)
  end
  run! if app_file == $0
end
