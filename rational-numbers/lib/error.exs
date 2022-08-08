defmodule RationalError do
  @type rational :: {integer, integer}

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a1, b1}) do
    {Kernel.abs(a1), Kernel.abs(b1)}
  end
end

RationalError.abs({-1, 2})
