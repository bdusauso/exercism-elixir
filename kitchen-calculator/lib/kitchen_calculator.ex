defmodule KitchenCalculator do
  def get_volume({_unit, amount}), do: amount

  def to_milliliter({:cup, amount}), do: {:milliliter, 240 * amount}
  def to_milliliter({:fluid_ounce, amount}), do: {:milliliter, 30 * amount}
  def to_milliliter({:teaspoon, amount}), do: {:milliliter, 5 * amount}
  def to_milliliter({:tablespoon, amount}), do: {:milliliter, 15 * amount}
  def to_milliliter({:milliliter, _amount} = pair), do: pair

  def from_milliliter({:milliliter, amount}, :cup), do: {:cup, amount / 240}
  def from_milliliter({:milliliter, amount}, :fluid_ounce), do: {:fluid_ounce, amount / 30}
  def from_milliliter({:milliliter, amount}, :teaspoon), do: {:teaspoon, amount / 5}
  def from_milliliter({:milliliter, amount}, :tablespoon), do: {:tablespoon, amount / 15}
  def from_milliliter({:milliliter, _amount} = pair, :milliliter), do: pair

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
