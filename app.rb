require 'sinatra/base'
require 'sinatra/reloader'

class BattleApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # Routes
  get '/' do
    erb :index
  end

  post '/welcome-players' do
    @player1_name = params[:player1_name]
    @player2_name = params[:player2_name]
    erb :welcome_players
  end

  # Start the server if the file is executed directly
  run! if app_file == $0
end