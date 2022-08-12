defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(num) do
    prime_factors(num, [])
  end

  defp prime_factors(1, acc), do: Enum.reverse(acc)
  defp prime_factors(num, acc) do
    next = first_prime_factor(num, 2)
    prime_factors(div(num, next), [next | acc])
  end

  defp first_prime_factor(num, factor) do
    cond do
      factor == 1 -> 1
      rem(num, factor) == 0 && prime?(factor) -> factor
      true -> first_prime_factor(num, factor + 1)
    end
  end

  defp prime?(2), do: true
  defp prime?(number) do
    upper = (number |> :math.sqrt() |> trunc) + 1
    Enum.all?((2..upper), & rem(number, &1) != 0)
  end
end
