defmodule RNATranscription do
  @transcription_table %{
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna 
    |> String.Chars.to_string 
    |> String.graphemes
    |> Enum.map(&Map.fetch!(@transcription_table, &1))
    |> Enum.join
    |> String.to_charlist
  end
end
