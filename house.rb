# house.rb

class House
  attr_reader :house

  def self.recite
    @house = House.new
    @house.format
  end

  def format
    respected = <<-RHYME
#{self.create_rhyme_pieces}
    RHYME

    respected
  end

  def create_rhyme_pieces
    counter = -1
    poems = []

    12.times do
      piece = break_pieces[counter..-1].join(" ")
      poems << "This is " + piece + ".\n"
      counter -= 1
    end

    poems.join("\n").rstrip
  end

  def map_join(enumerable, string)
    result = []
    enumerable.each { |element| result << element.join(string) }
    result
  end

  def break_pieces
    map_join(send(:pieces), "\n")
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

House.recite