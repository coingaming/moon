defmodule Moon.Components.Switch do
  use Moon.StatelessComponent

  prop(on_click, :event)
  prop(left_label, :string)
  prop(left_value, :string)
  prop(right_label, :string)
  prop(right_value, :string)
  prop(value, :string)
  prop(style, :string)

  def render(assigns) do
    class_name = get_class_name("components-switch-#{assigns.style}")

    next_value =
      %{
        assigns.left_value => assigns.right_value,
        assigns.right_value => assigns.left_value
      }[assigns.value]

    ~H"""
    <div class={{ class_name }} :on-phx-click={{ @on_click }} phx-value-new_value={{ next_value }}>
      <style>
        .{{ class_name }} {

        }
      </style>

      {{ @left_label }}
      Next value: {{ next_value }}
      {{ @right_label }}

    </div>
    """
  end
end
