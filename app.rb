require 'sinatra'

set :port, 8000
set :bind, '127.0.0.1'

require 'csv'


def get_data
    CSV.read('cfg_profiles.csv', :headers => true).to_a
end

get '/' do 
  @data = get_data
  erb :table
end


get '/profiles/:username' do
  @data = get_data
  username = params[:username]
  @profile = @data.reject { |data| data[3]!=username }.first
  @main = @data[0]
  erb :profile
end 

