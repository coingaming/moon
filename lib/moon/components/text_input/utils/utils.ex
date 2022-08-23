defmodule Moon.Components.TextInput.Utils do
  @moduledoc false

  def get_border_radius(size) do
    case size do
      "xl" -> "rounded-moon-i-md"
      "lg" -> "rounded-moon-i-sm"
      _ -> "rounded-moon-i-sm"
    end
  end

  def make_side_border(is_side_border_hidden, is_first, is_rtl) do
    cond do
      is_side_border_hidden && is_rtl -> make_side_border_rtl(is_first)
      is_side_border_hidden && !is_rtl -> make_side_border_ltr(is_first)
      true -> ""
    end
  end

  def make_side_border_rtl(is_first) do
    cond do
      is_first -> "input-lsb-hidden"
      true -> "input-rsb-hidden"
    end
  end

  def make_side_border_ltr(is_first) do
    cond do
      is_first -> "input-rsb-hidden"
      true -> "input-lsb-hidden"
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
