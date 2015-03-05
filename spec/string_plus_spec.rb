require "spec_helper"
require "string_plus"
scope String do
  scope "#camelcase" do
    spec "one word" do
      "hello".camelcase == "Hello"
    end

    spec "multipe words underscored" do
      "hello_cool_world".camelcase == "HelloCoolWorld"
    end

    spec "multipe words spaced" do
      "hello cool world".camelcase == "HelloCoolWorld"
    end

    spec "multipe words multiple underscored" do
      "hello__cool___world".camelcase == "HelloCoolWorld"
    end

    spec "multipe words multiple spaced" do
      "hello    cool       world".camelcase == "HelloCoolWorld"
    end

    spec "multipe words mmixed spaces and dashes" do
      "hello_cool       world".camelcase == "HelloCoolWorld"
    end
  end

  scope "#lcamelcase" do
    spec "one word" do
      "hello".lcamelcase == "hello"
    end

    spec "multipe words underscored" do
      "hello_cool_world".lcamelcase == "helloCoolWorld"
    end

    spec "multipe words spaced" do
      "hello cool world".lcamelcase == "helloCoolWorld"
    end

    spec "multipe words multiple underscored" do
      "hello__cool___world".lcamelcase == "helloCoolWorld"
    end

    spec "multipe words multiple spaced" do
      "hello    cool       world".lcamelcase == "helloCoolWorld"
    end

    spec "multipe words mmixed spaces and dashes" do
      "hello_cool       world".lcamelcase == "helloCoolWorld"
    end
  end
  scope "#constantize" do
    spec "capitalized word" do
      "Integer".constantize == Integer
    end

    spec "lower case word" do
      "symbol".constantize == Symbol
    end

     spec "multiple words" do
      "basic_object".constantize == BasicObject
     end

     spec "non-existent constant" do
       @ex = capture_exception(NameError) do
         "IDoNotExist".constantize
       end

       @ex.message == "uninitialized constant IDoNotExist"
     end

     

  end
end
