defmodule Moon.Design.Tag.Utils do
  @moduledoc false

  def get_icon_size(size) do
    case size do
      "2xs" -> "text-moon-12"
      _ -> "text-moon-16"
    end
  end

  def get_tag_size(size) do
    case size do
      "2xs" -> "text-moon-9 h-4 py-0.5 px-2 rounded-moon-i-xs gap-1"
      "xs" -> "text-moon-10 h-6 py-1 px-2 rounded-moon-i-xs gap-1"
      "sm" -> "text-moon-10 h-8 py-2 px-4 rounded-moon-i-sm gap-2"
    end
  end

  def get_lowercase_font_size(size) do
    case size do
      "2xs" -> "text-moon-10 tracking-normal font-normal"
      _ -> "text-moon-12 tracking-normal font-normal"
    end
  end

  def get_right_icon_paddings(size) do
    case size do
      "2xs" -> "py-0.5 ps-2 pe-0.5"
      "xs" -> "py-1 ps-2 pe-1"
      "sm" -> "py-2 ps-4 pe-2"
    end
  end

  def get_left_icon_paddings(size) do
    case size do
      "2xs" -> "py-0.5 ps-0.5 pe-2"
      "xs" -> "py-1 ps-1 pe-2"
      "sm" -> "py-2 ps-2 pe-4"
    end
  end

  def get_both_icon_paddings(size) do
    case size do
      "2xs" -> "py-0.5 px-0.5"
      "xs" -> "p-1"
      "sm" -> "p-2"
    end
  end
end
