defmodule Moon.Design.Form.Field.Label do
  @moduledoc false

  use Moon.StatelessComponent

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)
  prop(attrs, :map, default: %{})

  prop(field, :atom)
  prop(form, :any)
  prop(for, :string)
  prop(size, :string, values!: ~w(sm md lg xl), default: "md")
  prop(title, :string)
  prop(disabled, :boolean, default: false)

  prop(on_click, :event)
  prop(value, :string)

  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Label
      {=@field}
      {=@form}
      class={merge([
        [
          "flex items-center gap-2 cursor-pointer",
          (@size == "sm" && "text-moon-14") || "text-moon-16",
          "text-bulma opacity-30 cursor-not-allowed": @disabled
        ],
        @class
      ])}
      opts={Map.merge(
        %{
          for: @for,
          id: @id,
          "data-testid": @testid,
          "phx-click": @on_click,
          "phx-value-value": @value
        },
        @attrs
      )}
    >
      <#slot>{@title}</#slot>
    </Surface.Components.Form.Label>
    """
  end
end
