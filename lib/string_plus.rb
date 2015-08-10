require "string_plus/version"

module StringPlus
  def camelcase(capitalize_first_char=true)
    res = ""
    flag = capitalize_first_char
    self.each_char {|w|
      (flag = true ; next) if w == "_" || w == " "
      res << if flag
               flag = false
               w.upcase
             else
               w
             end
    }
    res
  end

  def lcamelcase
    camelcase(false)
  end

  def underscore
    return self.downcase if self.each_char.all? { |c| c == c.upcase && c =~ /[a-zA-Z0-9]/}
    res = ""
    [nil, *self.each_char].each_cons(2) do |last, current|
      res << "_" if last !=nil && current == current.upcase && !("0".."9").include?(current) 
      res << current.downcase unless current == " "
    end
    res
  end
  alias :snakecase :underscore
  
  def constantize
    c = self.split("-").map(&:camelcase).join("::")
    Object.send(:const_get, c)
  end
end
