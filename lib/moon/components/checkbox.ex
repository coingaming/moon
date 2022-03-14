defmodule Moon.Components.Checkbox do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.FieldLabel
  alias Surface.Components.Form.Input.InputContext

  prop(id, :string)
  prop(field, :atom)
  prop(click, :event)
  prop(checked, :boolean)
  prop(disabled, :boolean)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class={"relative inline-flex items-center select-none", @class, "opacity-disabled": @disabled}>
      <Surface.Components.Form.Checkbox
        field={@field}
        click={@click}
        class="z-10 absolute left-0 opacity-0"
        checked_value="true"
        unchecked_value="false"
        opts={disabled: @disabled}
      />
      <InputContext assigns={assigns} :let={form: form, field: field}>
        {fake_checkbox(
          assigns,
          selected: is_true(Phoenix.HTML.Form.input_value(form, field)) || is_true(@checked)
        )}
      </InputContext>

      <FieldLabel field={@field} class="bg-rochi-100 pl-2"><#slot /></FieldLabel>
    </div>
    """
  end

  def is_true(val) do
    Enum.member?([true, "true"], val)
  end

  def fake_checkbox(assigns, selected: selected) do
    ~F"""
    <div class={
      "z-0 left-0 rounded-sm w-4 h-4 inline-block",
      "border border-trunks-100": !selected,
      "border border-piccolo-100 bg-piccolo-100": selected
    }>
      {#if selected}
        <div style="padding-left: 2px; padding-top: 4px">
          <svg width="10" height="7" viewBox="0 0 10 7" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path
              fill-rule="evenodd"
              clip-rule="evenodd"
              d="M9 0C8.72 0 8.47 0.11 8.29 0.29L4 4.59L1.71 2.29C1.53 2.11 1.28 2 1 2C0.45 2 0 2.45 0 3C0 3.28 0.11 3.53 0.29 3.71L3.29 6.71C3.47 6.89 3.72 7 4 7C4.28 7 4.53 6.89 4.71 6.71L9.71 1.71C9.89 1.53 10 1.28 10 1C10 0.45 9.55 0 9 0Z"
              fill="white"
            />
          </svg>
        </div>
      {/if}
    </div>
    """
  end
end
