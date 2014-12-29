defmodule Teenager do
  def hey(input) do
    cond do
      String.strip(input) == ""
        -> "Fine. Be that way!"
      String.ends_with?(input, "?")
        -> "Sure."
      Regex.match?(~r/[\d,]*\d{1}$/, input)
        -> "Whatever."
      String.upcase(input) == input
        -> "Woah, chill out!"
      true
        -> "Whatever."
    end
  end
end
