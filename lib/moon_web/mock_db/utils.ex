defmodule MoonWeb.MockDB.Utils do
  @sites ["BITCASINO", "SPORTSBET", "SLOTS"]

  def random_id() do
    Faker.random_between(100000, 999999)
  end

  def random_sites() do
    0..Faker.random_between(0, length(@sites) - 1)
    |> Enum.map(&(Enum.fetch!(@sites, &1)))
  end
end
