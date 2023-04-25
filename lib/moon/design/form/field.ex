defmodule Moon.Design.Form.Field do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.Form

  alias __MODULE__

  prop(form, :form, from_context: {Surface.Components.Form, :form})
  prop(field, :atom)
  prop(size, :string, values!: ~w(sm md lg xl), default: "md")
  prop(label, :string)
  prop(hint, :string)
  prop(hide_errors, :boolean)

  prop(attrs, :map)
  prop(class, :css_class)
  prop(id, :string)
  prop(testid, :string)

  slot(default)

  # opts={Map.merge(%{id: @id, "data-testid": @testid}, @attrs)}

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Field name={@field} {=@class}>
      <Field.Label :if={@label} {=@size} title={@label} />
      <#slot context_put={size: @size, error: !!@field && !!@form && has_error(@form, @field)} />
      <Field.Hint :if={@hint} title={@hint} />
      <Field.Error :if={!@hide_errors && !!@field && !!@form} />
    </Surface.Components.Form.Field>
    """
  end
end
