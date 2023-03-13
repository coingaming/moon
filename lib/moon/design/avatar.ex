defmodule Moon.Design.Avatar do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icon
  alias Moon.Components.Avatar.StatusOrigin

  prop(image_url, :string)
  prop(name, :string)
  prop(size, :string, default: "md", values: ~w(xs sm md lg xl 2xl))
  prop(color, :css_class, default: "text-bulma")
  prop(bg_color, :css_class, default: "bg-gohan")
  prop(is_rounded, :boolean, default: false)
  prop(is_status_active, :boolean, default: false)
  prop(status_origin, :struct, default: %StatusOrigin{vertical: "bottom", horizontal: "right"})

  prop(class, :css_class)
  prop(test_id, :string)

  def style(assigns) do
    "background-image: url(#{assigns.image_url});"
  end

  def render(assigns) do
    ~F"""
    <div
      class={merge([
        [
          "overflow-hidden uppercase font-medium flex items-center justify-center bg-cover relative",
          @bg_color,
          @color,
          set_border_radius(@size, @is_rounded),
          "text-moon-10-caption h-6 w-6": @size == "xs",
          "text-moon-12 h-8 w-8": @size == "sm",
          "text-moon-14 h-10 w-10": @size == "md",
          "text-moon-16 h-12 w-12": @size == "lg",
          "text-moon-16 h-14 w-14": @size == "xl",
          "text-moon-20 h-16 w-16": @size == "2xl"
        ],
        @class
      ])}
      style={style(assigns)}
      data-testid={@test_id}
    >
      <span :if={@name && !@image_url}>{@name}</span>
      <Icon name="generic_user" class={set_icon_size(@size)} :if={!@name && !@image_url} />
      <div
        :if={@status_origin && @is_status_active}
        class={
          "absolute border-solid color-beerus rounded-full bg-roshi",
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

  defp set_icon_size(size) do
    cond do
      size == "xs" -> "text-moon-16"
      size == "2xl" -> "text-moon-32"
      true -> "text-moon-24"
    end
  end

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
