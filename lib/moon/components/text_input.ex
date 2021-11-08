defmodule Moon.Components.TextInput do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Label
  alias Moon.Components.ErrorTag

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
  prop focus, :event
  prop blur, :event
  prop without_design, :boolean
  prop background_color, :string, values: Moon.colors(), default: "goku-100"
  prop size, :string, values: ["medium", "large"], default: "large"

  slot left_icon
  slot right_icon

  def render(assigns) do
    text_input = ~F"""
    <div class="relative">
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

      <Surface.Components.Form.TextInput
        class={
          "w-full max-w-full hover:bg-goku-120 leading-normal
               text-bulma-100 box-border border border-solid border-beerus-100 rounded transition
               ease-in placeholder-trunks-100 placeholder-opacity-100 disabled:opacity-50
               disabled:cursor-not-allowed focus:border-piccolo-100 focus:outline-none
               no-scrollbar invalid:shadow-none invalid:border-chi-chi-100",
          "h-10 text-sm px-3": @size == "medium",
          "h-12 text-base px-4": @size == "large",
          "pl-11": slot_assigned?(:left_icon),
          "pr-11": slot_assigned?(:right_icon),
          "border-chi-chi-100": @error,
          "#{@class}": true,
          "bg-#{@background_color}": true
        }
        field={@field}
        opts={
          placeholder: @placeholder,
          disabled: @disabled,
          required: @required,
          type: @type
        }
        value={@value}
        focus={@focus}
        blur={@blur}
      />
      <ErrorTag field={@field} />
    </div>
    """

    ~F"""
    {#if @label}
      <Label text={@label}>
        <div class="mt-2 relative">
          {text_input}
        </div>
      </Label>
    {#else}
      {text_input}
    {/if}
    """
  end
end
