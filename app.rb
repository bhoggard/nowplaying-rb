require 'sinatra/base'
require_relative 'feed'

class NowPlaying < Sinatra::Base
  set :root, File.expand_path("#{File.dirname(__FILE__)}/../app")
  set :public_folder, 'public'

  before do
    content_type :json
    headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => %w[OPTIONS GET]
  end

  # Allow the app to serve static files from the 'public' directory in :root
  enable :static

  def output_feed(klass)
    feed = klass.new
    feed.read
    JSON.generate(feed.translate_feed)
  end

  get '/' do
    content_type :html
    send_file File.join(settings.public_folder, 'index.html')
  end

  get '/counterstream' do
    output_feed(Counterstream)
  end

  get '/dronezone' do
    output_feed(DroneZone)
  end

  get '/earwaves' do
    output_feed(Earwaves)
  end

  get '/q2' do
    output_feed(Q2)
  end

  get '/yle' do
    output_feed(Yle)
  end
end
