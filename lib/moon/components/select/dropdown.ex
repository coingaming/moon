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
  prop left_icon, :any
  prop right_icon, :any

  slot default, args: [:is_selected]

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
  prop value, :any
  prop select_value, :any
  prop is_multi, :boolean
  prop left_icon, :any
  prop right_icon, :any

  slot default, args: [:is_selected]

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
        {=@left_icon}
        {=@right_icon}
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

defmodule Moon.Components.Select.Dropdown.Footer do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.PullAside

  slot cancel
  slot clear
  slot confirm

  def render(assigns) do
    ~F"""
    <PullAside>
      <:left>
        {#if slot_assigned?(:clear)}
          <#slot name="clear" />
        {/if}
      </:left>
      <:right>
        <LeftToRight>
          {#if slot_assigned?(:cancel)}
            <#slot name="cancel" />
          {/if}
          {#if slot_assigned?(:confirm)}
            <#slot name="confirm" />
          {/if}
        </LeftToRight>
      </:right>
    </PullAside>
    """
  end
end

defmodule Moon.Components.Select.Dropdown.Icon do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Select.Helpers, as: SelectHelpers

  prop icon, :any
  prop class, :string, default: ""
  prop style, :string, default: ""

  slot default

  def render(assigns) do
    [module, props] = assigns.icon

    ~F"""
    <div class={@class} style={@style}>
      {Moon.RenderHelpers.render_component(module, props)}
    </div>
    """
  end
end

# https://www.figma.com/file/aMBmdNX4cfv885xchXHIHo/Partners---Components-%7BMDS%7D?node-id=23443%3A818
defmodule Moon.Components.Select.Dropdown do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.ListItems.SingleLineItem
  alias Moon.Components.Select.Dropdown.Option
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias __MODULE__.Icon
  alias Surface.Components.Context
  alias Surface.Components.Form.Input.InputContext

  alias Moon.Components.Form
  alias Moon.Components.TextInput

  prop id, :string
  prop select_id, :string
  prop class, :css_class
  prop available_options, :any
  prop options, :any
  prop value, :any
  prop is_multi, :boolean
  prop disabled, :boolean, default: false
  prop on_search_change, :event
  prop search_string, :string

  slot default
  slot option_filters
  slot options_footer
  slot options_tabs

  def render(assigns) do
    ~F"""
    <InputContext assigns={assigns} :let={form: form, field: field}>
      <div class={"z-10 rounded shadow-lg bg-gohan-100 focus:outline-none p-1 grid grid-cols-1 gap-1", @class}>
        {#if !@select_id}
          {Phoenix.HTML.Form.multiple_select(
            form,
            field,
            SelectHelpers.get_formatted_options(@available_options || @options),
            class: "hidden",
            id: @id,
            disabled: @disabled
          )}
        {/if}
        {#if @on_search_change}
          <Form
            for={:search}
            id={"#{@id}-search-form"}
            change={@on_search_change}
            submit={@on_search_change}
          >
            <TextInput value={@search_string} keyup={@on_search_change} class="bg-red-500">
              <:left_icon_slot><Moon.Icon name="generic-search" /></:left_icon_slot>
            </TextInput>
          </Form>
        {/if}
        {#if slot_assigned?(:option_filters)}
          <#slot name="option_filters" />
        {/if}
        {#if slot_assigned?(:options_tabs)}
          <#slot name="options_tabs" />
        {/if}
        <ul tabindex="-1" role="listbox" id={"#{@id}-ul-list"} class="grid grid-cols-1 gap-1">
          {#if @options && !slot_assigned?(:default)}
            {#for option <- @options}
              <Option
                select_id={@select_id || @id}
                select_value={SelectHelpers.get_normalized_value(form, field, @is_multi, value: @value)}
                value={"#{option.value}"}
                left_icon={option[:left_icon]}
                right_icon={option[:right_icon]}
                {=@is_multi}
                :let={is_selected: is_selected}
              >
                {#if option[:left_icon] && option[:right_icon]}
                  <SingleLineItem current={is_selected}>
                    <:left_icon>
                      <Icon icon={option[:left_icon]} />
                    </:left_icon>
                    {option.label}
                    <:right_icon>
                      <Icon icon={option[:right_icon]} />
                    </:right_icon>
                  </SingleLineItem>
                {#elseif option[:left_icon]}
                  <SingleLineItem current={is_selected}>
                    <:left_icon>
                      <Icon icon={option[:left_icon]} />
                    </:left_icon>
                    {option.label}
                  </SingleLineItem>
                {#elseif option[:right_icon]}
                  <SingleLineItem current={is_selected}>
                    {option.label}
                    <:right_icon>
                      <Icon icon={option[:right_icon]} />
                    </:right_icon>
                  </SingleLineItem>
                {#else}
                  <SingleLineItem current={is_selected}>
                    {option.label}
                  </SingleLineItem>
                {/if}
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
        {#if slot_assigned?(:options_footer)}
          <div class="p-1">
            <#slot name="options_footer" />
          </div>
        {/if}
      </div>
    </InputContext>
    """
  end
end
