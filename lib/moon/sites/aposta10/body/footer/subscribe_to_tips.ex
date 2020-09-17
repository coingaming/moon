defmodule Moon.Sites.Aposta10.Body.Footer.SubscribeToTips do
  use Moon.StatelessComponent

  alias Moon.Components.Text
  alias Moon.Components.TextInput
  alias Moon.Components.Button

  def render(assigns) do
    class_name = get_classname("site-body-subscribe-to-tips")

    ~H"""
    <style>
      .{{ class_name }} {
        padding: 20px;
        background-color: #F3F5F6;
      }

      {{ for_desktop() }} {
        .{{ class_name }} {
          display: none;
        }
      }
    </style>

    <div class={{ class_name }}>
      <Text size=20 style="padding: 20px;">Receive our tips by email</Text>
      <Text>Email address</Text>
      <div style="position: relative;">
        <TextInput name="lol" placeholder="your@example.com" style="padding: 15px; border-radius: 12px; border: thin solid #ccc; background: none; width: 100%;" />
        <Button style="position: absolute; right: 5px; top: 5px; border-radius: 12px;">Subscribe</Button>
      </div>
    </div>
    """
  end
end
