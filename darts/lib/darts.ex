defmodule Darts do
  @type position :: {number, number}

  @outer_radius 10
  @middle_radius 5
  @inner_radius 1

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance = :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))

    cond do
      distance > @outer_radius -> 0
      distance > @middle_radius -> 1
      distance > @inner_radius -> 5
      true -> 10
    end
  end
end
