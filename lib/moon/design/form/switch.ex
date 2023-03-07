defmodule Moon.Design.Form.Switch do
  @moduledoc false

  use Moon.StatefulComponent

  prop(field, :atom)
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  prop(checked, :boolean, default: false)

  prop(options, :list, default: [])
  prop(value, :any)
  prop(class, :css_class)

  prop(on_change, :event)

  def render(assigns) do
    ~F"""
    <div>
      <Surface.Components.Form.RadioButton
        {=@form}
        {=@field}
        class="hidden"
        value="true"
        opts={
          id: "#{@id}_radio_true",
          checked: is_selected(@checked, @form, @field)
        }
      />
      <Surface.Components.Form.RadioButton
        {=@form}
        {=@field}
        class="hidden"
        value="false"
        opts={
          id: "#{@id}_radio_false",
          checked: !is_selected(@checked, @form, @field)
        }
      />
    </div>
    """
  end

  def is_true(val) do
    Enum.member?([true, "true"], val)
  end

  def is_selected(checked, form, field) do
    is_true(checked) || is_true(Phoenix.HTML.Form.input_value(form, field))
  end
end
