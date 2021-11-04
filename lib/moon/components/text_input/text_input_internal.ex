defmodule Moon.Components.TextInput.TextInputInternal do
  @moduledoc false

  use Moon.StatelessComponent

  alias Surface.Components.Form.TextInput

  prop field, :atom

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
  prop background_color, :string, values: Moon.colors(), default: "goku-100"
  prop size, :string, values: ["medium", "large"], default: "large"

  prop has_left_icon, :boolean
  prop has_right_icon, :boolean

  slot default

  def render(assigns) do
    ~F"""
    <div class="relative">
      <#slot />

      <TextInput
        class={
          "w-full max-w-full hover:bg-goku-120 leading-normal
         text-bulma-100 box-border border border-solid border-beerus-100 rounded transition
         ease-in placeholder-trunks-100 placeholder-opacity-100 disabled:opacity-50
         disabled:cursor-not-allowed focus:border-piccolo-100 focus:outline-none
         no-scrollbar invalid:shadow-none invalid:border-chi-chi-100",
          "h-10 text-sm px-3": @size == "medium",
          "h-12 text-base px-4": @size == "large",
          "pl-11": @has_left_icon,
          "pr-11": @has_right_icon,
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
        focus={@on_focus}
        blur={@on_blur}
      />
    </div>
    """
  end
end
