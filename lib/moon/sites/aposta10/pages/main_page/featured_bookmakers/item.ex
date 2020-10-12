defmodule Moon.Sites.Aposta10.Pages.MainPage.FeaturedBookmakers.Item do
  use Moon.StatelessComponent
  alias Moon.Components.Text
  alias Moon.Components.Button
  alias Moon.Components.Inline

  prop(logo, :string)
  prop(description, :string)
  prop(action, :string)

  def render(assigns) do
    class_name = get_class_name("site-body-featured-bookmakers-item")

    ~H"""
    <style>
      .{{ class_name }} {
        width: 90vw;
        display: inline-block;
        padding: 10px;
        margin-right: 10px;
        border-radius: 12px;
        background-color: #fff;
      }

      {{ for_desktop() }} {
        .{{ class_name }} {
          max-width: 24%;
        }
      }
    </style>

    <div class={{ class_name }}>
      <Inline>
        <img class={{ "#{class_name}-thumb" }} src={{ "/uploads/img/site/#{@logo}" }} />
        <Text style="padding-top: 10px;">{{ @description }}</Text>
        <Button style="margin-top: 20px; border: 1px solid #DBE0E3; color: #8697A2; background: none;">{{ @action }}</Button>
      </Inline>
    </div>
    """
  end
end
