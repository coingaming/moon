defmodule Moon.Design.Form.Select do
  @moduledoc false

  use Moon.StatelessComponent

  prop(field, :atom)
  prop(options, :list, default: [])
  prop(value, :any)
  prop(disabled, :boolean)

  prop(size, :string, values!: ~w(sm md lg), default: "md")
  prop(class, :css_class)
  prop(prompt, :string)

  prop(id, :string)
  prop(testid, :string)
  prop(error, :boolean, from_context: :error)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Select
      class={merge([
        "text-trunks flex justify-between w-full bg-gohan border-0 duration-200 transition-shadow",
        "shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none focus:ring-0",
        "items-start text-ellipsis whitespace-nowrap overflow-hidden py-0 px-4",
        "moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
        "invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
        [
          "h-8 leading-8 rounded-moon-i-xs": @size == "sm",
          "h-10 leading-10 rounded-moon-i-sm": @size == "md",
          "h-12 leading-[3rem] rounded-moon-i-sm": @size == "lg",
          "cursor-not-allowed opacity-30": @disabled
        ],
        @class
      ])}
      {=@field}
      {=@id}
      options={options_with_selected(@options, @value)}
      opts={[prompt: @prompt, disabled: @disabled, "data-testid": @testid, error: @error]}
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
