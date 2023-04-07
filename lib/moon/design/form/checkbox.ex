defmodule Moon.Design.Form.Checkbox do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Lego.Checkbox
  alias Moon.Design.Form.Field.Label
  import Moon.Helpers.Form, only: [value_is_true: 2]

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  prop(label, :string)

  prop(disabled, :boolean)
  prop(readonly, :boolean)

  prop(testid, :string)
  prop(class, :string)
  prop(on_click, :event)

  def render(assigns) do
    ~F"""
    <Label
      size="sm"
      class={
        "relative inline-flex items-center select-none",
        "opacity-disabled": @disabled,
        "cursor-not-allowed select-none": @readonly || @disabled
      }
      {=@field}
      {=@form}
    >
      <Surface.Components.Form.Checkbox
        {=@field}
        {=@form}
        click={(!@readonly && !@disabled && @on_click) || nil}
        class="opacity-0"
        opts={disabled: @disabled || @readonly, readonly: @readonly}
      />
      <Checkbox
        is_selected={value_is_true(@form, @field)}
        class={merge([
          "absolute top-1 ltr:left-0 rtl:right-0",
          @class
        ])}
        {=@testid}
      />
      {@label}
    </Label>
    """
  end
end
