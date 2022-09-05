defmodule NameBadge do
  def print(id, name, department) do
    name
    |> add_id(id)
    |> add_department(department)
  end

  defp add_id(badge, id) do
    if id,
      do: "[#{id}] - " <> badge,
      else: badge
  end

  defp add_department(badge, department) do
    if department,
      do: badge <> " - #{String.upcase(department)}",
      else: badge <> " - OWNER"
  end
end
