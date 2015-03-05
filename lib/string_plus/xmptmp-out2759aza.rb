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
# >> >>>>> n: 1
# >>                            user     system      total        real
# >> split map:             0.000000   0.000000   0.000000 (  0.000018)
# >> gsub:                  0.000000   0.000000   0.000000 (  0.000020)
# >> camelcase:             0.000000   0.000000   0.000000 (  0.000013)
# >> >>>>> n: 10
# >>                            user     system      total        real
# >> split map:             0.000000   0.000000   0.000000 (  0.000040)
# >> gsub:                  0.000000   0.000000   0.000000 (  0.000064)
# >> camelcase:             0.000000   0.000000   0.000000 (  0.000009)
# >> >>>>> n: 100
# >>                            user     system      total        real
# >> split map:             0.000000   0.000000   0.000000 (  0.000240)
# >> gsub:                  0.000000   0.000000   0.000000 (  0.000610)
# >> camelcase:             0.000000   0.000000   0.000000 (  0.000009)
# >> >>>>> n: 1000
# >>                            user     system      total        real
# >> split map:             0.000000   0.000000   0.000000 (  0.002310)
# >> gsub:                  0.010000   0.000000   0.010000 (  0.006667)
# >> camelcase:             0.000000   0.000000   0.000000 (  0.000013)
# >> >>>>> n: 10000
# >>                            user     system      total        real
# >> split map:             0.020000   0.000000   0.020000 (  0.025425)
# >> gsub:                  0.070000   0.000000   0.070000 (  0.070857)
# >> camelcase:             0.000000   0.000000   0.000000 (  0.000013)
# >> >>>>> n: 100000
# >>                            user     system      total        real
# >> split map:             0.260000   0.000000   0.260000 (  0.254333)
# >> gsub:                  0.670000   0.000000   0.670000 (  0.681261)
# >> camelcase:             0.000000   0.000000   0.000000 (  0.000012)
# >> >>>>> n: 1000000
# >>                            user     system      total        real
# >> split map:             2.570000   0.000000   2.570000 (  2.579100)
# >> gsub:                  6.790000   0.000000   6.790000 (  6.839046)
# >> camelcase:             0.000000   0.000000   0.000000 (  0.000012)
