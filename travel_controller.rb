require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/city.rb')
require_relative('models/country.rb')
also_reload('./models/*')
require('pry')



get '/travel' do
  erb(:indexfirst)
end

get '/travel/visited' do
  @cities = City.visited
  erb(:visited)
end

get '/travel/not_visited' do
  @cities = City.not_visited
  erb(:not_visited)
end



get '/travel/countries' do
  @countries =  Country.list_all
  erb(:index)
  end

  get '/travel/countries/cities' do
     @cities = City.list_all()
     erb(:city)
   end

   get '/travel/countries/new' do
     erb(:new)
   end

get '/travel/countries/cities/new' do
  @countries = Country.list_all()
  erb (:citynew)
end


get '/travel/countries/:id' do
  @country = Country.find(params[:id].to_i)
  erb(:show)
end

get '/travel/countries/:id/cities' do
  @country = Country.find(params[:id].to_i)
  erb(:cities_of_countries)
end

# get '/travel/countries/cities/:id' do
#   @city = City.find(params[:id])
#   # erb(:showcity)
# end

get '/travel/countries/:id/edit' do
  @country = Country.find(params[:id])
  erb (:editcountry)
end

get '/travel/countries/cities/:id/edit' do
  @city = City.find(params[:id])
  @countries = Country.list_all()
  erb (:editcity)
end



post '/travel/countries/new' do # create
  @country = Country.new( params )
  @country.save()
  redirect to '/travel/countries'
end


post '/travel/countries/cities/new' do # create
  if params['visit_status'] == nil
    params['visit_status'] = false
  end
  @city = City.new( params )
  @city.save()
  redirect to '/travel/countries/cities'
end

post '/travel/countries/:id' do # update
  Country.new( params ).update
  redirect to '/travel/countries'
end

post '/travel/countries/cities/:id' do # update
  if params['visit_status'] == nil
    params['visit_status'] = false
  end
  City.new( params ).update
  redirect to '/travel/countries/cities'
end

post '/travel/countries/:id/delete' do # delete
  country = Country.find( params[:id] )
  country.delete()
  redirect to '/travel/countries'
end

post '/travel/countries/cities/:id/delete' do # delete
  city = City.find( params[:id] )
  city.delete()
  redirect to '/travel/countries/cities'
end
