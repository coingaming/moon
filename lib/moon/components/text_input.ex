defmodule Moon.Components.TextInput do
  use Moon.StatelessComponent

  alias Surface.Components.Form.TextInput
  alias Moon.Components.Label

  prop(field, :atom)
  prop(label, :string)

  prop(type, :string,
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
  )

  prop(value, :string)
  prop(placeholder, :string)
  prop(error, :string)
  prop(rounded, :boolean)
  prop(disabled, :boolean)
  prop(required, :boolean)
  prop(icon, :any)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/text-input" }}

    <TextInput
      class="moon-text-input"
      field={{ @field }}
      opts={{
        [
          placeholder: @placeholder,
          "data-error": @error && "true",
          "data-rounded": @rounded && "true"
        ]
      }}
      value={{ @value }}
      :if={{ !@label }}
    />

    <Label text={{ @label }} :if={{ @label }}>
      <TextInput
        class="moon-text-input"
        field={{ @field }}
        opts={{ [
          placeholder: @placeholder,
          "data-error": @error && "true",
          "data-rounded": @rounded && "true"
        ]}}
        value={{ @value }}
      />
    </Label>
    """
  end
end
