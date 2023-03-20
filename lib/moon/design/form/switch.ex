defmodule Moon.Design.Form.Switch do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Design.Switch

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  prop(is_switched, :boolean, default: false)
  prop(options, :list, default: [])
  prop(value, :any)
  prop(name, :string, required: true)

  prop(disabled, :boolean, default: false)
  prop(size, :string, values: ["2xs", "xs", "sm"], default: "sm")
  prop(on_bg_color, :css_class, default: "bg-piccolo")
  prop(off_bg_color, :css_class, default: "bg-beerus")
  prop(class, :css_class)
  prop(test_id, :string)

  slot(on_icon)
  slot(off_icon)

  def render(assigns) do
    ~F"""
    <div>
      <input type="checkbox" name={@name} value={@value} checked={@is_switched} class="hidden">
      <Switch
        id={@id}
        {=@size}
        {=@on_bg_color}
        {=@off_bg_color}
        {=@disabled}
        {=@class}
        {=@test_id}
        on_change="toggle_switch"
        is_switched={is_true(@is_switched) || is_true(Phoenix.HTML.Form.input_value(@form, @field))}
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

  def is_true(val) do
    Enum.member?([true, "true"], val)
  end

  def handle_event("toggle_switch", _params, socket) do
    {:noreply, assign(socket, is_switched: !socket.assigns.is_switched)}
  end
end
