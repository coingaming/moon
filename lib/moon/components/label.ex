defmodule Moon.Components.Label do
  @moduledoc false

  use Moon.StatelessComponent

  prop color, :css_class, default: "bg-gohan-100"
  prop background_color, :css_class, default: "bg-bulma-100"
  prop size, :string, default: "xsmall", values: ~w(twoxsmall xsmall)
  prop class, :string
  prop is_uppercase, :boolean, default: true
  prop border_radius_class, :string, default: "rounded-sm"

  slot default
  slot left_icon
  slot right_icon

  def render(assigns) do
    ~F"""
    <span class={
      "flex items-center align-middle",
      @border_radius_class,
      @class,
      set_letter_spacing(@size),
      set_y_padding(@size, @left_icon, @right_icon),
      set_l_padding(@size, @left_icon),
      set_r_padding(@size, @right_icon),
      set_font_size(@size, @is_uppercase),
      "bg-#{@background_color} text-#{@color}",
      @background_color,
      @color,
      uppercase: @is_uppercase
    }>
      <span class={"items-center mr-1": @left_icon}>
        <#slot name="left_icon" />
      </span>
      <#slot />

      <span class={"items-center ml-1": @right_icon}>
        <#slot name="right_icon" />
      </span>
    </span>
    """
  end

  defp set_letter_spacing(size) do
    case size do
      "twoxsmall" -> "tracking-[0.5px]"
      _ -> "tracking-[1px]"
    end
  end

  defp set_y_padding(size, left_icon, right_icon) do
    case size do
      "twoxsmall" ->
        "py-0"

      _ ->
        "#{((right_icon || left_icon) && "py-0") || "py-1"}"
    end
  end

  defp set_l_padding(size, left_icon) do
    case size do
      "twoxsmall" ->
        "#{(left_icon && "pl-1") || "pl-2"}"

      _ ->
        "#{(left_icon && "pl-1") || "pl-2"}"
    end
  end

  defp set_r_padding(size, right_icon) do
    case size do
      "twoxsmall" ->
        "#{(right_icon && "pr-1") || "pr-2"}"

      _ ->
        "#{(right_icon && "pr-1") || "pr-2"}"
    end
  end

  defp set_font_size(size, is_uppercase) do
    if is_uppercase do
      case size do
        "twoxsmall" -> "text-moon-9"
        _ -> "text-moon-10"
      end
    else
      case size do
        "twoxsmall" -> "text-moon-10"
        _ -> "text-moon-12"
      end
    end
  end
end
