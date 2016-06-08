# crypto_square.rb
require 'pry'

class Crypto
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    message.gsub(/\W+/, "").downcase
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    cipher = ""
    source = plaintext_segments.map { |x| x.split("") }
    while source.join("").length > 0
      source.each do |segment|
        if !segment.empty?
          cipher << segment.shift
        end
      end
    end
    cipher
  end

  def normalize_ciphertext
    segments = plaintext_segments
    cipher_segments = []

    while segments.last.length < segments.first.length
      segments.last << " "
    end

    counter = 0
    segments.first.length.times do
      phrase = ""
      segments.each do |segment|
        phrase << segment.split("")[counter]
      end
      cipher_segments << phrase.rstrip
      counter += 1
    end

    cipher_segments.join(" ")
  end
end

crypty = Crypto.new("I shot the sheriff, but I did not shoot the deputy.")
crypty.normalize_ciphertext
