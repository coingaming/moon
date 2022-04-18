defmodule Moon.Components.Radiobutton do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.FieldLabel
  alias Surface.Components.Form.RadioButton
  alias Surface.Components.Form.Input.InputContext

  prop id, :string
  prop field, :atom
  prop click, :event
  prop checked, :boolean, default: false
  prop disabled, :boolean
  prop class, :string
  prop value, :string
  slot default

  def is_selected(current_value, value) do
    current_value == value
  end

  def render(assigns) do
    ~F"""
    <FieldLabel class={"flex flex-row items-center cursor-pointer", @class}>
      <RadioButton
        field={@field}
        click={@click}
        class="hide-visually radio-button disabled:opacity-[35]"
        value={@value}
        opts={
          disabled: @disabled
        }
      />

      <InputContext assigns={assigns} :let={form: form, field: field}>
        <span class={
          "radio-button-icon text-trunks-100 hover:bg-gray-transparent flex items-center justify-center rounded-full w-6 h-6 min-w-[24px] min-h-[24px] relative mr-1 z-2 transition-[background-color] duration-[400ms]",
          get_before_pseudo_styles(),
          get_after_pseudo_styles(),
          get_checked_css(@checked || is_selected(Phoenix.HTML.Form.input_value(form, field), @value)),
          "opacity-[.35] cursor-not-allowed": @disabled,
          "hover:brighten-[143] hover:bg-piccolo-100": @checked || is_selected(Phoenix.HTML.Form.input_value(form, field), @value)
        } />
      </InputContext>


      <span
        class={"bg-rochi-100 pl-2", "opacity-[.35] cursor-not-allowed": @disabled}>
        <#slot />
      </span>
    </FieldLabel>
    """
  end

  defp get_before_pseudo_styles() do
    "before:content-[''] before:bg-piccolo-100 before:h-2 before:w-2 before:absolute
    before:top-1/2 before:left-1/2 before:rounded-full before:z-[2]
    before:-translate-x-1/2 before:-translate-y-1/2
    before:transition-all duration-300"
  end

  defp get_after_pseudo_styles() do
    "after:content-[''] after:h-4 after:w-4 after:bg-transparent after:absolute
    after:top-1/2 after:left-1/2 after:rounded-full
    after:-translate-x-1/2 after:-translate-y-1/2
    after:transition-[border-color] after:ease-in-out after:duration-200"
  end

  defp get_checked_css(selected) do
    if selected == true do
      "before:scale-1 after:radio-button-checked-outline"
    else
      "before:scale-0 after:radio-button-unchecked-outline"
    end
  end
end
