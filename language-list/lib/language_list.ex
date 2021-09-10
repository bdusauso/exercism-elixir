defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_language | rest]), do: rest

  def first([language | _rest]), do: language

  def count(list), do: length(list)

  def exciting_list?(list), do: Enum.any?(list, &(&1 == "Elixir"))
end
