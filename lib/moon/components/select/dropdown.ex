# https://www.figma.com/file/aMBmdNX4cfv885xchXHIHo/Partners---Components-%7BMDS%7D?node-id=23443%3A818

defmodule Moon.Components.Select.Dropdown do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.ListItems.SingleLineItem
  alias Moon.Components.Select.Dropdown.Option
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias __MODULE__.Icon
  alias Surface.Components.Form.Input.InputContext

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Form
  alias Moon.Components.Checkbox
  alias Moon.Components.RadioButton
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
  prop on_option_clicked, :event
  prop with, :string, default: nil, values: ["checkbox", "radio"]
  prop content_class, :css_class, default: "max-h-[300px] overflow-hidden overflow-y-scroll"

  slot default
  slot footer
  slot header

  def render(assigns) do
    ~F"""
    <InputContext assigns={assigns} :let={form: form, field: field}>
      <div class={
        "z-10 rounded-moon-i-md shadow-lg bg-gohan-100 focus:outline-none p-1 grid grid-cols-1 gap-1 text-moon-16",
        @class
      }>
        {#if !@select_id}
          {Phoenix.HTML.Form.multiple_select(
            form,
            field,
            SelectHelpers.get_formatted_options(@available_options || @options),
            id: @id,
            class: "hidden",
            disabled: @disabled,
            selected: @value
          )}
        {/if}
        {#if @on_search_change}
          <Form
            for={:search}
            id={"#{@id}-search-form"}
            change={@on_search_change}
            submit={@on_search_change}
          >
            <TextInput field={:value} value={@search_string} keyup={@on_search_change} class="bg-red-500">
              <:left_icon_slot><Moon.Icon name="generic-search" /></:left_icon_slot>
            </TextInput>
          </Form>
        {/if}
        {#if slot_assigned?(:header)}
          <#slot name="header" />
        {/if}
        <div class={@content_class}>
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
                  {#if option[:left_icon] && (option[:right_icon] || @with)}
                    <SingleLineItem current={is_selected}>
                      <:left_icon>
                        <Icon icon={option[:left_icon]} />
                      </:left_icon>
                      {option.label}
                      <:right_icon>
                        <LeftToRight gap="gap-2">
                          {#if option[:right_icon]}
                            <Icon icon={option[:right_icon]} />
                          {/if}
                          {#if @with == "checkbox"}
                            <Checkbox id={"#{@id}-#{option.value}"} field={:"#{@id}-#{option.value}"} checked={is_selected} />
                          {/if}
                          {#if @with == "radio"}
                            <RadioButton
                              id={"#{@id}-#{option.value}"}
                              field={:"#{@id}-#{option.value}"}
                              checked={is_selected}
                            />
                          {/if}
                        </LeftToRight>
                      </:right_icon>
                    </SingleLineItem>
                  {#elseif option[:left_icon]}
                    <SingleLineItem current={is_selected}>
                      <:left_icon>
                        <Icon icon={option[:left_icon]} />
                      </:left_icon>
                      {option.label}
                    </SingleLineItem>
                  {#elseif option[:right_icon] || @with}
                    <SingleLineItem current={is_selected}>
                      {option.label}
                      <:right_icon>
                        <LeftToRight gap="gap-2">
                          {#if option[:right_icon]}
                            <Icon icon={option[:right_icon]} />
                          {/if}
                          {#if @with == "checkbox"}
                            <Checkbox id={"#{@id}-#{option.value}"} field={:"#{@id}-#{option.value}"} checked={is_selected} />
                          {/if}
                          {#if @with == "radio"}
                            <RadioButton
                              id={"#{@id}-#{option.value}"}
                              field={:"#{@id}-#{option.value}"}
                              checked={is_selected}
                            />
                          {/if}
                        </LeftToRight>
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
        </div>
        {#if slot_assigned?(:footer)}
          <div class="p-1">
            <#slot name="footer" />
          </div>
        {/if}
      </div>
    </InputContext>
    """
  end
end
