defmodule Moon.Components.TextInput do
  @moduledoc false

  use Moon.StatelessComponent

  alias __MODULE__.TextInputInternal
  alias Moon.Components.Label

  prop field, :atom
  prop label, :string

  prop type, :string,
    default: "text",
    values: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "url",
      "time",
      "url"
    ]

  prop value, :string
  prop placeholder, :string
  prop error, :string
  prop rounded, :boolean
  prop disabled, :boolean
  prop required, :boolean
  prop class, :string
  prop on_focus, :event
  prop on_blur, :event
  prop without_design, :boolean
  prop background_color, :string, values: Moon.colors(), default: "goku-100"
  prop size, :string, values: ["medium", "large"], default: "large"

  slot left_icon
  slot right_icon

  def render(assigns) do
    ~F"""
    {#if @label}
      <Label text={@label}>
        <div class="mt-2 relative">
          {text_input_internal(assigns)}
        </div>
      </Label>
    {#else}
      {text_input_internal(assigns)}
    {/if}
    """
  end

  def text_input_internal(assigns) do
    ~F"""
    <TextInputInternal
      {=@class}
      {=@field}
      {=@error}
      {=@placeholder}
      {=@disabled}
      {=@required}
      {=@value}
      {=@on_focus}
      {=@on_blur}
      {=@background_color}
      {=@size}
      {=@type}
      has_left_icon={slot_assigned?(:left_icon)}
      has_right_icon={slot_assigned?(:right_icon)}
    >
      {#if slot_assigned?(:left_icon)}
        <div class="absolute inset-y-0 left-0 pl-4 flex items-center text-trunks-100">
          <#slot name="left_icon" />
        </div>
      {/if}
      {#if slot_assigned?(:right_icon)}
        <div class="absolute inset-y-0 right-0 pr-4 flex items-center text-trunks-100">
          <#slot name="right_icon" />
        </div>
      {/if}
    </TextInputInternal>
    """
  end
end
