defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    list = Tuple.to_list(numbers)
    binary_search(list, key, 0, length(list) - 1)
  end

  defp binary_search(_, _, lower, upper) when lower > upper, do: :not_found

  defp binary_search(numbers, key, lower, upper) do
    middle = div(lower + upper, 2)

    cond do
      Enum.at(numbers, middle) == key -> {:ok, middle}
      Enum.at(numbers, middle) > key -> binary_search(numbers, key, lower, middle - 1)
      Enum.at(numbers, middle) < key -> binary_search(numbers, key, middle + 1, upper)
    end
  end
end
