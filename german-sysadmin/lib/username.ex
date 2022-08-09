defmodule Char.Guards do
  defguard allowed?(value) when value >= ?a and value <= ?z or value == ?_
end

defmodule Username do
  import Char.Guards

  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
    sanitize(username, [])
  end

  defp sanitize([], sanitized), do: sanitized |> Enum.reverse()
  defp sanitize([?ü | rest], sanitized), do: sanitize(rest, [?e, ?u | sanitized])
  defp sanitize([?ö | rest], sanitized), do: sanitize(rest, [?e, ?o | sanitized])
  defp sanitize([?ä | rest], sanitized), do: sanitize(rest, [?e, ?a | sanitized])
  defp sanitize([?ß | rest], sanitized), do: sanitize(rest, [?s, ?s | sanitized])
  defp sanitize([char | rest], sanitized) do
    case char do
      char when allowed?(char) -> sanitize(rest, [char | sanitized])
      _ -> sanitize(rest, sanitized)
    end
  end
end
