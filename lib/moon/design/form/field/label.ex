defmodule Moon.Design.Form.Field.Label do
  @moduledoc false

  use Moon.StatelessComponent

  prop(field, :atom)
  prop(for, :string)
  prop(class, :css_class)
  prop(size, :string, values!: ~w(sm md lg xl), default: "md")
  prop(title, :string)

  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Label
      field={@field}
      class={merge([
        "pb-2",
        (@size == "sm" && "text-moon-14") || "text-moon-16",
        @class
      ])}
      opts={for: @for}
    >
      <#slot>{@title}</#slot>
    </Surface.Components.Form.Label>
    """
  end
end
