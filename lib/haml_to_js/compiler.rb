# HAML-TO-*

# MIT - Sebastien Drouyer

# Why an other haml converter (especially for JS) ?
#  - others are using global variables, except if you prefix all your variables with this.
#  - they don't support brackets in parameters : try {value: "test}"}
#  - we are giving line number so that you can debug your code more easily
#  - class can't be used on prefix and params on others
#  - this one is intended to be used in various languages : you can easily use it for others languages as Ruby or C

require 'haml_to_star/compiler'

class Compiler < HamlToStar::Compiler

  def process_dom_params(dom_params)
    return dom_params.gsub(%r{(for|name|id|class) *:}, '\'\1\':')
  end

  def process_code_line(line)
    processed_line = line;
    processed_line = processed_line.gsub(%r{each *([^ ]*) *: *([^ ]*) *in *([^ ]*)}, 'for (var \1 in \3) { var \2 = \3[\1];')
    processed_line = processed_line.gsub(%r{each *([^ ]*) *in *([^ ]*)}, 'for (var _$key in \2) { var \1 = \2[_$key];')
    return {:processed_line => processed_line, :changed => line != processed_line}
  end
  
  def initialize_content(str, content)
    str << "var #{@variable_name} = '';"
    str << "var #{@variable_line_name} = 0;"
    str << content.join("\n")
  end
  
  def add_content(str, content)
    str << "#{@variable_name} += " + content + ';'
  end
  
  def add_code(str, line, inside)
    processed_line = process_code_line(line[1..line.size - 1])
    str << processed_line[:processed_line] + (inside.size > 0 ? '' : ';')
    if (inside.size > 0)
      if (!processed_line[:changed])
        str << '{'
      end
      str << inside.join("\n")
      str << '}'
    end
  end
  
  def evaluate(line)
    if (line[0] == '=')
      return 'escape(' + line[1..line.size - 1] + ')'
    elsif (line[0..1] == '!=')
      return line[2..line.size - 1]
    else
      return line
    end
  end
  
  def process_code_line_number(str, code_line_number)
    str << "#{@variable_line_name} = #{code_line_number};";
  end
  
  def process_inline_code(str, content)
    str << "#{@variable_name} += " + evaluate(content) + ';'
  end 
end
