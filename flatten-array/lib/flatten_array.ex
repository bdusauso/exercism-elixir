defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    flatten(list, [])
  end

  defp flatten([], acc), do: acc
  defp flatten([h | t], acc) when is_list(h), do: flatten(t, acc ++ flatten(h))
  defp flatten([nil | t], acc), do: flatten(t, acc)
  defp flatten([h | t], acc), do: flatten(t, acc ++ [h])
end
