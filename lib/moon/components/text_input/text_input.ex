defmodule Moon.Components.TextInput do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.TextInputBasic
  alias Moon.Components.TextInput.TextInputInnerLabel
  alias Moon.Components.TextInput.TextInputPassword
  alias Surface.Components.Form.Input.InputContext

  prop id, :string
  prop field, :atom
  prop size, :string, values: ["md", "lg", "xl"]

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
  prop dir, :string, values: ["ltr", "rtl"], default: "ltr"
  prop background_color, :string, values: Moon.colors(), default: "gohan-100"
  prop is_first, :boolean
  prop disabled, :boolean
  prop label, :string
  prop required, :boolean
  prop step, :string, default: "1"

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

  prop use_error_tag, :boolean

  slot hint_text_slot
  slot show_password_text

  def render(assigns) do
    ~F"""
    <InputContext assigns={assigns} :let={form: form, field: field}>
      <Context get={Moon.Components.InputGroup, in_input_group: in_input_group, orientation: orientation}>
        in_input_group: {in_input_group}<br>
        orientation: {orientation}<br>
        {#if @type == "password"}
          <TextInputPassword
            id={@id}
            field={@field}
            disabled={@disabled}
            dir={@dir}
            label={@label}
            is_error={has_error(@is_error, form, field)}
            size={@size}
            step={@step}
            required={@required}
            placeholder={@placeholder}
            readonly={@readonly}
            value={@value}
            background_color={@background_color}
            is_sharp_left_side={@is_sharp_left_side}
            is_sharp_right_side={@is_sharp_right_side}
            is_sharp_top_side={@is_sharp_top_side}
            is_sharp_bottom_side={@is_sharp_bottom_side}
            is_top_bottom_border_hidden={@is_top_bottom_border_hidden}
            is_side_border_hidden={@is_side_border_hidden}
            class="border-none"
            use_error_tag={@use_error_tag}
          >
            <:hint_text_slot>
              <#slot name="hint_text_slot" />
            </:hint_text_slot>
          </TextInputPassword>
        {#elseif @size == "xl"}
          <TextInputInnerLabel
            id={@id}
            field={@field}
            disabled={@disabled}
            dir={@dir}
            label={@label}
            is_error={has_error(@is_error, form, field)}
            size={@size}
            type={@type}
            step={@step}
            required={@required}
            placeholder={@placeholder}
            readonly={@readonly}
            value={@value}
            background_color={@background_color}
            is_sharp_left_side={@is_sharp_left_side}
            is_sharp_right_side={@is_sharp_right_side}
            is_sharp_top_side={@is_sharp_top_side}
            is_sharp_bottom_side={@is_sharp_bottom_side}
            is_top_bottom_border_hidden={@is_top_bottom_border_hidden}
            is_side_border_hidden={@is_side_border_hidden}
            is_first={@is_first}
            use_error_tag={@use_error_tag}
          >
            <:hint_text_slot>
              <#slot name="hint_text_slot" />
            </:hint_text_slot>
          </TextInputInnerLabel>
        {#else}
          <TextInputBasic
            id={@id}
            field={@field}
            disabled={@disabled}
            dir={@dir}
            label={@label}
            is_error={has_error(@is_error, form, field)}
            size={@size}
            type={@type}
            step={@step}
            readonly={@readonly}
            value={@value}
            required={@required}
            placeholder={@placeholder}
            background_color={@background_color}
            is_sharp_left_side={@is_sharp_left_side}
            is_sharp_right_side={@is_sharp_right_side}
            is_sharp_top_side={@is_sharp_top_side}
            is_sharp_bottom_side={@is_sharp_bottom_side}
            is_top_bottom_border_hidden={@is_top_bottom_border_hidden}
            is_side_border_hidden={@is_side_border_hidden}
            is_first={@is_first}
            use_error_tag={@use_error_tag}
          >
            <:hint_text_slot>
              <#slot name="hint_text_slot" />
            </:hint_text_slot>
          </TextInputBasic>
        {/if}
      </Context>
    </InputContext>
    """
  end

  defp has_error(is_error, form, field) do
    is_error || (field && form && Keyword.has_key?(form.errors, field))
  end
end
