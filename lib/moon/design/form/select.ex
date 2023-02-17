defmodule Moon.Design.Form.Select do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.FieldLabel

  prop(field, :atom)
  prop(label, :string)
  prop(options, :any, default: [])
  prop(value, :any)
  prop(disabled, :boolean)

  prop(size, :string, values!: ~w(sm md lg xl), default: "md")
  prop(class, :css_class)


  prop(prompt, :string)
  prop(error, :string)
  prop(rounded, :boolean, default: true)
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

    select = ~F"""
    <Surface.Components.Form.Select
      class={merge([
        "text-trunks flex justify-between w-full bg-gohan border-beerus shadow-input duration-200 transition-shadow",
        "hover:shadow-input-hov focus:shadow-input-focus focus:outline-none  items-start overflow-hidden text-ellipsis whitespace-nowrap",
        [
          "h-8 p-3 rounded-moon-i-xs text-moon-14": @size == "sm",
          "h-10 py-2 px-3 rounded-moon-i-sm text-moon-16": @size == "md",
          "h-12 py-3 px-4 rounded-moon-i-sm text-moon-16": @size == "lg",
          "h-14 py-2 px-4 rounded-moon-i-md text-moon-16": @size == "xl",
          "cursor-not-allowed": @disabled
        ],
        @class
      ])}
      field={@field}
      options={options_with_selected}
      opts={[prompt: @prompt, disabled: @disabled]}
    />
    """

    ~F"""
    {#if @label}
      <FieldLabel text={@label}>
        <div class="relative mt-2">
          {select}
        </div>
      </FieldLabel>
    {#else}
      {select}
    {/if}
    """
  end
end


# sm
# flex flex-col
#

# md
# flex flex-col
#

# lg
# flex flex-col
# text-moon-16

# xl
#

# disabled
# flex items-center justify-between w-full bg-gohan border-beerus shadow-input duration-200 transition-shadow hover:shadow-input-hov
# focus:shadow-input-focus focus:outline-none h-8 p-3 rounded-moon-i-xs cursor-not-allowed
