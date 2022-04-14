defmodule Moon.Components.Radiobutton do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.FieldLabel

  prop(id, :string)
  prop(field, :atom)
  prop(click, :event)
  prop(checked, :boolean)
  prop(disabled, :boolean)
  prop(class, :string)
  prop(value, :string)
  slot(default)

  def is_true(val) do
    Enum.member?([true, "true"], val)
  end

  def render(assigns) do
    ~F"""
      <label class={"flex flex-row items-center cursor-pointer", @class}>
        <Surface.Components.Form.RadioButton
          field={@field}
          click={@click}
          class="hide-visually radio-button"
          value={@value}
          opts={
            disabled: @disabled
          }
        />
        <span class="radio-button-icon text-trunks-100"></span>
        <FieldLabel field={@field} class="bg-rochi-100 pl-2"><#slot /></FieldLabel>
      </label>
    """
  end
end
