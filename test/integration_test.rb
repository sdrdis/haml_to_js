require 'test/unit'
require 'haml_to_js/compiler'

class IntegrationTest < Test::Unit::TestCase
  def test_integration_test_cases
    input_dir     = "integration_test_cases/input/"
    input_ext     = ".jshaml"
    output_dir    = "integration_test_cases/output/"
    output_ext     = ".js"
    input_files   = Dir.glob("#{input_dir}*#{input_ext}")
    inst = Compiler.new
    
    input_files.each do |input_file|
      filename = input_file[input_dir.length..(input_file.length - input_ext.length - 1)]
      output_file = "#{output_dir}#{filename}#{output_ext}"
      assert_equal(inst.convert_from_string(File.read(input_file)).strip, File.read(output_file).strip)
    end
  end
end
