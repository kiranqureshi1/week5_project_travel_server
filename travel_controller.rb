require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/city.rb')
require_relative('models/country.rb')
also_reload('./models/*')

# <p><a href="/countries/:id/update"> <a href="/countries/:id/delete"><a href="/countries/:id/add-info"><a href ="countries/:id/view">edit delete Add-info View</p>


get '/travel' do
  erb(:indexfirst)
end


get '/travel/countries' do
  @countries =  Country.list_all
  erb(:index)
  end

  get '/travel/countries/cities' do
     @cities = City.list_all()
     erb(:city)
   end

get '/travel/countries/cities/new' do
  @countries = Country.list_all()
  erb (:citynew)
end

get '/travel/countries/new' do
  erb(:new)
end


get '/travel/countries/:id' do
  @country = Country.find(params[:id].to_i)
  erb(:show)
end

get '/travel/countries/cities/:id' do
  @city = City.find(params[:id].to_i)
  erb(:showcity)
end

post '/travel/countries' do # create
  @country = Country.new( params )
  @country.save()
end


post '/travel/countries/cities' do # create
  @city = City.new( params )
  @city.save()
  erb( :createcity )
end

post '/travel/countries/:id/edit' do
  @country = Country.find(params[:id])
  erb (:editcountry)
end

post '/travel/countries/cities/:id/edit' do
  @city = City.find(params[:id])
  erb (:editcity)
end

post '/travel/countries/:id' do # update
  Country.new( params ).update
  redirect to '/travel/countries'
end

post '/travel/countries/cities/:id' do # update
  City.new( params ).update
  redirect to '/travel/countries/cities'
end

post '/travel/countries/:id/delete' do # delete
  country = Countries.find( params[:id] )
  country.delete()
  redirect to '/travel/countries'
end

post '/travel/countries/cities/:id/delete' do # delete
  city = City.find( params[:id] )
  city.delete()
  redirect to '/travel/countries/cities'
end
