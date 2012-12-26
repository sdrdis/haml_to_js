haml_to_js
=========

haml_to_js is a ruby library and command line that converts haml to javascript.

Why an other haml to js converter (see similar utilities) ?
* It is a extension of [haml_to_star](https://github.com/sdrdis/haml_to_star) which purpose is to convert haml into any language
* This converter is intended for front usage
* It simplifies debugging (the generated code is readable, a variable hold haml line number so you can know exactly where the problem is)
* It support features that other don't support:
  * if...else statements
  * Declarations such as `.first{class: 'second'}` will generate `<div class="first second"></div>`
  * Support for brackets inside parameters (ex: `%div{key: 'value with bracket}'}`)

Installation
------------

`gem install haml_to_js`

Usage
-----

`haml_to_js file` or `haml_to_js < file`

Similar utilities
-----------------

[haml-js](https://github.com/creationix/haml-js)

[client-side-js](https://github.com/uglyog/clientside-haml-js)

[ruby-haml-js](https://github.com/dnagir/ruby-haml-js)

Contributions
-------------

This project is hosted on [github](https://github.com/sdrdis/haml_to_js), so don't hesitate to contribute and raise issues.

License
-------

This project is under MIT License.
