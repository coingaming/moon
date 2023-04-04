defmodule Moon.Design.Form.Radio do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Form.Field
  import Moon.Helpers.MakeList
  import Moon.Helpers.Form

  alias __MODULE__.Indicator

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  prop(field, :atom)
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  prop(value, :string)
  prop(on_change, :event)

  prop(option_module, :atom, default: __MODULE__.Option)
  prop(options, :list, default: [])

  slot(option)


  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-testid={@testid}
      {=@class}
      role="radiogroup"
    >
      <Field {=@field}>
        {#if slot_assigned?(:option)}
          {#for {option, _index} <- Enum.with_index(make_list(@option))}
            <#slot
              {option}
              context_put={
                is_selected: option.value == get_value(assigns),
                on_click: @on_change
              }
            />
          {/for}
        {#else}
          <.moon
            :for={{value, title} <- @options}
            module={@option_module}
            {=@field}
            {=@form}
            is_selected={value == get_value(assigns)}
            on_click={@on_change}
          ><Indicator/>{title}</.moon>
        {/if}
      </Field>
    </div>
    """
  end
end
