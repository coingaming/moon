defmodule Moon.Design.Form.Select do
  @moduledoc false

  use Moon.StatelessComponent

  prop(field, :atom)
  prop(options, :list, default: [])
  prop(value, :any)
  prop(disabled, :boolean)

  prop(size, :string, values!: ~w(sm md lg xl), default: "md")
  prop(class, :css_class)
  prop(prompt, :string)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Select
      class={merge([
        "text-trunks flex justify-between w-full bg-gohan border-beerus shadow-input duration-200 transition-shadow",
        "hover:shadow-input-hov focus:shadow-input-focus focus:outline-none items-start text-ellipsis whitespace-nowrap overflow-hidden",
        [
          "h-9  py-1 px-3 rounded-moon-i-xs text-moon-14": @size == "sm",
          "h-10 py-2 px-3 rounded-moon-i-sm text-moon-16": @size == "md",
          "h-12 py-3 px-4 rounded-moon-i-sm text-moon-16": @size == "lg",
          "h-14 py-2 px-4 rounded-moon-i-md text-moon-16 leading-10": @size == "xl",
          "cursor-not-allowed opacity-30": @disabled
        ],
        @class
      ])}
      field={@field}
      options={options_with_selected(@options, @value)}
      opts={[prompt: @prompt, disabled: @disabled]}
    />
    """
  end

  defp options_with_selected(options, value) do
    Enum.map(options, fn row ->
      [
        key: row[:key],
        value: row[:value],
        selected: row[:value] == value,
        disabled: row[:disabled]
      ]
    end)
  end
end
