require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/player'

class BattleApp < Sinatra::Base
  enable :sessions

  configure :test do
    register Sinatra::Reloader
  end

  # Routes
  get '/' do
    erb :index
  end

  post '/player-names' do
    session[:player1] = Player.new(params[:player1_name])
    session[:player2] = Player.new(params[:player2_name])
    redirect '/play'
  end

  get '/play' do
    @player1 = session[:player1]
    @player2 = session[:player2]
    @alert_message = session[:alert_message]
    erb :play
  end

  post '/attack' do
    session[:alert_message] = 'Player 1 has attacked Player 2'
    redirect '/play'
  end

  # Start the server if the file is executed directly
  run! if app_file == $0
end