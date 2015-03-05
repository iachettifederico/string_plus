require "benchmark"
require "string_plus"
str = "federico_martin_iachetti"

[ 1, 10, 100, 1_000, 10_000, 100_000, 1_000_000].each do |n|
  puts ">>>>> n: #{n}"
  Benchmark.bm(20) do |x|
    x.report("split map:") {
      1.upto(n) do
        str.split("_").map(&:capitalize).join
      end
    }
    x.report("gsub:")      {
      1.upto(n) do
        str.gsub(/[a-zA-Z0-9]+/, &:capitalize).gsub("_", "")
      end
    }
    x.report("camelcase:") {
      str.camelcase
    }
  end
end
# ~> -:18:in `block (3 levels) in <main>': undefined method `camelcase' for "federico_martin_iachetti":String (NoMethodError)
# ~> 	from /home/fedex/.rvm/rubies/ruby-2.2.0/lib/ruby/2.2.0/benchmark.rb:288:in `measure'
# ~> 	from /home/fedex/.rvm/rubies/ruby-2.2.0/lib/ruby/2.2.0/benchmark.rb:370:in `item'
# ~> 	from -:17:in `block (2 levels) in <main>'
# ~> 	from /home/fedex/.rvm/rubies/ruby-2.2.0/lib/ruby/2.2.0/benchmark.rb:172:in `benchmark'
# ~> 	from /home/fedex/.rvm/rubies/ruby-2.2.0/lib/ruby/2.2.0/benchmark.rb:204:in `bm'
# ~> 	from -:6:in `block in <main>'
# ~> 	from -:4:in `each'
# ~> 	from -:4:in `<main>'
# >> >>>>> n: 1
# >>                            user     system      total        real
# >> split map:             0.000000   0.000000   0.000000 (  0.000027)
# >> gsub:                  0.000000   0.000000   0.000000 (  0.000027)
# >> camelcase:           
