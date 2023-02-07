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

  def position_class(position) do
    case position do
      "top-start" -> "bottom-full left-0 mb-2"
      "top" -> "bottom-full left-1/2 mb-2 -translate-x-1/2"
      "top-end" -> "bottom-full right-0 mb-2"
      "bottom-start" -> "top-full left-0 mt-2"
      "bottom" -> "top-full left-1/2 mt-2 -translate-x-1/2"
      "bottom-end" -> "top-full right-0 mt-2"
      "right-start" -> "left-full top-0    ml-2"
      "right" -> "left-full top-1/2  ml-2 -translate-y-1/2"
      "right-end" -> "left-full bottom-0 ml-2"
      "left-start" -> "right-full top-0 mr-2"
      "left" -> "right-full top-1/2 mr-2 -translate-y-1/2"
      "left-end" -> "right-full bottom-0 mr-2"
      _ -> ""
    end
  end
end
