defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([])     ,do: 0
  def count([_ | t]), do: count(t) + 1

  @spec reverse(list) :: list
  def reverse(l), do: _reverse(l, [])
  defp _reverse([],       acc), do: acc 
  defp _reverse([h | t],  acc), do: _reverse(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map([],      f), do: []
  def map([h | t], f), do: [f.(h) | map(t, f)] 

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: _filter(l, f, [])
  defp _filter([],      f, acc), do: reverse(acc)
  defp _filter([h | t], f, acc) do
    if f.(h) do
      acc = [h | acc]
    end 
    _filter(t, f, acc)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([]     , acc, f), do: acc
  def reduce([h | t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
    _append(reverse(a), b)     
  end
  defp _append([], b), do: b
  defp _append([h | t], b), do: _append(t, [h | b])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    _concat(reverse(ll), [])
  end
  defp _concat([],    acc), do: acc
  defp _concat([h|t], acc), do: _concat(t, append(h, acc))
  
end