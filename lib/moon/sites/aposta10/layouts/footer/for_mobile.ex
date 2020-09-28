defmodule Moon.Sites.Aposta10.Layouts.Footer.ForMobile do
  use Moon.StatelessComponent

  alias Moon.Components.Stack
  alias Moon.Components.Text
  alias Moon.Sites.Aposta10.Layouts.Footer.FollowUs
  alias Moon.Sites.Aposta10.Layouts.Footer.SubscribeToTips

  def render(assigns) do
    class_name = "site-body-footer-for-mobile"

    ~H"""
    <style>
      .{{ class_name }} {
        padding: 20px;
      }

      {{ for_desktop() }} {
        .{{ class_name }} {
          display: none;
        }
      }
    </style>

    <div class={{ class_name }}>
      <SubscribeToTips />
      <Stack>
        <Text size=14 weight=600>Follow us</Text>
        <FollowUs />
        <Text size=12 color="#AAB6BE">
          At Bet 10 you stay on top of the world of sports betting, with news, promotions, articles and betting tips that will help you profit.
        </Text>
      </Stack>
    </div>
    """
  end
end
