defmodule Moon.Design.Avatar.Status do
  @moduledoc false

  use Moon.StatelessComponent, slot: "status"

  @doc "Position for status indicator. Vertical options: bottom | top. Horizontal options: left | right. Default is bottom-right"
  prop(position, :map)
  @doc "Will be got from Avatar in most cases"
  prop(size, :string, from_context: :size)
  @doc "Tailwind classes for customization"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Id of the component"
  prop(id, :string)

  def render(assigns) do
    default_position = %{vertical: "bottom", horizontal: "right"}
    position = Map.merge(default_position, assigns.position || %{})

    ~F"""
    <div
      {=@id}
      class={[
        merge([
          [
            "absolute border-gohan rounded-full bg-roshi",
            "top-0": position.vertical == "top",
            "bottom-0": position.vertical == "bottom",
            "left-0": position.horizontal == "left",
            "right-0": position.horizontal == "right",
            "w-2 h-2": @size == "xs",
            "w-3 h-3": @size == "sm" || @size == "md",
            "w-4 h-4": @size == "lg" || @size == "xl" || @size == "2xl"
          ],
          @class
        ]),
        "border-solid",
        border: @size == "xs",
        "border-2": @size == "sm" || @size == "md",
        "border-2": @size == "lg" || @size == "xl" || @size == "2xl"
      ]}
      data-testid={@testid}
    />
    """
  end
end
