# minesweeper.rb

class Board
  def self.transform(input)
    self.check_for_input_errors(input)

    output = []
    line_counter = 0

    input.each do |line|
      transformed_line = ""

      line.chars.each do |square|
        if !input[line_counter + 1].nil?
          square_counter = line.chars.index(square)
          adjacent_mines = 0
          adjacent_squares =
          [
            input[line_counter - 1][square_counter - 1],
            input[line_counter - 1][square_counter],
            input[line_counter - 1][square_counter + 1],
            input[line_counter][square_counter - 1],
            input[line_counter][square_counter + 1],
            input[line_counter + 1][square_counter - 1],
            input[line_counter + 1][square_counter],
            input[line_counter + 1][square_counter + 1]
          ]
          if square == " "
            adjacent_mines = adjacent_squares.count("*")
            if adjacent_mines > 0
              line[square_counter] = adjacent_mines.to_s
            else
              line[square_counter] = "!"
            end
          end
          transformed_line = line
        end
      end
      line_counter += 1
      while transformed_line.include?("!")
        transformed_line["!"] = " "
      end
      output << transformed_line
    end
    output.pop
    output << input.last
    output
  end

  def self.check_for_input_errors(input)
    raise(ValueError) unless input.map(&:length).uniq.size == 1
    raise(ValueError) unless input.first == input.last
    raise(ValueError) unless input.join.chars.select { |character| !["+", "-", "|", " ", "*"].include?(character) }.empty?
  end
end

class ValueError < StandardError
end
