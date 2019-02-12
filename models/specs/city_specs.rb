require("minitest/autorun")
require("minitest/rg")
require_relative('../city.rb')

class CountryTest < MiniTest::Test

  def setup
    @city_1 = City.new({"id" => 1, "name" => "Edinburgh", "visit_status" => "true", "number_of_visits" => 2, "country_id" => 2 })
  end

  def test_visit_status
    assert_equal("true", @city_1.visit_status)
  end

  def test_number_od_visits
    assert_equal(2, @city_1.number_of_visits)
  end

  def test_name
    assert_equal(2, @city_1.country_id)
  end

end
