defmodule Moon.Sites.Aposta10.Body.Picks.Tips.Item do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Config
  alias Moon.Components.Label
  alias Moon.Components.Text
  alias Moon.Components.Inline
  alias Moon.Sites.Aposta10.Body.Picks.Tips.Item.Opponents

  def render(assigns) do
    class_name = get_classname("site-body-picks-tips-item")

    ~H"""
    <style>
      .{{ class_name }} {
        position: relative;
        padding: 10px;
        border-bottom: thin solid #DBE0E3;
      }

      .{{ class_name }} > .body {
        padding-top: 10px;
      }

      .{{ class_name }} .thumb {
        border-radius: 50%;
      }

      {{ for_desktop() }} {
        .{{ class_name }} {
          display: inline-block;
          width: 33%;
          border-bottom: none;
          background-color: #fff;
          margin-top: 10px;
          border-radius: 12px;
        }
      }
    </style>

    <div class={{ class_name }}>
      <Label background={{ Config.colors.color5 }}>Bundesliga</Label>
      <Text style="position: absolute; top: 10px; right: 10px;" color={{ Config.colors.color6 }}>Feb 7 at 20:30</Text>

      <Inline>
        <img class="thumb" src={{ "/uploads/img/site/daniel.svg" }} />
        <Opponents a="liverpool" b="real" />
      </Inline>

    </div>
    """
  end
end
