defmodule Moon.Components.TextInput.Utils do
  @moduledoc false

  def get_border_radius(size) do
    case size do
      "xl" -> "rounded-moon-i-md"
      "lg" -> "rounded-moon-i-sm"
      _ -> "rounded-moon-i-sm"
    end
  end

  def get_size_styles(size) do
    case size do
      "xl" ->
        "h-14 leading-[3.5rem] rounded-moon-i-md hover:rounded-moon-i-md focus:rounded-moon-i-md invalid:rounded-moon-i-md"

      "lg" ->
        "h-12 leading-[3rem] rounded-moon-i-sm hover:rounded-moon-i-sm focus:rounded-moon-i-sm invalid:rounded-moon-i-sm"

      _ ->
        "h-10 leading-10 rounded-moon-i-sm hover:rounded-moon-i-sm focus:rounded-moon-i-sm invalid:rounded-moon-i-sm"
    end
  end

  def make_border_left(
        is_side_border_hidden,
        is_first,
        is_rtl
      ) do
    cond do
      is_side_border_hidden && is_rtl && is_first -> "input-lsb-hidden"
      is_side_border_hidden -> "input-lsb-hidden"
      true -> ""
    end
  end

  def make_border_right(
        is_side_border_hidden,
        is_first,
        is_rtl
      ) do
    cond do
      is_side_border_hidden && is_rtl -> "input-rsb-hidden"
      is_side_border_hidden && is_first -> "input-rsb-hidden"
      true -> ""
    end
  end

  def make_border_top_bottom(
        is_top_bottom_border_hidden,
        is_first
      ) do
    cond do
      is_top_bottom_border_hidden && is_first -> "input-bbb-hidden"
      is_top_bottom_border_hidden -> "input-tbb-hidden"
      true -> ""
    end
  end
end
