defmodule Moon.Components.TextInput do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.InputGroup
  alias Moon.Components.TextInput.TextInputBasic
  alias Moon.Components.TextInput.TextInputInnerLabel
  alias Moon.Components.TextInput.TextInputPassword
  alias Moon.Components.TextInput.HintText
  alias Surface.Components.Context

  prop id, :string
  prop field, :atom, from_context: :field
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

  prop placeholder, :string, default: " "
  prop is_error, :boolean
  prop background_color, :string, values: Moon.colors(), default: "bg-gohan-100"
  prop is_first, :boolean
  prop disabled, :boolean
  prop label, :string
  prop required, :boolean
  prop step, :string, default: "1"
  prop class, :css_class

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

  data form, :form, from_context: {Surface.Components.Form, :form}
  data is_in_input_group, :boolean, from_context: {InputGroup, :is_in_input_group}
  data group_class_plain, :css_class, from_context: {InputGroup, :group_class_plain}

  def render(assigns) do
    assigns = put_everything_to_context(assigns)

    internal_render = ~F"""
    <HintText :if={slot_assigned?(:hint_text_slot)} {=@is_error}>
      <#slot {@hint_text_slot} />
    </HintText>
    """

    ~F"""
    {#if @type == "password"}
      <TextInputPassword
        {=@id}
        {=@field}
        class={@class, "#{get_combined_class(@is_in_input_group, @field, @group_class_plain)}": true}
      >
        <:left_icon_slot>
          <#slot {@left_icon_slot} />
        </:left_icon_slot>
        <:right_icon_slot>
          <#slot {@right_icon_slot} />
        </:right_icon_slot>
        {internal_render}
      </TextInputPassword>
    {#elseif @size == "xl"}
      <TextInputInnerLabel
        {=@id}
        {=@field}
        class={@class, "#{get_combined_class(@is_in_input_group, @field, @group_class_plain)}": true}
      >
        <:left_icon_slot>
          <#slot {@left_icon_slot} />
        </:left_icon_slot>
        <:right_icon_slot>
          <#slot {@right_icon_slot} />
        </:right_icon_slot>
        {internal_render}
      </TextInputInnerLabel>
    {#else}
      <TextInputBasic {=@id} {=@field} {=@class}>
        <:left_icon_slot>
          <#slot {@left_icon_slot} />
        </:left_icon_slot>
        <:right_icon_slot>
          <#slot {@right_icon_slot} />
        </:right_icon_slot>
        {internal_render}
      </TextInputBasic>
    {/if}
    """
  end

  defp put_everything_to_context(assigns) do
    assigns
    |> Context.put(
      __MODULE__,
      assigns
      |> Map.delete(:left_icon_slot)
      |> Map.delete(:right_icon_slot)
      |> Map.delete(:hint_text_slot)
    )
    |> Context.put(__MODULE__,
      is_error: has_error(assigns[:is_error], assigns[:form], assigns[:field]),
      has_left_icon: slot_assigned?(:left_icon_slot),
      has_right_icon: slot_assigned?(:right_icon_slot)
    )
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
