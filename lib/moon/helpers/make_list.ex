defmodule Moon.Helpers.MakeList do
  @moduledoc false

  import Enum, only: [with_index: 1, map: 2]
  import Map, only: [merge: 2]

  def make_list(nil), do: []
  def make_list(l) when is_list(l), do: l
  def make_list(l), do: [l]

  @doc "Adds list index as key to the list-item map"
  def add_index_as(list, key \\ :id) do
    with_index(list) |> map(fn {item, index} -> merge(%{key => index}, item) end)
  end
end
