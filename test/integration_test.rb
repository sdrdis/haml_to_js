require 'test/unit'
require 'haml_to_js/compiler'

class IntegrationTest < Test::Unit::TestCase
  def test_english_hello
    puts 'hello'
    assert_equal "hello world",
      "toto"
  end
end
