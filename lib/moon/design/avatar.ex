defmodule Moon.Design.Avatar do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Path to the image"
  prop(image_url, :string)
  @doc "Size of avatar"
  prop(size, :string, default: "md", values: ~w(xs sm md lg xl 2xl))
  @doc "Tailwind classes for customization"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Id of the component"
  prop(id, :string)
  @doc "Content of Avatar - use it to show icons or anything else"
  slot(default)
  @doc "Status indicator of Avatar, see Avatar.Status"
  slot(status)

  def style(assigns) do
    "background-image: url(#{assigns.image_url});"
  end

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={[
        merge([
          [
            "overflow-hidden uppercase font-medium flex items-center justify-center relative text-bulma bg-gohan",
            set_border_radius(@size),
            "text-moon-10-caption h-6 w-6": @size == "xs",
            "text-moon-12 h-8 w-8": @size == "sm",
            "text-moon-14 h-10 w-10": @size == "md",
            "text-moon-16 h-12 w-12": @size == "lg",
            "text-moon-16 h-14 w-14": @size == "xl",
            "text-moon-20 h-16 w-16": @size == "2xl"
          ],
          @class
        ]),
        "bg-cover"
      ]}
      style={style(assigns)}
      data-testid={@testid}
    >
      <#slot />
      <#slot
        {@status}
        context_put={
          size: @size
        }
      />
    </div>
    """
  end

  defp set_border_radius(size) do
    cond do
      size == "xs" ->
        "rounded-moon-i-xs"

      size == "2xl" ->
        "rounded-moon-i-md"

      true ->
        "rounded-moon-i-sm"
    end
  end
end
