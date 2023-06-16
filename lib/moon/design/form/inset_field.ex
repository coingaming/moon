defmodule Moon.Design.Form.InsetField do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.Form

  alias __MODULE__
  alias Moon.Design.Form.Field.Error

  @doc "Form info, usually should be taken from context"
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  @doc "Field name, surface-style"
  prop(field, :atom)
  @doc "Label for input field"
  prop(label, :string)
  @doc "Hint for input field"
  prop(hint, :string)
  @doc "Whether error message is shown"
  prop(hide_errors, :boolean)
  @doc "Sets disabled state"
  prop(disabled, :boolean)
  @doc "Sets read-only state"
  prop(readonly, :boolean)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Inner content of the component"
  slot(default)

  prop(attrs, :map)

  # opts={Map.merge(%{id: @id, "data-testid": @testid}, @attrs)}

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Field
      name={@field}
      class={merge([
        ["relative rounded-moon-i-sm bg-gohan", "opacity-30 cursor-not-allowed": @disabled],
        @class
      ])}
    >
      <#slot context_put={
        field_class: [
          "bg-transparent h-14 leading-[3.5rem] rounded-moon-i-sm",
          "rtl:[&:not([disabled])]:[&:not([readonly])]:hover:rounded-moon-i-sm rtl:[&:not([disabled])]:[&:not([readonly])]:focus:rounded-moon-i-sm rtl:[&:not([disabled])]:[&:not([readonly])]:focus-visible:rounded-moon-i-sm rtl:invalid:rounded-moon-i-sm",
          "ltr:[&:not([disabled])]:[&:not([readonly])]:hover:rounded-moon-i-sm ltr:[&:not([disabled])]:[&:not([readonly])]:focus:rounded-moon-i-sm ltr:[&:not([disabled])]:[&:not([readonly])]:focus-visible:rounded-moon-i-sm ltr:invalid:rounded-moon-i-sm",
          "before:box-border after:box-border",
          "input-xl-dt-shared input-xl pt-[1.125rem] input-xl-dt-label"
        ],
        disabled: @disabled,
        readonly: @readonly,
        error: !!@field && !!@form && has_error(@form, @field)
      } />
      <InsetField.Label :if={@label} title={@label} {=@disabled} />
    </Surface.Components.Form.Field>

    <InsetField.Hint :if={@hint} title={@hint} {=@disabled} />
    <Error :if={!@hide_errors && !!@field && !!@form} />
    """
  end
end
