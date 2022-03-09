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
    $player1 = Player.new(params[:player1_name])
    $player2 = Player.new(params[:player2_name])
    redirect '/play'
  end

  get '/play' do
    @player1 = $player1
    @player2 = $player2
    @alert_message = session[:alert_message]
    erb :play
  end

  post '/attack' do
    @player1 = $player1
    @player2 = $player2
    @player2.take_hit(10)
    session[:alert_message] = "#{@player1.name} has attacked #{@player2.name}"
    redirect '/play'
  end

  # Start the server if the file is executed directly
  run! if app_file == $0
end