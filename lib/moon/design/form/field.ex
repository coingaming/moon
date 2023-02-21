defmodule Moon.Design.Form.Field do
  @moduledoc false

  use Moon.StatelessComponent

  alias __MODULE__

  prop(field, :atom)
  prop(class, :css_class)
  prop(size, :string, values!: ~w(sm md lg xl), default: "md")
  prop(label, :string)
  prop(hint, :string)

  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Field name={@field} {=@class}>
      <Field.Label :if={@label} {=@field} for={@field} {=@size} title={@label} />
      <#slot context_put={size: @size} />
      <Field.Hint :if={@hint} title={@hint} />
    </Surface.Components.Form.Field>
    """
  end
end
