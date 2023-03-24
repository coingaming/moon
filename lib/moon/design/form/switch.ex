defmodule Moon.Design.Form.Switch do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Design.Switch

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  prop(value, :boolean)

  prop(disabled, :boolean, default: false)
  prop(readonly, :boolean, default: false)

  prop(size, :string, values: ["2xs", "xs", "sm"], default: "sm")
  prop(on_bg_color, :css_class, default: "bg-piccolo")
  prop(off_bg_color, :css_class, default: "bg-beerus")
  prop(class, :css_class)
  prop(testid, :string)

  slot(on_icon)
  slot(off_icon)

  def render(assigns) do
    ~F"""
    <div>
      <Surface.Components.Form.Checkbox
        {=@field}
        {=@form}
        class="hidden"
        opts={disabled: @disabled}
        value={@value}
      />
      <Switch
        id={"#{@id}-switch"}
        {=@size}
        {=@on_bg_color}
        {=@off_bg_color}
        {=@disabled}
        {=@class}
        {=@testid}
        on_change="toggle_switch"
        checked={get_value(assigns)}
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

  defp get_value(%{value: nil, form: form, field: field}),
    do: Phoenix.HTML.Form.input_value(form, field)

  defp get_value(%{value: value}), do: value

  def handle_event("toggle_switch", _params, socket) do
    {:noreply, assign(socket, value: !get_value(socket.assigns))}
  end
end
