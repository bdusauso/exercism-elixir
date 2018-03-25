defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    downcase_candidates = 
      candidates
      |> Enum.map(fn candidate -> {String.downcase(candidate), candidate} end)

    base_letters = base |> String.downcase|> String.graphemes|> Enum.sort
    
    downcase_candidates
    |> Enum.filter(fn {candidate, _} ->
      (candidate != String.downcase(base)) && 
      (candidate |> String.graphemes |> Enum.sort) == base_letters
    end)
    |> Enum.map(fn {_, original} -> original end)
  end
end
