defmodule RomanNumerals do
  def numeral(arabic), do:
    arabic
    |> Integer.digits()
    |> numeral("")

  defp numeral([a, b, c, d], acc), do: numeral([b, c, d], acc <> String.duplicate("M", a))
  defp numeral([b, c, d], acc), do: numeral([c, d], acc <> convert(b, ["C", "D", "M"]))
  defp numeral([c, d], acc), do: numeral([d], acc <> convert(c, ["X", "L", "C"]))
  defp numeral([d], acc), do: acc <> convert(d, ["I", "V", "X"])

  defp convert(n, [a, _, _]) when n in 0..3, do: String.duplicate(a, n)
  defp convert(4, [a, b, _]), do: "#{a}#{b}"
  defp convert(5, [_, b, _]), do: "#{b}"
  defp convert(n, [a, b, _]) when n in 6..8, do: "#{b}#{String.duplicate(a, n - 5)}"
  defp convert(9, [a, _, c]), do: "#{a}#{c}"
end
