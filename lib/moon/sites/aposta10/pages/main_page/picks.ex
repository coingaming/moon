defmodule Moon.Sites.Aposta10.Pages.MainPage.Picks do
  use Moon.StatelessComponent

  alias Moon.Components.Text
  alias Moon.Components.Button

  alias Moon.Sites.Aposta10.Pages.MainPage.Picks
  alias Picks.DatePicker
  alias Picks.Tips

  def render(assigns) do
    ~H"""
    <style>
      .site-body-picks {
      }
    </style>

    <div class="site-body-picks">
      <Text size=20>Picks & tips</Text>
      <DatePicker />
      <Tips />
      <div style="padding: 10px">
        <Button>See all tips</Button>
      </div>
    </div>
    """
  end
end
