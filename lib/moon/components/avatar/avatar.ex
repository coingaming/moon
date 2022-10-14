defmodule Moon.Components.Avatar do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon
  alias Moon.Components.Avatar.StatusOrigin

  prop image_url, :string
  prop name, :string
  prop color, :css_class, default: "text-bulma-100"
  prop bg_color, :css_class, default: "bg-gohan-100"
  prop is_uppercase, :boolean, default: true

  prop size, :string, default: "md", values: ~w(xs sm md lg xl 2xl)

  prop class, :css_class
  prop is_status_active, :boolean, default: false
  prop status_origin, :struct, default: %StatusOrigin{vertical: "bottom", horizontal: "right"}
  prop is_rounded, :boolean, default: false

  def style(assigns) do
    "background-image: url(#{assigns.image_url});"
  end

  def render(assigns) do
    ~F"""
    <div
      class={
        "bg-cover justify-center flex font-semibold items-center overflow-hidden relative",
        @bg_color,
        @color,
        set_border_radius(@size, @is_rounded),
        @class,
        uppercase: @is_uppercase,
        "text-moon-12 h-6 w-6": @size == "xs",
        "text-moon-14 h-8 w-8": @size == "sm",
        "text-moon-16 h-10 w-10": @size == "md",
        "text-moon-18 h-12 w-12": @size == "lg",
        "text-moon-20 h-14 w-14": @size == "xl",
        "text-moon-24 h-16 w-16": @size == "2xl"
      }
      style={style(assigns)}
      data-size={@size}
    >
      <span :if={@name && !@image_url}>{@name}</span>
      <Icon name="generic_user" class={icon_class(@size)} :if={!@name && !@image_url} />
      <div
        :if={@status_origin && @is_status_active}
        class={
          "absolute border-solid color-beerus-100 rounded-full bg-roshi-100",
          "top-0": @status_origin.vertical == "top",
          "bottom-0": @status_origin.vertical == "bottom",
          "left-0": @status_origin.horizontal == "left",
          "right-0": @status_origin.horizontal == "right",
          "w-2 h-2 border": @size == "xs",
          "w-3 h-3 border-2": @size == "sm" || @size == "md",
          "w-4 h-4 border-2": @size == "lg" || @size == "xl" || @size == "2xl"
        }
      />
    </div>
    """
  end

  defp icon_class("xs"), do: "h-4 w-4"
  defp icon_class("sm"), do: "h-5 w-5"
  defp icon_class("md"), do: "h-6 w-6"
  defp icon_class("lg"), do: "h-7 w-7"
  defp icon_class("xl"), do: "h-14 w-14"
  defp icon_class("2xl"), do: "h-16 w-16"

  defp set_border_radius(size, is_rounded) do
    cond do
      is_rounded ->
        "rounded-full"

      size == "xs" ->
        "rounded-moon-i-xs"

      size == "2xl" ->
        "rounded-moon-i-md"

      true ->
        "rounded-moon-i-sm"
    end
  end
end
