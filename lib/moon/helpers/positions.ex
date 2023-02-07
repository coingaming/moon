defmodule Moon.Helpers.Positions do
  @moduledoc false

  def position_list() do
    [
      "top-start",
      "top",
      "top-end",
      "bottom-start",
      "bottom",
      "bottom-end",
      "right-start",
      "right",
      "right-end",
      "left-start",
      "left",
      "left-end"
    ]
  end

  def position_class("top-start"), do: "bottom-full left-0 mb-2"
  def position_class("top"), do: "bottom-full left-1/2 mb-2 -translate-x-1/2"
  def position_class("top-end"), do: "bottom-full right-0 mb-2"
  def position_class("bottom-start"), do: "top-full left-0 mt-2"
  def position_class("bottom"), do: "top-full left-1/2 mt-2 -translate-x-1/2"
  def position_class("bottom-end"), do: "top-full right-0 mt-2"
  def position_class("right-start"), do: "left-full top-0    ml-2"
  def position_class("right"), do: "left-full top-1/2  ml-2 -translate-y-1/2"
  def position_class("right-end"), do: "left-full bottom-0 ml-2"
  def position_class("left-start"), do: "right-full top-0 mr-2"
  def position_class("left"), do: "right-full top-1/2 mr-2 -translate-y-1/2"
  def position_class("left-end"), do: "right-full bottom-0 mr-2"
  def position_class(_), do: ""
end
