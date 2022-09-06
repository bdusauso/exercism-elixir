defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    iterate(list, [], fun)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    not_fun = fn elem -> !(fun.(elem)) end
    iterate(list, [], not_fun)
  end

  defp iterate([], acc, _fun), do: Enum.reverse(acc)
  defp iterate([h | t], acc, fun) do
    if fun.(h),
      do: iterate(t, [h | acc], fun),
      else: iterate(t, acc, fun)
  end
end
