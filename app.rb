require 'sinatra/base'
require 'sinatra/reloader'

class BattleApp < Sinatra::Base
  enable :sessions

  configure :test do
    register Sinatra::Reloader
  end

  # Routes
  get '/' do
    erb :index
  end

  # Change this to use the session hash
  post '/player-names' do
    session[:player1_name] = params[:player1_name]
    session[:player2_name] = params[:player2_name]
    redirect '/play'
  end

  # Get Route for the play screen
  # access the session hash to then pass to welcome_players.erb
  get '/play' do
    @player1_name = session[:player1_name]
    @player2_name = session[:player2_name]
    erb :play
  end

  # Start the server if the file is executed directly
  run! if app_file == $0
end