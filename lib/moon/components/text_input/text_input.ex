defmodule Moon.Components.TextInput do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.TextInputBasic
  alias Moon.Components.TextInput.TextInputInnerLabel
  alias Moon.Components.TextInput.TextInputPassword
  alias Surface.Components.Form.Input.InputContext
  alias Moon.Components.TextInput.HintText

  prop id, :string
  prop field, :atom
  prop size, :string, values: ["md", "lg", "xl"], default: "md"

  prop type, :string,
    values: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "time",
      "url"
    ],
    default: "text"

  prop placeholder, :string
  prop is_error, :boolean
  prop background_color, :string, values: Moon.colors(), default: "gohan-100"
  prop is_first, :boolean
  prop disabled, :boolean
  prop label, :string
  prop required, :boolean
  prop step, :string, default: "1"
  prop class, :css_class

  prop is_sharp_left_side, :boolean
  prop is_sharp_right_side, :boolean
  prop is_sharp_top_side, :boolean
  prop is_sharp_bottom_side, :boolean
  prop is_top_bottom_border_hidden, :boolean
  prop is_side_border_hidden, :boolean

  prop readonly, :boolean
  prop value, :string

  prop focus, :event
  prop keydown, :event
  prop keyup, :event
  prop blur, :event

  prop show_password_text, :string, default: "Show"

  prop use_error_tag, :boolean

  slot left_icon_slot
  slot right_icon_slot
  slot hint_text_slot

  def render(assigns) do
    internal_render = ~F"""
    {#if slot_assigned?(:left_icon_slot)}
      <div class="absolute inset-y-0 left-0 pl-4 flex items-center text-trunks-100" style="z-index: 9999">
        <#slot name="left_icon_slot" />
      </div>
    {/if}
    {#if slot_assigned?(:right_icon_slot)}
      <div class="absolute inset-y-0 right-0 pr-4 flex items-center text-trunks-100">
        <#slot name="right_icon_slot" />
      </div>
    {/if}
    <HintText :if={slot_assigned?(:hint_text_slot)} {=@is_error}>
      <#slot name="hint_text_slot" />
    </HintText>
    """

    ~F"""
    <InputContext assigns={assigns} :let={form: form, field: field}>
      <Context
        put={__MODULE__, size: @size}
        put={__MODULE__, type: @type}
        put={__MODULE__, placeholder: @placeholder}
        put={__MODULE__, is_error: has_error(@is_error, form, field)}
        put={__MODULE__, background_color: @background_color}
        put={__MODULE__, is_first: @is_first}
        put={__MODULE__, disabled: @disabled}
        put={__MODULE__, label: @label}
        put={__MODULE__, required: @required}
        put={__MODULE__, step: @step}
        put={__MODULE__, is_sharp_left_side: @is_sharp_left_side}
        put={__MODULE__, is_sharp_right_side: @is_sharp_right_side}
        put={__MODULE__, is_sharp_bottom_side: @is_sharp_bottom_side}
        put={__MODULE__, is_sharp_top_side: @is_sharp_top_side}
        put={__MODULE__, is_top_bottom_border_hidden: @is_top_bottom_border_hidden}
        put={__MODULE__, is_side_border_hidden: @is_side_border_hidden}
        put={__MODULE__, readonly: @readonly}
        put={__MODULE__, value: @value}
        put={__MODULE__, focus: @focus}
        put={__MODULE__, keydown: @keydown}
        put={__MODULE__, keyup: @keyup}
        put={__MODULE__, blur: @blur}
        put={__MODULE__, show_password_text: @show_password_text}
        put={__MODULE__, use_error_tag: @use_error_tag}
        put={__MODULE__, has_left_icon: slot_assigned?(:left_icon_slot)}
        put={__MODULE__, has_right_icon: slot_assigned?(:right_icon_slot)}
        get={Moon.Components.InputGroup, is_in_input_group: is_in_input_group}
        get={Moon.Components.InputGroup, group_class_plain: group_class_plain}
      >
        {#if @type == "password"}
          <TextInputPassword
            {=@id}
            {=@field}
            class={@class, "#{get_combined_class(is_in_input_group, field, group_class_plain)}": true}
          >
            {internal_render}
          </TextInputPassword>
        {#elseif @size == "xl"}
          <TextInputInnerLabel
            {=@id}
            {=@field}
            class={@class, "#{get_combined_class(is_in_input_group, field, group_class_plain)}": true}
          >
            {internal_render}
          </TextInputInnerLabel>
        {#else}
          <TextInputBasic {=@id} {=@field} {=@class}>
            {internal_render}
          </TextInputBasic>
        {/if}
      </Context>
    </InputContext>
    """
  end

  defp get_combined_class(is_in_input_group, field, group_class_plain) do
    if is_in_input_group && !field do
      group_class_plain
    end
  end

  defp has_error(is_error, form, field) do
    is_error || (field && form && Keyword.has_key?(form.errors, field))
  end
end
