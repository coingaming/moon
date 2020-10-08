defmodule Moon.Sites.MoonDocs.Layouts.Header.Menu.Title do
  use Moon.StatelessComponent
  alias Moon.Components.Text

  def render(assigns) do
    class_name = get_class_name("Moon.Sites.MoonDocs.Layouts.Header.Menu.Title")

    ~H"""
    <style>
      .{{ class_name }} {
        padding-top: 10px;
        padding-bottom: 10px;
        position: relative;
      }
    </style>

    <div class={{ class_name }}>
      <Text size=18><slot /></Text>
    </div>
    """
  end
end
