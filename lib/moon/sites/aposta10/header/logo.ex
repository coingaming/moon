defmodule Moon.Sites.Aposta10.Header.Logo do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Config

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
      <img src={{ "/uploads/img/site/logo.svg" }} />
    </div>
    """
  end
end
