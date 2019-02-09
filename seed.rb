require_relative('models/city.rb')
require_relative('models/country.rb')
require('pry-byebug')

City.delete_all()
Country.delete_all()

country_1 = Country.new({'name' => "Scotland"})
country_2 = Country.new({'name' => "China"})
country_3 = Country.new({'name' => "USA"})
country_4 = Country.new({'name' => "France"})

country_1.save()
country_2.save()
country_3.save()
country_4.save()

city_1 = City.new({"name" => "Edinburgh", "visit_status" => true, "number_of_visits" => 2, "country_id" => country_1.id })
city_2 = City.new({"name" => "Paris", "visit_status" => true, "number_of_visits" => 1, "country_id" => country_4.id })
city_3 = City.new({"name" => "Beijing", "visit_status" => false, "number_of_visits" => 0, "country_id" => country_2.id })
city_4 = City.new({"name" => "New-York", "visit_status" => false, "number_of_visits" => 0, "country_id" => country_3.id })

city_1.save()
city_2.save()
city_3.save()
city_4.save()





binding.pry
nil
