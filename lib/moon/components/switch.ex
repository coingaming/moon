defmodule Moon.Components.Switch do
  use Moon.StatelessComponent

  property on_click, :event
  property left_label, :string
  property left_value, :string
  property right_label, :string
  property right_value, :string
  property value, :string
  property style, :string

  def render(assigns) do
    class_name = get_classname("components-switch-#{assigns.style}")

    next_value = %{
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
