defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    letters = 
      sentence 
      |> String.downcase 
      |> String.replace(~r/[^a-z]/, "") 
      |> String.graphemes
    
    (letters |> Enum.uniq |> length) ==  (letters |> length)
  end
end
