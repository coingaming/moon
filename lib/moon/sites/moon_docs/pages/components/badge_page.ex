defmodule Moon.Sites.MoonDocs.Pages.Components.BadgePage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Badge
  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <p>
          <h1>Badge</h1>
          Default size count and labeling component
        </p>

        <Badge color="bulma_100" background_color="dodoria_100">
          Active
        </Badge>

        <#CodePreview>
          <Badge color="bulma_100" background_color="dodoria_100">
            Active
          </Badge>
        </#CodePreview>

        <p>
          <h2>Customize colours</h2>
          You coud simply use color and background_color props
        </p>

        <Inline>
          <Badge color="bulma_100" background_color="piccolo_100">
            Active
          </Badge>
          <Badge color="krillin_100" background_color="gohan_100">
            Active
          </Badge>
          <Badge color="bulma_100" background_color="dodoria_100">
            Active
          </Badge>
        </Inline>

        <#CodePreview>
          <Inline>
            <Badge color="bulma_100" background_color="piccolo_100">
              Active
            </Badge>
            <Badge color="krillin_100" background_color="gohan_100">
              Active
            </Badge>
            <Badge color="bulma_100" background_color="dodoria_100">
              Active
            </Badge>
          </Inline>
        </#CodePreview>

        <p>
          <h2>Customize size</h2>
          You coud simply use size prop. By default size is xSmall. You can change it to Small.
        </p>

        <Inline>
          <Badge background_color="piccolo_100">xSmall size</Badge>
          <Badge background_color="piccolo_100" size="small">
            small size
          </Badge>
        </Inline>

        <#CodePreview>
          <Inline>
            <Badge background_color="piccolo_100">xSmall size</Badge>
            <Badge background_color="piccolo_100" size="small">
              small size
            </Badge>
          </Inline>
        </#CodePreview>

      </DefaultLayout>
    </Themed>
    """
  end
end
