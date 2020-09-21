defmodule Moon.Sites.Aposta10.Body.Picks do
  use Moon.StatelessComponent

  alias Moon.Components.Text
  alias Moon.Components.Button

  alias Moon.Sites.Aposta10.Body.Picks
  alias Moon.Sites.Aposta10.Body.Picks.DatePicker
  alias Moon.Sites.Aposta10.Body.Picks.Tips

  def render(assigns) do
    ~H"""
    <style>
      .site-body-picks {
      }
    </style>

    <div class="site-body-picks">
      <Text size=20 weight=600 padding="20px" padding_top="30px">Picks & tips</Text>
      <DatePicker />
      <Tips />
      <div style="padding: 10px">
        <Button margin="10px">See all tips</Button>
      </div>
    </div>
    """
  end
end
