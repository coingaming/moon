defmodule MoonWeb.Pages.Components.BadgePage do
  use MoonWeb, :live_view
  alias Moon.Components.Badge
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.CodePreview

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <p>
      <h1>Badge</h1>
      Default size count and labeling component
    </p>

    <Badge color="bulma-100" background_color="dodoria-100">
      Active
    </Badge>

    <#CodePreview>
      <Badge color="bulma-100" background_color="dodoria-100">
        Active
      </Badge>
    </#CodePreview>

    <p>
      <h2>Customize colours</h2>
      You coud simply use color and background_color props
    </p>

    <LeftToRight>
      <Badge color="bulma-100" background_color="piccolo-100">
        Active
      </Badge>
      <Badge color="krillin-100" background_color="gohan-100">
        Active
      </Badge>
      <Badge color="bulma-100" background_color="dodoria-100">
        Active
      </Badge>
    </LeftToRight>

    <#CodePreview>
      <LeftToRight>
        <Badge color="bulma-100" background_color="piccolo-100">
          Active
        </Badge>
        <Badge color="krillin-100" background_color="gohan-100">
          Active
        </Badge>
        <Badge color="bulma-100" background_color="dodoria-100">
          Active
        </Badge>
      </LeftToRight>
    </#CodePreview>

    <p>
      <h2>Customize size</h2>
      You coud simply use size prop. By default size is xSmall. You can change it to Small.
    </p>

    <LeftToRight>
      <Badge background_color="piccolo-100">xSmall size</Badge>
      <Badge background_color="piccolo-100" size="small">
        small size
      </Badge>
    </LeftToRight>

    <#CodePreview>
      <LeftToRight>
        <Badge background_color="piccolo-100">xSmall size</Badge>
        <Badge background_color="piccolo-100" size="small">
          small size
        </Badge>
      </LeftToRight>
    </#CodePreview>
    """
  end
end
