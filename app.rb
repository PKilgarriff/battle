require 'sinatra/base'
require 'sinatra/reloader'

class BattleApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # Routes


  # Start the server if the file is executed directly
  run! if app_file == $0
end