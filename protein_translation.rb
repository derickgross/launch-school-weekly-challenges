# protein_translation.rb

require 'pry'

class Translation
  TRANSLATION_KEY = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  def self.of_codon(codon)
    TRANSLATION_KEY[codon]
  end

  def self.of_rna(strand)
    strand_codons = strand.scan(/.{3}/)
    amino_acids = []

    strand_codons.each do |codon|
      fail InvalidCodonError unless TRANSLATION_KEY.keys.include?(codon)
      break if TRANSLATION_KEY[codon] == "STOP"
      amino_acids << TRANSLATION_KEY[codon]
    end

    amino_acids
  end
end

class InvalidCodonError < StandardError
end
