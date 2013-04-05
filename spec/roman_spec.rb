#encoding: UTF-8
require 'roman'

describe Roman do
  NUMBER_TO_ROMAN = {
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V",
    6 => "VI",
    7 => "VII",
    8 => "VIII",
    9 => "IX",
    10 => "X",
    11 => "XI",
    12 => "XII",
    13 => "XIII",
    14 => "XIV",
    15 => "XV",
    16 => "XVI",
    17 => "XVII",
    18 => "XVIII",
    19 => "XIX",
    20 => "XX",
    40 => "XL",
    41 => "XLI",
    42 => "XLII",
    43 => "XLIII",
    44 => "XLIV",
    45 => "XLV",
    46 => "XLVI",
    47 => "XLVII",
    48 => "XLVIII",
    49 => "XLIX",
    50 => "L",
    90 => "XC",
    91 => "XCI",
    92 => "XCII",
    93 => "XCIII",
    94 => "XCIV",
    95 => "XCV",
    96 => "XCVI",
    97 => "XCVII",
    98 => "XCVIII",
    99 => "XCIX",
    100 => "C",
    200 => "CC",
    300 => "CCC",
    400 => "CD",
    500 => "D",
    600 => "DC",
    700 => "DCC",
    800 => "DCCC",
    900 => "CM",
    1000 => "M"
  }

  before(:each) do
    @roman = Roman.new
  end

  it "Deve ter chaves especificas" do
    @roman.letters.keys.should == %w(I V X L C D M P A S T O R)
  end

  it "A letra 'I' corresponde a 1" do
    @roman.letters["I"].should == 1
  end

  it "A letra 'V' corresponde a 5" do
    @roman.letters["V"].should == 5
  end

  it "A letra 'X' corresponde a 10" do
    @roman.letters["X"].should == 10
  end

  it "A letra 'L' corresponde a 50" do
    @roman.letters["L"].should == 50
  end

  it "A letra 'C' corresponde a 100" do
    @roman.letters["C"].should == 100
  end

  it "A letra 'D' corresponde a 500" do
    @roman.letters["D"].should == 500
  end

  it "A letra 'M' corresponde a 1000" do
    @roman.letters["M"].should == 1000
  end

  it "Deve ter uma relação inversa" do
    @roman.numbers.should == {
      1 => "I",
      4 => "P",
      5 => "V",
      9 => "A",
      10 => "X",
      40 => "S",
      50 => "L",
      90 => "T",
      100 => "C",
      400 => "O",
      500 => "D",
      900 => "R",
      1000 => "M"
    }
  end

  context "Converter números para romanos" do
    NUMBER_TO_ROMAN.each do |key, value|
      it "converter #{key}" do
        @roman.convert_number_to_roman(key).should == value
      end
    end
  end

  context "Converter romanos para numeros" do
    NUMBER_TO_ROMAN.each do |key, value|
      it "converter #{value}" do
        @roman.convert_roman_to_number(value).should == key
      end
    end
  end


# I = 1
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000
end