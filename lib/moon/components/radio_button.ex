defmodule Moon.Components.RadioButton do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.FieldLabel
  alias Surface.Components.Form.RadioButton
  alias Moon.Components.Lego.Radio

  prop(id, :string)
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  prop(click, :event)
  prop(checked, :boolean, default: false)
  prop(disabled, :boolean)
  prop(class, :string)
  prop(value, :string)
  slot(default)

  def is_selected(current_value, value) do
    "#{current_value}" == "#{value}"
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
      <Radio
        class={"cursor-not-allowed": @disabled}
        is_selected={@checked || is_selected(Phoenix.HTML.Form.input_value(@form, @field), @value)}
      />
      <span class={"bg-rochi-100 pl-2", "opacity-[.35] cursor-not-allowed": @disabled}>
        <#slot />
      </span>
    </FieldLabel>
    """
  end
end
