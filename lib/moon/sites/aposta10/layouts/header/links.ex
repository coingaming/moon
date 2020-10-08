defmodule Moon.Sites.Aposta10.Layouts.Header.Links do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Layouts.Header.Links.Link
  alias Moon.Components.Carousel

  def render(assigns) do
    class_name = get_class_name("site-header-links")

    links = [
      %{icon: "sports_foot_ball", text: "Soccer", color: "#D33030"},
      %{icon: "sports_tennis", text: "Tennis", color: "#FFAB00"},
      %{icon: "sports_basket_ball", text: "Basketball", color: "#B3804A"},
      %{icon: "sports_volley_ball", text: "Volleyball", color: "#0F75BD"},
      %{icon: "sports_base_ball", text: "Baseball", color: "#B8AAA7"},
      %{icon: "sports_boxing", text: "Boxing", color: "#B8AAA7"},
      %{icon: "sports_boxing", text: "UFC", color: "#D33030"}
    ]

    ~H"""
    <style>
      .{{ class_name }} {
        position: absolute;
        left: 0px;
        right: 0px;
        padding-bottom: 20px;
        top: 100px;
        background-color: #fff;
        z-index: 100;
      }

      {{ for_desktop() }} {
        .{{ class_name }} {
          position: fixed;
          top: 0px;
          padding-top: 20px;
          left: 232px;
        }
      }
    </style>

    <div class={{ class_name }}>
      <Carousel>
        <Link icon={{ link.icon }} text={{ link.text }} color={{ link.color }} :for={{ link <- links }}/>
      </Carousel>
    </div>
    """
  end
end
