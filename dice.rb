# /dice.rb

require "sinatra"

get '/' do
  "Hello World"
end

get '/zebra' do
  "We have to add a route for each path we support."
end
