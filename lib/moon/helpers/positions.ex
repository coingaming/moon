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

  def position_class("top-start"), do: "bottom-full ltr:left-0 rtl:right-0 mb-2"
  def position_class("top"), do: "bottom-full left-1/2 mb-2 -translate-x-1/2"
  def position_class("top-end"), do: "bottom-full ltr:right-0 rtl:left-0 mb-2"
  def position_class("bottom-start"), do: "top-full ltr:left-0 rtl:right-0 mt-2"
  def position_class("bottom"), do: "top-full left-1/2 mt-2 -translate-x-1/2"
  def position_class("bottom-end"), do: "top-full ltr:right-0 rtl:left-0 mt-2"
  def position_class("right-start"), do: "ltr:left-full rtl:right-full top-0 ltr:ml-2 rtl:mr-2"
  def position_class("right"), do: "ltr:left-full rtl:right-full top-1/2  ltr:ml-2 rtl:mr-2 -translate-y-1/2"
  def position_class("right-end"), do: "ltr:left-full rtl:right-full bottom-0 ltr:ml-2 rtl:mr-2"
  def position_class("left-start"), do: "ltr:right-full rtl:left-full top-0 ltr:mr-2 rtl:ml-2"
  def position_class("left"), do: "ltr:right-full rtl:left-full top-1/2 ltr:mr-2 rtl:ml-2 -translate-y-1/2"
  def position_class("left-end"), do: "ltr:right-full rtl:left-full bottom-0 ltr:mr-2 rtl:ml-2"
  def position_class(_), do: ""
end
