require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/city.rb')
require_relative('models/country.rb')
also_reload('./models/*')

# <p><a href="/countries/:id/update"> <a href="/countries/:id/delete"><a href="/countries/:id/add-info"><a href ="countries/:id/view">edit delete Add-info View</p>

get '/countries' do
  @countries =  Country.list_all
  erb(:index)
  end

get '/countries/new' do
  erb(:new)
end

get '/countries/:id' do
  @find = Country.find(params[:id].to_i)
  erb(:show)
end

get '/countries/:id/cities' do
   @countries = Country.all()
   erb(:city)
 end
