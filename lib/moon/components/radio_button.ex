defmodule Moon.Components.RadioButton do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.FieldLabel
  alias Surface.Components.Form.Input.InputContext

  prop(id, :string)
  prop(field, :atom)
  prop(click, :event)
  prop(checked, :boolean)
  prop(value, :any)
  prop(disabled, :boolean)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class={"relative inline-flex items-center select-none", @class, "opacity-disabled": @disabled}>
      <Surface.Components.Form.RadioButton
        id={@id}
        field={@field}
        click={@click}
        class="z-10 absolute left-0 opacity-0"
        value={@value}
        opts={disabled: @disabled}
      />
      <InputContext assigns={assigns} :let={form: form, field: field}>
        {fake_radio(
          assigns,
          selected: @checked || is_selected(Phoenix.HTML.Form.input_value(form, field), @value)
        )}
      </InputContext>

      <FieldLabel for={@id} field={@field} class="bg-rochi-100 pl-2"><#slot /></FieldLabel>
    </div>
    """
  end

  def is_selected(current_value, value) do
    current_value == value
  end

  def fake_radio(assigns, selected: selected) do
    ~F"""
    <div class={
      "z-0 left-0 rounded-full w-4 h-4 place-content-center grid border",
      "border-trunks-100": !selected,
      "border-piccolo-100": selected
    }>
      <div class={"bg-piccolo-100 rounded-full w-2 h-2", invisible: !selected}>
      </div>
    </div>
    """
  end
end
