defmodule Moon.Design.Form.Radio do
  @moduledoc "Radio(group) component. For using both inside and outside the form"

  use Moon.StatelessComponent

  alias Moon.Design.Form.Field
  alias Surface.Components.Dynamic.Component

  import Moon.Helpers.MakeList

  @doc "Id to be given to the label tag"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "Additional CSS classes for the label"
  prop(class, :css_class)
  @doc "Field name, surface-style"
  prop(field, :atom)
  @doc "Well, disabled"
  prop(disabled, :boolean)

  @doc "Value of the selected option, use it outside the form"
  prop(value, :any)
  @doc "On-change event, will be propagated to underlying options"
  prop(on_change, :event)

  @doc "List of options to be rendered when no option slot is given"
  prop(options, :keyword, default: [])
  @doc "Module for rendering options"
  prop(option_module, :atom, default: __MODULE__.Button)

  @doc "See Moon.Design.Field documentation"
  prop(hide_errors, :boolean)
  @doc "See Moon.Design.Field documentation"
  prop(hint, :string)

  @doc "List of options for Radiogroup "
  slot(option)
  @doc "Additional slot, here you able to add anything"
  slot(default)

  def render(assigns) do
    ~F"""
    <Field {=@field} {=@id} {=@testid} {=@class} {=@hide_errors} {=@hint} attrs={role: "radiogroup"}>
      {#if slot_assigned?(:option)}
        {#for option <- make_list(@option)}
          <#slot
            {option}
            context_put={
              value: option.value,
              is_selected: "#{@value}" == "#{option.value}",
              on_click: @on_change,
              disabled: @disabled
            }
          />
        {/for}
      {#else}
        <Component
          :for={{value, title} <- @options}
          module={@option_module}
          on_click={@on_change}
          {=value}
          is_selected={"#{@value}" == "#{value}"}
          {=@disabled}
          label={title}
        />
      {/if}
      <#slot />
    </Field>
    """
  end
end
