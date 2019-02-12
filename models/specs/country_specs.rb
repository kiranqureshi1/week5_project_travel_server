require("minitest/autorun")
require("minitest/rg")
require_relative('../country.rb')

class CountryTest < MiniTest::Test

  def setup
    @country_1 = Country.new({"id" => 1, "name" => "Scotland"})
  end

  def test_name
    assert_equal("Scotland", @country_1.name)
  end


end
