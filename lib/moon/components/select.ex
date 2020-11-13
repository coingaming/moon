defmodule Moon.Components.Select do
  use Moon.StatelessComponent

  import Moon.Utils.Rem

  alias Moon.Components.Label

  prop(field, :atom)
  prop(label, :string)
  prop(options, :any, default: [])
  prop(value, :any)
  prop(prompt, :string)
  prop(error, :string)
  prop(rounded, :boolean)
  prop(disabled, :boolean)
  prop(required, :boolean)
  prop(flex, :boolean)
  prop(input_grow, :boolean)
  prop(icon, :string)
  prop(full_width, :boolean)

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

    ~H"""
    {{ asset_import @socket, "js/moon/components/select" }}

    <Surface.Components.Form.Select
      class="moon-select"
      field={{ @field }}
      options={{ options_with_selected }}
      opts={{ [prompt: @prompt] }}
      :if={{ !@label }}
    />

    <Label text={{ @label }} :if={{ @label }}>
      <Surface.Components.Form.Select
        class="moon-select"
        field={{ @field }}
        options={{ options_with_selected }}
        opts={{ [prompt: @prompt] }}
      />
    </Label>
    """
  end
end
