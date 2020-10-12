defmodule Moon.Sites.MoonDocs.Layouts.Header.Menu.Link do
  use Moon.StatelessComponent
  alias Moon.Components.Text

  prop(to, :string)

  def render(assigns) do
    class_name = get_class_name("Moon.Sites.MoonDocs.Layouts.Header.Menu.Link")

    ~H"""
    <style>
      .{{ class_name }} {
        padding-top: 10px;
        padding-bottom: 10px;
        position: relative;
      }
    </style>

    <div class={{ class_name }}>
      <Moon.Components.Link to={{ @to }}><Text size=12><slot /></Text></Moon.Components.Link>
    </div>
    """
  end
end
