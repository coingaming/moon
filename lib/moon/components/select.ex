defmodule Moon.Components.Select do
  use Moon.StatelessComponent

  alias Moon.Components.Label

  prop(field, :atom)
  prop(label, :string)
  prop(options, :any, default: [])
  prop(value, :any)
  prop(prompt, :string)
  prop(error, :string)
  prop(rounded, :boolean, default: true)
  prop(disabled, :boolean)
  prop(required, :boolean)
  prop(flex, :boolean)
  prop(input_grow, :boolean)
  prop(icon, :string)
  prop(full_width, :boolean)
  prop(class, :string)

  def render(assigns) do
    options_with_selected =
      Enum.map(assigns.options, fn row ->
        [
          key: row[:key],
          value: row[:value],
          selected: row[:value] == assigns.value,
          disabled: row[:disabled]
        ]
      end)

    ~F"""
    {asset_import @socket, "js/components/select"}

    <Surface.Components.Form.Select
      class={"moon-select #{@class}", rounded: @rounded}
      field={@field}
      options={options_with_selected}
      opts={[prompt: @prompt]}
      :if={!@label}
    />

    <Label text={@label} :if={@label}>
      <Surface.Components.Form.Select
        class={"moon-select mt-2 #{@class}", rounded: @rounded}
        field={@field}
        options={options_with_selected}
        opts={[prompt: @prompt, disabled: @disabled]}
      />
    </Label>
    """
  end
end
