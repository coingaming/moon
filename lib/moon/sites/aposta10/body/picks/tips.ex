defmodule Moon.Sites.Aposta10.Body.Picks.Tips do
  use Moon.StatelessComponent

  alias Moon.Sites.Aposta10.Body.Picks.Tips.Item

  def render(assigns) do
    ~H"""
    <style>
      .site-body-picks-date-tips {
      }
    </style>

    <div class="site-body-picks-date-tips">
      <Item day=0 />
      <Item />
      <Item />
      <Item />
      <Item />
      <Item />
    </div>
    """
  end
end
