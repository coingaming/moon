defmodule Moon.Sites.Aposta10.Layouts.Header.Menu.Link do
  use Moon.StatelessComponent
  alias Moon.Components.Text

  prop(count, :integer)

  def render(assigns) do
    class_name = get_class_name("Moon.Sites.Aposta10.Layouts.Header.Menu.Link")

    ~H"""
    <style>
      .{{ class_name }} {
        padding-top: 10px;
        padding-bottom: 10px;
        position: relative;
      }
    </style>

    <div class={{ class_name }}>
      <Text size=12><slot /></Text>
      <Text style="color: #38A174; position: absolute; right: 0px; top: 10px;" :if={{ @count }}>{{ @count }}</Text>
    </div>
    """
  end
end
