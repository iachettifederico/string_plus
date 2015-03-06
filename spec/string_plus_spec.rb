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

    spec "multipe words mixed spaces and dashes" do
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

    scope "namespaced constant" do
      module ExternalModule
        class InternalClass
          class InceptionedClass
            class DreamInsideADreamInsideADream; end
          end
        end
      end

      spec "one level" do
        "external_module-internal_class".constantize == ExternalModule::InternalClass
      end

      spec "multiple levels" do
        "external_module-internal_class-inceptioned_class-dream_inside_a_dream_inside_a_dream".constantize == ExternalModule::InternalClass::InceptionedClass::DreamInsideADreamInsideADream
      end
    end
  end

  scope "#underscore" do
    spec "one word" do
      "Hello".underscore == "hello"
    end
  
    spec "multipe words" do
      "HelloCoolWorld".underscore == "hello_cool_world"
    end

       spec "words with numbers" do
         "Hel1oW0rld".underscore == "hel1o_w0rld"
    end

    spec "multipe words multiple underscored" do
      "HelloCoolWorldI".underscore == "hello_cool_world_i"
    end

    spec "spaces" do
      "Hello world".underscore == "hello_world"
    end

    spec "all caps" do
      "HELLO".underscore == "hello"
    end

    
    spec "snakecase" do
      "HelloCoolWorldI".snakecase == "hello_cool_world_i"
    end

  end
end
