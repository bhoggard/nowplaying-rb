require 'sinatra/base'
 
class NowPlaying < Sinatra::Base
  set :root, File.expand_path("#{File.dirname(__FILE__)}/../app")
  set :public_folder, 'public'

  # Allow the app to serve static files from the 'public' directory in :root
  enable :static

  get '/' do
    send_file File.join(settings.public_folder, 'index.html')
  end
end
