Gem::Specification.new do |s|
  s.name        = 'haml_to_js'
  s.version     = '0.1'
  s.date        = '2012-12-27'
  s.summary     = "haml_to_js is a ruby library and command line that converts haml to javascript."
  s.add_runtime_dependency('haml_to_star')
  s.description = "haml_to_js is a ruby library and command line that converts haml to javascript."
  s.authors     = ["Sébastien Drouyer"]
  s.email       = 'sdrdis@hotmail.com'
  s.files       = `git ls-files`.split("\n")
  s.executables = ['haml_to_js']
  s.homepage    = 'https://github.com/sdrdis/haml_to_js/'
end
