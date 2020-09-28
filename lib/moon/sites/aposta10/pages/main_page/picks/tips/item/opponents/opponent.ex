defmodule Moon.Sites.Aposta10.Pages.MainPage.Picks.Tips.Item.Opponents.Opponent do
  use Moon.StatelessComponent
  alias Moon.Components.Text
  alias Moon.Components.Inline

  property name, :string, required: true

  def render(assigns) do
    class_name = "site-body-picks-tips-item-opponents-opponent"

    ~H"""
    <style>
      .{{ class_name }} {
      }
    </style>

    <div class={{ class_name }}>
      <Inline>
        <img class="thumb" src={{ "/uploads/img/site/teams/#{@name}.svg" }} />
        <Text>{{ @name }}</Text>
      </Inline>
    </div>
    """
  end
end
