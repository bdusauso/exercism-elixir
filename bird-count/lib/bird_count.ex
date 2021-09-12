defmodule BirdCount do
  def today([]), do: nil
  def today([today | _days]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | days]), do: [today + 1 | days]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_today | days]), do: has_day_without_birds?(days)

  def total([]), do: 0
  def total([today | days]), do: today + total(days)

  def busy_days([]), do: 0
  def busy_days([today | days]) when today >= 5, do: 1 + busy_days(days)
  def busy_days([_ | days]), do: busy_days(days)
end
