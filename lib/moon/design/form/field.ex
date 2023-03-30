defmodule Moon.Design.Form.Field do
  @moduledoc false

  use Moon.StatelessComponent

  alias __MODULE__

  prop(field, :atom)
  prop(class, :css_class)
  prop(size, :string, values!: ~w(sm md lg xl), default: "md")
  prop(label, :string)
  prop(hint, :string)
  prop(has_no_error, :boolean)

  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Field name={@field} {=@class}>
      <Field.Label :if={@label} {=@field} for={@field} {=@size} title={@label} />
      <#slot context_put={size: @size} />
      <Field.Hint :if={@hint} title={@hint} />
      <Field.Error :if={!@has_no_error}/>
    </Surface.Components.Form.Field>
    """
  end
end
