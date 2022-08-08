defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0, do: calc(input, 0)

  defp calc(1, steps), do: steps
  defp calc(n, steps) do
    next_n = if rem(n, 2) == 0, do: div(n, 2), else: 3 * n + 1
    calc(next_n, steps + 1)
  end
end
