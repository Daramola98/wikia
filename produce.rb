require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'

set :bind, '0.0.0.0'

get '/' do
  erb :welcome
end

get('/apple') do
  data = {
    name: 'daramola',
    age: 24
  }
  JSON.dump data
end

get '/cars' do
  'There are new cars'
end

get '/s' do
  'Hello S'
end
