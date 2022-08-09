defmodule DNA do
  def encode_nucleotide(?\s), do: 0b0000
  def encode_nucleotide(?A),  do: 0b0001
  def encode_nucleotide(?C),  do: 0b0010
  def encode_nucleotide(?G),  do: 0b0100
  def encode_nucleotide(?T),  do: 0b1000

  def decode_nucleotide(0b0000), do: ?\s
  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T

  def encode([nucl|dna]) do
    <<encode_nucleotide(nucl)::4, encode(dna)::bitstring>>
  end
  def encode([]), do: <<>>

  def decode(<<nucl::4, dna::bitstring>>) do
    [decode_nucleotide(nucl) | decode(dna)]
  end
  def decode(<<>>), do: []
end
