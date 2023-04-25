defmodule Moon.Design.Form.Radio do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Form.Field
  alias Surface.Components.Dynamic.Component

  import Moon.Helpers.MakeList
  import Moon.Helpers.Form

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  prop(field, :atom)
  data(form, :form, from_context: {Surface.Components.Form, :form})

  prop(disabled, :boolean)

  prop(value, :string)
  prop(on_change, :event)

  prop(option_module, :atom, default: __MODULE__.Option)
  prop(options, :keyword, default: [])

  prop(hide_errors, :boolean)
  prop(hint, :string)

  slot(option)
  slot(default)

  def render(assigns) do
    ~F"""
    <Field {=@field} {=@id} {=@testid} {=@class} {=@hide_errors} {=@hint} attrs={role: "radiogroup"}>
      {#if slot_assigned?(:option)}
        {#for option <- make_list(@option)}
          <#slot
            {option}
            context_put={
              is_selected: option.value == get_value(assigns),
              on_click: @on_change,
              disabled: @disabled
            }
          />
        {/for}
      {#else}
        <Component
          :for={{value, title} <- @options}
          module={@option_module}
          is_selected={"#{value}" == "#{get_value(assigns)}"}
          on_click={@on_change}
          {=value}
          {=@disabled}
          {=title}
        />
      {/if}
      <#slot />
    </Field>
    """
  end
end
