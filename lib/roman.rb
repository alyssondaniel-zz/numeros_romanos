class Roman
  attr_reader :letters

  def initialize
    @letters = {
      "I" => 1,
      "V" => 5,
      "X" => 10,
      "L" => 50,
      "C" => 100,
      "D" => 500,
      "M" => 1000,
      "P" => 4,
      "A" => 9,
      "S" => 40,
      "T" => 90,
      "O" => 400,
      "R" => 900
    }
  end

  def numbers
    @letters.invert
  end

  def convert_number_to_roman(n)
    o = ""
    ot = ""
    nc = n.to_s.split("").reverse
    nc.each_with_index do |c, i|
      c = c.to_i
      if i == 0
        if c == 4
          ot = "IV"
        elsif c == 9
          ot = "IX"
        else  
          ot = ("I" * (c % 5))
          ot = "V#{ot}" if c > 4
        end
      elsif i == 1
        if c == 4
          ot = "XL"
        elsif c == 9
          ot = "XC"
        else  
          ot = ("X" * (c % 5))
          ot = "L#{ot}" if c > 4
        end
      elsif i == 2
        if c == 4
          ot = "CD"
        elsif c == 9
          ot = "CM"
        else  
          ot = ("C" * (c % 5))
          ot = "D#{ot}" if c > 4
        end
      elsif i == 3
        ot = ("M" * (c % 5))
      end
      o = "#{ot}#{o}"
    end 
    o
  end

  def convert_roman_to_number(r)
    n = 0
    s = r.gsub('IV','P')
    s = s.gsub('IX','A')
    s = s.gsub('XL','S')
    s = s.gsub('XC','T')
    s = s.gsub('CD','O')
    s = s.gsub('CM','R')
    chars = s.split("")
    chars.each do |c|
      n += letters[c]
    end
    n
  end


end