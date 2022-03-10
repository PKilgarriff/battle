require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/player'
require_relative './lib/game'

class BattleApp < Sinatra::Base
  enable :sessions

  configure :test do
    register Sinatra::Reloader
  end

  before do
    @game = Game.instance
  end

  # Routes
  get '/' do
    erb :index
  end

  post '/player-names' do
    @game.new_player(params[:player1_name])
    @game.new_player(params[:player2_name])
    redirect '/play'
  end

  get '/play' do
    @player1 = @game.players[0]
    @player2 = @game.players[1]
    @alert_message = session[:alert_message]
    erb :play
  end

  post '/attack' do
    @player1 = @game.players[0]
    @player2 = @game.players[1]
    @game.attack
    session[:alert_message] = "#{@player1.name} has attacked #{@player2.name}"
    redirect '/play'
  end

  # Start the server if the file is executed directly
  run! if app_file == $0
end
