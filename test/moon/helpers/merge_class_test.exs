defmodule Moon.Helpers.MergeClassTest do
  use ExUnit.Case
  doctest Moon.Helpers.MergeClass

  import Moon.Helpers.MergeClass, only: [merge: 1]

  test "merges simple list" do
    merged = merge(["text-moon-11", "text-moon-22"])
    assert merged == "text-moon-22"
  end

  test "unmerges different" do
    merged = merge(["text-bulma", "text-moon-12"])
    assert merged == "text-bulma text-moon-12"
  end

  test "css_class data type" do
    merged = merge("text-moon-11": true, "text-moon-12": false)
    assert merged == "text-moon-11"
  end

  test "square brackets in class" do
    merged = merge(["top-[300px]", "top-12"])
    assert merged == "top-12"
  end

  test "minus in square brackets in class" do
    merged = merge(["top-[-300px]", "top-12"])
    assert merged == "top-12"
  end

  test "flex & flex-1 are different groups" do
    merged = merge(["flex", "flex-1"])
    assert merged == "flex flex-1"
  end

  test "positions should collapse" do
    merged = merge(["absolute", "relative"])
    assert merged == "relative"
  end

  test "background color should be overwritten" do
    merged = merge(["bg-piccolo", "bg-chichi-10"])
    assert merged == "bg-chichi-10"
  end

  test "border radius in class" do
    merged = merge(["rounded-moon-i-xs", "rounded-full"])
    assert merged == "rounded-full"
  end
end
