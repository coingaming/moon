defmodule Moon.Components.Select do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.FieldLabel

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

  data(select, :any)
  data(options_with_selected, :list)

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

    assigns = assign(assigns, options_with_selected: options_with_selected)

    select = ~F"""
    <Surface.Components.Form.Select
      class={
        "text-trunks pr-3.5 bg-no-repeat bg-goku hover:bg-goku
               hover:cursor-pointer focus:cursor-pointer border border-solid
               border-beerus focus:text-bulma disabled:cursor-not-allowed focus:border-piccolo focus:outline-none",
        "rounded-moon-s-sm": @rounded,
        "#{@class}": true
      }
      field={@field}
      options={@options_with_selected}
      opts={[prompt: @prompt, disabled: @disabled]}
    />
    """

    assigns = assign(assigns, select: select)

    ~F"""
    {#if @label}
      <FieldLabel text={@label}>
        <div class="relative mt-2">
          {@select}
        </div>
      </FieldLabel>
    {#else}
      {@select}
    {/if}
    """
  end
end
