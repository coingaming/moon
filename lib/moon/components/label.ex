defmodule Moon.Components.Label do
  @moduledoc false

  use Moon.StatelessComponent

  prop color, :string, default: "gohan-100", values: Moon.colors()
  prop background_color, :string, default: "bulma-100", values: Moon.colors()
  prop size, :string, default: "xsmall", values: ["twoxsmall", "xsmall"]
  prop class, :string
  prop is_uppercase, :boolean, default: true
  slot default
  slot left_icon
  slot right_icon

  def render(assigns) do
    ~F"""
    <span class={
      "flex rounded-sm items-center align-middle leading-4",
      set_letter_spacing(@size),
      set_padding(@size, @left_icon, @right_icon),
      set_font_size(@size, @is_uppercase),
      "#{@class} bg-#{@background_color} text-#{@color}",
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

  defp set_padding(size, left_icon, right_icon) do
    case size do
      "twoxsmall" ->
        "py-0 #{(right_icon && "pr-1") || "pr-2"} #{(left_icon && "pl-1") || "pl-2"}"

      _ ->
        "#{((right_icon || left_icon) && "py-0") || "py-1"} #{(right_icon && "pr-1") || "pr-2"} #{(left_icon && "pl-1") || "pl-2"}"
    end
  end

  defp set_font_size(size, is_uppercase) do
    if is_uppercase do
      case size do
        "twoxsmall" -> "text-[9px]"
        _ -> "text-[10px]"
      end
    else
      case size do
        "twoxsmall" -> "text-[10px]"
        _ -> "text-[12px]"
      end
    end
  end
end
