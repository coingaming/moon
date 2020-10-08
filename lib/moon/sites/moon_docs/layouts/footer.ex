defmodule Moon.Sites.MoonDocs.Layouts.Footer do
  use Moon.StatelessComponent
  use Moon.Components.Context

  alias Moon.Components.Switch

  def render(assigns) do
    class_name = get_class_name("Moon.Sites.MoonDocs.Layouts.Footer")

    ~H"""
    <Context get={{ :theme }}>

      <style>
        {{ for_desktop() }} {
          .{{ class_name }} {
            margin-left: 232px;
            padding: 20px;
          }
        }
      </style>

      <div class={{ class_name }}>
        <Switch
          on_click="toggle_theme"
          left_label="PM"
          left_value="moondocs-light"
          right_label="AM"
          right_value="moondocs-dark"
          value={{ @theme.id }}
        />
      </div>

    </Context>
    """
  end
end
