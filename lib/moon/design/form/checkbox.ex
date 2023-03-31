defmodule Moon.Design.Form.Checkbox do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Lego.Checkbox
  import Moon.Helpers.Form, only: [value_is_true: 2]

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  prop(disabled, :boolean)
  prop(readonly, :boolean)

  prop(testid, :string)
  prop(class, :string)
  prop(on_click, :event)
  prop(selected_class, :css_class, default: "bg-piccolo")
  prop(unselected_class, :css_class, default: "shadow-trunks")

  def render(assigns) do
    ~F"""
    <div class={"relative inline-flex items-center select-none", @class, "opacity-disabled": @disabled}>
      <Surface.Components.Form.Checkbox
        {=@field}
        {=@form}
        click={!@readonly && @on_click}
        class={
          "z-10 absolute left-0 opacity-0 cursor-pointer",
          "cursor-not-allowed select-none": @readonly || @disabled
        }
        opts={disabled: @disabled, readonly: @readonly, "data-testid": @testid}
      />
      <Checkbox
        is_selected={value_is_true(@form, @field)}
        {=@class}
        {=@testid}
        {=@selected_class}
        {=@unselected_class}
      />
    </div>
    """
  end
end
