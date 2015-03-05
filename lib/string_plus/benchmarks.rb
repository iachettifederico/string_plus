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
  puts
end

