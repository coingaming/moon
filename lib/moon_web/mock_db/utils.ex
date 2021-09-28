defmodule MoonWeb.MockDB.Utils do
  @moduledoc false

  def random_id do
    Faker.random_between(100_000, 999_999)
  end

  def get_random_item(items) do
    Enum.fetch!(items, Faker.random_between(0, length(items) - 1))
  end

  def take_page(list, offset, limit) do
    if length(list) - limit * offset > 0 do
      l = list |> Enum.take(limit * (offset + 1))
      l |> Enum.take(offset * limit - length(l))
    else
      []
    end
  end
end
