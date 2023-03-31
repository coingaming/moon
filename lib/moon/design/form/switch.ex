defmodule Moon.Design.Form.Switch do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Switch
  import Phoenix.HTML.Form, only: [input_id: 2]
  import Moon.Helpers.Form, only: [value_is_true: 2]
  alias Phoenix.LiveView.JS

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  prop(disabled, :boolean, default: false)
  prop(readonly, :boolean, default: false)

  prop(size, :string, values: ["2xs", "xs", "sm"], default: "sm")
  prop(on_bg_color, :css_class, default: "bg-piccolo")
  prop(off_bg_color, :css_class, default: "bg-beerus")

  prop(class, :css_class)
  prop(testid, :string)
  prop(id, :string)

  slot(on_icon)
  slot(off_icon)

  def render(assigns) do
    ~F"""
    <div>
      <Surface.Components.Form.Checkbox
        {=@field}
        {=@form}
        class="hidden"
        opts={disabled: @disabled, readonly: @readonly}
      />
      <Switch
        {=@size}
        {=@on_bg_color}
        {=@off_bg_color}
        disabled={@disabled || @readonly}
        {=@class}
        {=@testid}
        {=@id}
        on_change={on_click(@form, @field)}
        checked={value_is_true(@form, @field)}
      >
        <:on_icon>
          <#slot {@on_icon} />
        </:on_icon>
        <:off_icon>
          <#slot {@off_icon} />
        </:off_icon>
      </Switch>
    </div>
    """
  end

  defp on_click(form, field) do
    JS.dispatch("moon2:update-switch",
      detail: %{checked: !value_is_true(form, field)},
      to: "##{input_id(form, field)}"
    )
  end
end
