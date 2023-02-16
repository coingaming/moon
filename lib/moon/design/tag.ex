defmodule Moon.Design.Tag do
  @moduledoc false

  use Moon.StatelessComponent

  prop(size, :string, default: "xs", values: ~w(2xs xs))
  prop(class, :css_class)
  prop(is_uppercase, :boolean, default: true)

  slot(default)
  slot(left_icon)
  slot(right_icon)

  def render(assigns) do
    ~F"""
    <div class={
      merge([
        "flex items-center rounded-moon-i-xs select-none text-gohan bg-bulma",
        set_letter_spacing(@size),
        set_y_padding(@size, @left_icon, @right_icon),
        set_start_padding(@size, @left_icon),
        set_end_padding(@size, @right_icon),
        set_font_size(@size, @is_uppercase),
        @class
      ]),
      uppercase: @is_uppercase
    }>
      <span class={icon_size(@size), "ltr:mr-1 rtl:ml-1": @left_icon}>
        <#slot {@left_icon} />
      </span>
      <#slot />
      <span class={icon_size(@size), "ltr:ml-1 rtl:mr-1": @right_icon}>
        <#slot {@right_icon} />
      </span>
    </div>
    """
  end

  defp icon_size(size) do
    case size do
      "2xs" -> "text-moon-14 leading-none"
      _ -> "text-moon-16 leading-none"
    end
  end

  defp set_letter_spacing(size) do
    case size do
      "2xs" -> "tracking-[0.5px]"
      _ -> "tracking-[0.5px]"
    end
  end

  defp set_y_padding(size, left_icon, right_icon) do
    case size do
      "2xs" ->
        "py-0"

      _ ->
        "#{((right_icon || left_icon) && "py-1") || "py-1"}"
    end
  end

  defp set_start_padding(size, left_icon) do
    case size do
      "2xs" ->
        "#{(left_icon && "ps-1") || "ps-2"}"

      _ ->
        "#{(left_icon && "ps-1") || "ps-2"}"
    end
  end

  defp set_end_padding(size, right_icon) do
    case size do
      "2xs" ->
        "#{(right_icon && "pe-1") || "pe-2"}"

      _ ->
        "#{(right_icon && "pe-1") || "pe-2"}"
    end
  end

  defp set_font_size(size, is_uppercase) do
    if is_uppercase do
      case size do
        "2xs" -> "text-moon-9 font-medium"
        _ -> "text-moon-10 font-medium"
      end
    else
      case size do
        "2xs" -> "text-moon-10 tracking-0"
        _ -> "text-moon-12 tracking-0"
      end
    end
  end
end
