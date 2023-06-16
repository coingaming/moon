defmodule Moon.Design.Form.InsetField do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.Form

  alias __MODULE__

  prop(form, :form, from_context: {Surface.Components.Form, :form})
  prop(field, :atom)
  prop(label, :string)
  prop(hint, :string)
  prop(hide_errors, :boolean)
  prop(disabled, :boolean)
  prop(readonly, :boolean)

  prop(attrs, :map)
  prop(class, :css_class)
  prop(id, :string)
  prop(testid, :string)

  slot(default)

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
    <InsetField.Error :if={!@hide_errors && !!@field && !!@form} />
    """
  end
end
