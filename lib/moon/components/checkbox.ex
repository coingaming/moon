defmodule Moon.Components.Checkbox do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.FieldLabel
  alias Moon.Components.Lego.Checkbox

  prop(id, :string)
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  prop(click, :event)
  prop(checked, :boolean)
  prop(disabled, :boolean)
  prop(readonly, :boolean, default: false)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class={"relative inline-flex items-center select-none", @class, "opacity-disabled": @disabled}>
      <Surface.Components.Form.Checkbox
        field={@field}
        click={!@readonly && @click}
        class={
          "z-10 absolute left-0 opacity-0 cursor-pointer",
          "cursor-not-allowed select-none": @readonly
        }
        checked_value="true"
        unchecked_value="false"
        opts={disabled: @disabled, readonly: @readonly}
      />
      <Checkbox is_selected={is_true(@checked) || is_true(Phoenix.HTML.Form.input_value(@form, @field))} />

      <FieldLabel field={@field} class="bg-rochi-100 pl-2"><#slot /></FieldLabel>
    </div>
    """
  end

  def is_true(val) do
    Enum.member?([true, "true"], val)
  end
end
