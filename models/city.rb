require_relative('../db/sql_runner.rb')


class City

  attr_reader :id
  attr_accessor :name, :visit_status, :number_of_visits, :country_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @visit_status = options['visit_status'] = false
    @number_of_visits = options['number_of_visits']
    @country_id = options['country_id']
  end

  def find_country
    sql = "SELECT * FROM countries WHERE countries.id = $1"
    values = [@country_id]
    country = SqlRunner.run(sql, values)
    return  Country.new(country.first)
  end

  def find_country_name
    sql = "SELECT name FROM countries WHERE countries.id = $1"
    values = [@country_id]
    SqlRunner.run(sql, values)[0]['name']
    # binding.pry
  end
  def save
    sql = "INSERT INTO cities(name, visit_status, number_of_visits, country_id) VALUES($1, $2, $3, $4) RETURNING id"
    values = [@name, @visit_status, @number_of_visits, @country_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE cities SET(name, visit_status, number_of_visits, country_id) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @visit_status, @number_of_visits, @country_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM cities WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [id]
    city = SqlRunner.run(sql, values)
    return City.new(city.first)
  end


  def self.list_all
    sql = "SELECT * FROM cities"
    cities = SqlRunner.run(sql)
    return cities.map {|city| City.new(city)}
  end

  def self.delete_all
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end

  def City.visited
    sql = "SELECT *FROM cities WHERE visit_status = true"
    cities = SqlRunner.run(sql)
    return cities.map {|city| City.new(city)}
  end

  def City.not_visited
    sql = "SELECT * FROM cities WHERE visit_status = false"
    cities = SqlRunner.run(sql)
    return cities.map {|city| City.new(city)}
  end

end
