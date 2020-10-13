defmodule Moon.Sites.MoonDocs.Layouts.Header.Logo do
  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconMoon

  def render(assigns) do
    class_name = get_class_name("site-header-logo")

    ~H"""
    <style>
      .{{ class_name }} {
        position: absolute;
        top: 13px;
        width: 100%;
        text-align: center;
      }

      {{ for_desktop() }} {
        .{{ class_name }} {
          position: fixed;
          width: 232px;
        }
      }
    </style>

    <div class={{ class_name }}>
      <IconMoon color="piccolo_100" background_color="gohan_100" />
    </div>
    """
  end
end
