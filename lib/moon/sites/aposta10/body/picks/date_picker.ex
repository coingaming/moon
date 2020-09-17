defmodule Moon.Sites.Aposta10.Body.Picks.DatePicker do
  use Moon.StatelessComponent

  alias Moon.Components.Carousel
  alias Moon.Sites.Aposta10.Body.Picks.DatePicker.Item

  def render(assigns) do
    ~H"""
    <style>
      .site-body-picks-date-picker {
        border-bottom: solid 2px #DBE0E3;
        padding-left: 10px;
      }
    </style>

    <div class="site-body-picks-date-picker">
      <Carousel>
        <Item day=0 active=true />
        <Item day=1 />
        <Item day=2 />
        <Item day=3 />
        <Item day=4 />
        <Item day=5 />
      </Carousel>
    </div>
    """
  end
end
