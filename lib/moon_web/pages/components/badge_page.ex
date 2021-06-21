defmodule MoonWeb.Pages.Components.BadgePage do
  use MoonWeb, :live_view
  alias Moon.Components.Badge
  alias Moon.Components.Inline
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

    <Inline>
      <Badge color="bulma-100" background_color="piccolo-100">
        Active
      </Badge>
      <Badge color="krillin-100" background_color="gohan-100">
        Active
      </Badge>
      <Badge color="bulma-100" background_color="dodoria-100">
        Active
      </Badge>
    </Inline>

    <#CodePreview>
      <Inline>
        <Badge color="bulma-100" background_color="piccolo-100">
          Active
        </Badge>
        <Badge color="krillin-100" background_color="gohan-100">
          Active
        </Badge>
        <Badge color="bulma-100" background_color="dodoria-100">
          Active
        </Badge>
      </Inline>
    </#CodePreview>

    <p>
      <h2>Customize size</h2>
      You coud simply use size prop. By default size is xSmall. You can change it to Small.
    </p>

    <Inline>
      <Badge background_color="piccolo-100">xSmall size</Badge>
      <Badge background_color="piccolo-100" size="small">
        small size
      </Badge>
    </Inline>

    <#CodePreview>
      <Inline>
        <Badge background_color="piccolo-100">xSmall size</Badge>
        <Badge background_color="piccolo-100" size="small">
          small size
        </Badge>
      </Inline>
    </#CodePreview>
    """
  end
end
