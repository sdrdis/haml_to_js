Gem::Specification.new do |s|
  s.name        = 'haml_to_js'
  s.version     = '0.1'
  s.date        = '2012-12-27'
  s.summary     = "haml_to_js is a ruby library and command line that converts haml to javascript."
  s.add_runtime_dependency('haml_to_star')
  s.description = <<eos
haml_to_js is a ruby library and command line that converts haml to javascript.

Why an other haml to js converter (see similar utilities) ?
* It is a extension of [haml_to_star](https://github.com/sdrdis/haml_to_star) which purpose is to convert haml into any language
* This converter is intended for front usage
* It simplifies debugging (the generated code is readable, a variable hold haml line number so you can know exactly where the problem is)
* It support features that other don't support (don't hesitate to raise an issue if I am no longer right):
  * if...else statements
  * Declarations such as `.first{class: 'second'}` will generate `<div class="first second"></div>`
  * Support for brackets inside parameters (ex: `%div{key: 'value with bracket}'}`)
eos
  s.authors     = ["Sébastien Drouyer"]
  s.email       = 'sdrdis@hotmail.com'
  s.files       = `git ls-files`.split("\n")
  s.executables = ['haml_to_js']
  s.homepage    = 'https://github.com/sdrdis/haml_to_js/'
end
