defmodule Moon.Sites.Aposta10.Body.Picks.Tips.Item.Opponents do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Body.Picks.Tips.Item.Opponents.Opponent

  property a, :string, required: false
  property b, :string, required: false

  def render(assigns) do
    ~H"""
    <style>
      .site-body-picks-tips-item-opponents {
        position: relative;
        padding: 10px;
      }
    </style>

    <div class="site-body-picks-tips-item-opponents">
      <Opponent name={{ @a }} />
      <Opponent name={{ @b }} />
    </div>
    """
  end
end
