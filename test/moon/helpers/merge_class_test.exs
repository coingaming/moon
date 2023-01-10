defmodule Moon.Helpers.MergeClassTest do
  use ExUnit.Case
  doctest Moon.Helpers.MergeClass

  import Moon.Helpers.MergeClass, only: [merge: 1]

  test "merges simple list" do
    merged = merge("moon-text-11 moon-text-22")
    assert merged == ["moon-text-22"]
  end

  test "unmerges different" do
    merged = merge("moon-text-11 text-bulma")
    assert merged == ["moon-text-11", "text-bulma"]
  end

  test "css_class data type" do
    merged = merge("text-moon-11": true, "text-moon-12": false)
    assert merged == ["text-moon-11"]
  end

  test "square brackets in class" do
    merged = merge(["top-[300px]", "top-12"])
    assert merged == ["top-12"]
  end

  test "minus in square brackets in class" do
    merged = merge(["top-[-300px]", "top-12"])
    assert merged == ["top-12"]
  end

  test "flex & flex-1 are different groups" do
    merged = merge(["flex", "flex-1"])
    assert merged == ["flex", "flex-1"]
  end
end
