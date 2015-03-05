require "string_plus/version"

module StringPlus
  def camelcase(capitalize_first_char=true)
    res = ""
    flag = capitalize_first_char
    self.each_char {|w|
      (flag = true ; next) if w == "_"
      res << if flag
               flag = false
               w.upcase
             else
               w
             end
    }
    res
  end

  def snakecase
    camelcase(false)
  end
end

String.send(:include, StringPlus)
