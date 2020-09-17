defmodule Moon.Components.C do
  use Moon.StatelessComponent

  property columns, :integer, default: 1

  def render(assigns) do
    class_name = get_classname("components-c-#{assigns.columns}")

    ~H"""
    <style>
      .{{ class_name }} {
        column-count: {{ @columns }};
      }
    </style>

    <div class={{ class_name }}>
      <slot />
    </div>
    """
  end
end
