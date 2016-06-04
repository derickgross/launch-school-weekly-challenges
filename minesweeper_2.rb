# minesweeper_2.rb

class Board
  attr_reader :width, :input

  def initialize(input)
    @input = input
    @width = input.first.length
  end

  # check for errors
  # find mines
  # increment values of approximate spaces
  # return new values

  def self.transform(input)

  end

  def self.input_array(input)
    input.join.split("")
  end
end

class Space
  attr_accessor :value, :nearby_mines

  def initialize(value)
    @value = value
    @nearby_mines = 0
  end

  def find_nearby_mines

  end
end

input = ['+-----+', '|     |', '|   * |', '|     |', '|     |',
           '| *   |', '+-----+']

my_board = Board.new(input)

puts my_board.width

p Board.input_array(input)