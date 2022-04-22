defmodule Moon.Components.Select.Dropdown.Option.Renderer do
  @moduledoc false
  use Moon.StatelessComponent
  alias Surface.Components.Context
  alias Phoenix.LiveView.JS

  prop class, :css_class
  prop select_id, :string
  prop value, :any
  prop select_value, :any
  prop is_multi, :boolean
  prop is_selected, :boolean

  slot default, args: [:is_selected]
  slot right_icon
  slot left_icon

  def render(assigns) do
    ~F"""
    <li
      role="option"
      :on-click={JS.dispatch("moon:update-select",
        detail: %{
          value: @value,
          selected: !@is_selected
        },
        to: "##{@select_id}"
      )}
    >
      <#slot :args={is_selected: @is_selected} />
    </li>
    """
  end
end

defmodule Moon.Components.Select.Dropdown.Option do
  @moduledoc false

  use Moon.StatelessComponent
  alias Surface.Components.Context
  alias __MODULE__.Renderer

  prop class, :css_class
  prop select_id, :string
  prop label, :any
  prop value, :any
  prop select_value, :any
  prop is_multi, :boolean

  slot default, args: [:is_selected]
  slot right_icon
  slot left_icon

  def render(assigns) do
    ~F"""
    <Context get={
      Moon.Components.Select.Dropdown,
      select_id: select_id,
      select_value: select_value,
      value: value,
      is_multi: is_multi
    }>
      <Renderer
        is_selected={get_is_selected(%{
          select_value: @select_value || select_value,
          is_multi: @is_multi || is_multi,
          value: @value || value
        })}
        select_id={@select_id || select_id}
        value={@value || value}
        select_value={@select_value || select_value}
        is_multi={@is_multi || is_multi}
        :let={is_selected: is_selected}
      >
        <#slot :args={is_selected: is_selected} />
      </Renderer>
    </Context>
    """
  end

  def get_is_selected(%{select_value: select_value, is_multi: is_multi, value: value}) do
    if is_multi do
      Enum.member?(select_value, value)
    else
      select_value == value
    end
  end
end

# https://www.figma.com/file/aMBmdNX4cfv885xchXHIHo/Partners---Components-%7BMDS%7D?node-id=23443%3A818
defmodule Moon.Components.Select.Dropdown do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.ListItems.SingleLineItem
  alias Moon.Components.Select.Dropdown.Option
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias Surface.Components.Context
  alias Surface.Components.Form.Input.InputContext

  prop id, :string
  prop select_id, :string
  prop class, :css_class
  prop options, :any
  prop value, :any
  prop is_multi, :boolean

  slot default
  slot option_filters

  def render(assigns) do
    ~F"""
    <InputContext assigns={assigns} :let={form: form, field: field}>
      {#if !@select_id}
        {Phoenix.HTML.Form.multiple_select(form, field, SelectHelpers.get_formatted_options(@options),
          class: "hidden",
          id: @id
        )}
      {/if}
      <ul
        class={"z-10 px-1 py-2 space-y-1 rounded shadow-lg bg-gohan-100 focus:outline-none", @class}
        tabindex="-1"
        role="listbox"
        id={"#{@id}-ul-list"}
      >
        {#if slot_assigned?(:option_filters)}
          <Context put={__MODULE__, select_id: @select_id || @id}>
            <#slot name="option_filters" />
          </Context>
        {/if}
        {#if @options && !slot_assigned?(:default)}
          {#for option <- @options}
            <Option
              select_id={@select_id || @id}
              select_value={SelectHelpers.get_normalized_value(form, field, @is_multi, value: @value)}
              is_multi={@is_multi}
              value={"#{option.value}"}
              :let={is_selected: is_selected}
            >
              <SingleLineItem current={is_selected}>
                {option.label}
              </SingleLineItem>
            </Option>
          {/for}
        {/if}
        {#if slot_assigned?(:default)}
          <Context put={
            __MODULE__,
            select_id: @select_id || @id,
            select_value: SelectHelpers.get_normalized_value(form, field, @is_multi, value: @value),
            is_multi: @is_multi
          }>
            <#slot name="default" />
          </Context>
        {/if}
      </ul>
    </InputContext>
    """
  end

  def apply_filter(assigns) do
    IO.inspect(assigns.options)
    "options_filter"
  end
end
