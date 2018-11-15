require 'sinatra/base'
require './lib/Player'
require './lib/Game'
class Battle < Sinatra::Base

  get '/' do
    erb(:player_form)
  end

  before do
      @game = Game.game_in_progress
  end

  post '/names' do
    p params
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    Game.set_game(Game.new(player_1, player_2))
    redirect to('/play')
  end

  get '/play' do
    if @game.player_lost?
      erb(:game_over)
    else
      @game.switch_players unless @game.defender.asleep?
      @game.update_players
      erb(:player_names)
    end
  end

  get '/attack' do
    @game.attack(@game.defender, Kernel.rand(5..15))
    erb(:attack)
  end

  get '/sleep' do
    @game.sleep(@game.defender)
    erb(:sleep)
  end

  get '/poison' do
    @game.poison(@game.defender)
    erb(:poison)
  end

  run! if app_file == $0
end
