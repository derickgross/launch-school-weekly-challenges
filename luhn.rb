# luhn.rb

require 'pry'

class Luhn
  attr_reader :number

  def initialize(input)
    @number = input
  end

  def number_string
    number.to_s
  end

  def reversed_number_string
    number_string.reverse
  end

  def reversed_number
    reversed_number_string.to_i
  end

  def reversed_number_digit_array
    reversed_number_string.split("").map(&:to_i)
  end

  def addends
    doubled_array = reversed_number_digit_array.map.with_index { |digit, index| index.even? ? digit : digit * 2 }.reverse

    doubled_array.map { |x| x >= 10 ? x - 9 : x }
  end

  def double_every_other
    reversed_number_string.split("")
      .map.with_index { |digit, index| index.even? ? digit * 2 : digit }
      .reverse.join
  end

  def checksum
    addends.inject { |sum, x| sum + x }
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    loony = Luhn.new(number * 10)
    new_number = loony.number
    if !loony.valid?
      new_number += (10 - (loony.checksum % 10))
    end
    new_number
  end
end
