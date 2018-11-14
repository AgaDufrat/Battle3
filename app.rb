require 'sinatra/base'
require 'Player'
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
    erb(:player_names)
  end

  get '/confirmation' do
    @player_1 = $player1.name
    @player_2 = $player2.name
    erb(:confirmation)
  end
  run! if app_file == $0
end
