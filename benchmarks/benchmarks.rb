# -*- coding: utf-8 -*-
require "string_plus"

class String
  def camelcase_linear
    res = ""
    flag = true
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

  def camelcase_array
    split("_").map(&:capitalize).join
  end

  def camelcase_array2
    split(/[-_\s]*/).map(&:capitalize).join
  end

  def camelcase_regex
    gsub(/^\w|[\W_]+?\w/) { |match| match[-1,1].upcase }
  end

  def camelcase_regex2
    gsub(/^\w|[\W_]+\w/) { |match| match[-1,1].upcase }
  end
end

str = <<EOF
Lorem 000 00ipsum,  dolor-=+_sit amet, consectetur adipiscing elit. Praesent augue velit, aliquet vel sollicitudin vel, efficitur et augue. Quisque a sem sodales, accumsan lorem ac, rhoncus lorem. Vestibulum ultrices dolor in dui pulvinar, eget sagittis magna aliquet. Donec dapibus in lorem vel malesuada. Ut suscipit imperdiet venenatis. Ut gravida lorem nibh, vel cursus nulla finibus non. Fusce at lorem tincidunt, consequat justo ac, commodo lorem. Mauris eu ligula sollicitudin, pellentesque erat accumsan, rutrum quam. Cras maximus faucibus massa, tincidunt lacinia lacus cursus ac. Curabitur felis erat, tincidunt a aliquam non, semper scelerisque leo. In pellentesque mollis gravida.
Vestibulum semper accumsan nulla. Mauris vel metus sollicitudin, hendrerit mi dictum, dignissim magna. Nullam tincidunt dapibus metus, sed lacinia augue volutpat ultricies. Proin bibendum enim sed neque lobortis, vel iaculis enim fermentum. Vivamus quis nulla tincidunt, congue velit interdum, sagittis lectus. Integer imperdiet, ante non venenatis semper, nulla nisi convallis tortor, ut porttitor lorem mi nec orci. Etiam id condimentum mauris.
hasellus tempus sit amet lectus sed tincidunt. Mauris egestas volutpat diam eget convallis. Etiam sit amet ante finibus, finibus lectus sit amet, imperdiet diam. Vivamus vestibulum est nec lacus egestas sollicitudin. Sed fringilla malesuada pellentesque. Quisque in vulputate urna. Proin iaculis sem ut tincidunt condimentum. Ut urna massa, sollicitudin ac vehicula sed, vestibulum non nisi. Mauris iaculis lacinia dolor, id varius sem luctus sed. Vestibulum non mauris sagittis mauris porttitor luctus."
EOF

str.camelcase_regex
# => "Lorem00000ipsumDolor_sitAmetConsecteturAdipiscingElitPraesentAugueVelitAliquetVelSollicitudinVelEfficiturEtAugueQuisqueASemSodalesAccumsanLoremAcRhoncusLoremVestibulumUltricesDolorInDuiPulvinarEgetSagittisMagnaAliquetDonecDapibusInLoremVelMalesuadaUtSuscipitImperdietVenenatisUtGravidaLoremNibhVelCursusNullaFinibusNonFusceAtLoremTinciduntConsequatJustoAcCommodoLoremMaurisEuLigulaSollicitudinPellentesqueEratAccumsanRutrumQuamCrasMaximusFaucibusMassaTinciduntLaciniaLacusCursusAcCurabiturFelisEratTinciduntAAliquamNonSemperScelerisqueLeoInPellentesqueMollisGravidaVestibulumSemperAccumsanNullaMaurisVelMetusSollicitudinHendreritMiDictumDignissimMagnaNullamTinciduntDapibusMetusSedLaciniaAugueVolutpatUltriciesProinBibendumEnimSedNequeLobortisVelIaculisEnimFermentumVivamusQuisNullaTinciduntCongueVelitInterdumSagittisLectusIntegerImperdietAnteNonVenenatisSemperNullaNisiConvallisTortorUtPorttitorLoremMiNecOrciEtiamIdCondimentumMaurisHasellusTempusSitAmetLectusSedTinciduntMaurisEgestasVolutpatDiamEgetConvallisEtiamSitAmetAnteFinibusFinibusLectusSitAmetImperdietDiamVivamusVestibulumEstNecLacusEgestasSollicitudinSedFringillaMalesuadaPellentesqueQuisqueInVulputateUrnaProinIaculisSemUtTinciduntCondimentumUtUrnaMassaSollicitudinAcVehiculaSedVestibulumNonNisiMaurisIaculisLaciniaDolorIdVariusSemLuctusSedVestibulumNonMaurisSagittisMaurisPorttitorLuctus.\"\n"

require 'benchmark/ips'

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(time: 5, warmup: 2)

  # Typical mode, runs the block as many times as it can
  x.report("linear") { str.camelcase_linear }
  x.report("array")  { str.camelcase_array  }
  x.report("array2") { str.camelcase_array2 }
  x.report("regex")  { str.camelcase_regex  }
  x.report("regex2") { str.camelcase_regex2 }

  x.compare!
end
# >> Calculating -------------------------------------
# >>               linear   119.000  i/100ms
# >>                array     2.963k i/100ms
# >>               array2    82.000  i/100ms
# >>                regex   350.000  i/100ms
# >>               regex2   330.000  i/100ms
# >> -------------------------------------------------
# >>               linear      1.198k (± 6.4%) i/s -      6.069k
# >>                array     30.752k (± 5.5%) i/s -    154.076k
# >>               array2    818.688  (± 4.4%) i/s -      4.100k
# >>                regex      3.494k (± 5.4%) i/s -     17.500k
# >>               regex2      3.311k (± 4.7%) i/s -     16.830k
# >> 
# >> Comparison:
# >>                array:    30752.1 i/s
# >>                regex:     3493.6 i/s - 8.80x slower
# >>               regex2:     3310.6 i/s - 9.29x slower
# >>               linear:     1197.6 i/s - 25.68x slower
# >>               array2:      818.7 i/s - 37.56x slower
# >> 
