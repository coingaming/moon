defmodule Moon.Light.TableTest do
  use ExUnit.Case, async: true

  alias Moon.Light.Table.Helper

  describe "sort_items/2" do
    test "sort by letter string" do
      items = [%{letter: "B"}, %{letter: "A"}, %{letter: "a"}, %{letter: "b"}]

      assert [%{letter: "A"} | _rest] = Helper.sort_items(items, [letter: "ASC"])
      assert [%{letter: "b"} | _rest] = Helper.sort_items(items, [letter: "DESC"])
    end
  end
end
