require_relative('../db/sql_runner.rb')

class Country

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def find_city
    sql = "SELECT * FROM cities WHERE country_id = $1"
    values = [@id]
    city = SqlRunner.run(sql, values)
    return City.new(city.first)
  end

  def find_city_name
    sql = "SELECT name FROM cities WHERE country_id = $1"
    values = [@id]
    return SqlRunner.run(sql, values)[0]['name'].to_s
  end
  

  def save
    sql = "INSERT INTO countries(name) VALUES($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end


  def update
    sql = "UPDATE countries SET(name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM countries WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [id]
    country = SqlRunner.run( sql, values )
    result = Country.new( country.first )
    return result
  end

  def self.list_all
    sql = "SELECT * FROM countries"
    countries = SqlRunner.run(sql)
    return countries.map {|country| Country.new(country)}
  end

  def self.delete_all
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

end
