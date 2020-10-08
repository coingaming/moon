defmodule Moon.Sites.Aposta10.Layouts.Header.Menu.Separator do
  use Moon.StatelessComponent

  def render(assigns) do
    class_name = get_class_name("Moon.Sites.Aposta10.Layouts.Header.Menu.Separator")

    ~H"""
    <style>
      .{{ class_name }} {
        border-bottom: 1px solid #E7EAEC;
        padding-top: 10px;
        margin-bottom: 10px;
      }
    </style>

    <div class={{ class_name }}>
    </div>
    """
  end
end
