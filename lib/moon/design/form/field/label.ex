defmodule Moon.Design.Form.Field.Label do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for HTML tag"
  prop(id, :string)
  @doc "Data-testid attribute for HTML tag"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional attributes"
  prop(attrs, :map, default: %{})

  @doc "Field, Surface-style"
  prop(field, :atom)
  @doc "Form, Surface-style"
  prop(form, :any)
  @doc "Atom or changeset to inform the form data"
  prop(for, :string)
  @doc "Common moon size property"
  prop(size, :string, values!: ~w(sm md lg xl), default: "md")
  @doc "Label for input field"
  prop(title, :string)
  @doc "Whether label has disabled state"
  prop(disabled, :boolean, default: false)
  @doc "Whether label is on side of input field"
  prop(is_horizontal, :boolean, from_context: :is_horizontal)

  @doc "On click event for the label"
  prop(on_click, :event)
  @doc "Value of the input"
  prop(value, :string)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Label
      {=@field}
      {=@form}
      class={merge([
        [
          "flex gap-2 cursor-pointer whitespace-nowrap pb-2 items-center leading-normal",
          (@size == "sm" && "text-moon-14") || "text-moon-16",
          "text-bulma opacity-60 cursor-not-allowed": @disabled,
          "font-medium pb-0 align-center": @is_horizontal
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
