require 'sinatra'

set :port, 8000
set :bind, '127.0.0.1'

require 'csv'


def get_data
    CSV.read('cfg_profiles.csv', :headers => true).to_a
end

get '/' do 
@data = get_data
erb:table
end

get "/profiles/'<%=data[3]%>'" do
erb:profile
end 