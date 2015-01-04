defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do

    split = &(Regex.split ~r/[^\w-]|_/u, &1, trim: true)

    sentence
      |> String.downcase
      |> split.()
      |> Enum.reduce(%{}, fn word, words -> Map.update(words, word, 1, fn count -> count + 1 end) end)
  end
end
