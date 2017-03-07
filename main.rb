
require 'sinatra'
require_relative 'twitter.rb'

set :bind, '0.0.0.0' # Only needed if you're running from Codio

get '/' do

    t = TwitterInteract.new()
    @list = t.get_tweets("@spicyslice #order") #keyword as paramater
    erb :display_tweets
    
end


get  '/index'  do
    erb :index
end

get '/register' do
     erb :register
end

get '/login' do
     erb :login
end
