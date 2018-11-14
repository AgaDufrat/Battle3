require 'sinatra/base'
require './lib/Player'
require './lib/Game'
class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:player_form)
  end

  post '/names' do
    p params
    $player1 = Player.new(params[:player_1])
    $player2 = Player.new(params[:player_2])
    redirect to('/play')
  end

  get '/play' do
    @player_1 = $player1.name
    @player_2 = $player2.name
    @player_1_points = $player1.points
    @player_2_points = $player2.points
    erb(:player_names)
  end

  get '/attack' do
    @player_1 = $player1
    @player_2 = $player2
    Game.new.attack(@player_2)
    erb(:attack)
  end
  run! if app_file == $0
end
