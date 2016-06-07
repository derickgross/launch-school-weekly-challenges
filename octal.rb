# octal.rb
require 'pry'

class Octal
  attr_reader :octal

  def initialize(octal)
    @octal = octal.to_i
  end

  def to_decimal
    map_conversion.reduce(:+)
  end

  def reverser # create an array of the digits in octal in reverse order
    octal.to_s.split("").reverse.map(&:to_i)
  end

  def convert(digit, exponent)
    digit * 8**exponent
  end

  def map_conversion
    validate.map.with_index { |digit, index| convert(digit, index) }
  end

  def validate
    v = reverser.map { |x| x >= 8 ? 0 : x }
    v == reverser ? v : [0]
  end
end

p Octal.new('abc1z').validate