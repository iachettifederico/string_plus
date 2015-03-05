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

  def constantize
    c = self.split("-").map(&:camelcase).join("::")
    Object.send(:const_get, c)
  end
end

String.send(:include, StringPlus)
