defmodule Moon.Design.Form.Field do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.Form

  alias __MODULE__

  @doc "Form, Surface-style"
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  @doc "Field, Surface-style"
  prop(field, :atom)
  @doc "Input size"
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  @doc "Label for input field"
  prop(label, :string)
  @doc "Hint for input field"
  prop(hint, :string)
  @doc "Whether error message is shown"
  prop(hide_errors, :boolean)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(error_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(hint_class, :css_class)
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Whether label is on side of input field"
  prop(is_horizontal, :boolean, from_context: :is_horizontal)
  @doc "Whether error icon is shown"
  prop(has_error_icon, :boolean, from_context: :has_error_icon)

  @doc "Inner content of the component"
  slot(default)

  prop(attrs, :map)

  # opts={Map.merge(%{id: @id, "data-testid": @testid}, @attrs)}

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Field
      name={@field}
      class={merge([
        [
          "flex flex-row": @is_horizontal
        ],
        @class
      ])}
    >
      <Field.Label :if={@label} {=@size} title={@label} />
      <#slot context_put={
        size: @size,
        has_error_icon: @has_error_icon,
        error: !!@field && !!@form && has_error(@form, @field)
      } />
      <Field.Hint :if={@hint} title={@hint} class={@hint_class} />
      <Field.Error
        :if={!@hide_errors && !!@field && !!@form && has_error(@form, @field)}
        class={@error_class}
        {=@has_error_icon}
      />
    </Surface.Components.Form.Field>
    """
  end
end
