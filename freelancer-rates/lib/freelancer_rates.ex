defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - (discount / 100))
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate = daily_rate(hourly_rate) * 22

    daily_rate
    |> apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_rate = apply_discount(hourly_rate, discount)

    Float.floor(budget / daily_rate(discounted_rate), 1)
  end
end
