defmodule MoonWeb.Pages.Components.BadgePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Badge
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/badge",
        name: "Badge"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown gap={4}>
        <Heading size={56} class="mb-4">Badge</Heading>
        <p>
          Small count and labeling component.
        </p>

        <p>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/badge.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/badge">React implementation</Link>
        </p>

        <ExampleAndCode title="Badge" id="badge1">
          <:example>
            <LeftToRight>
              <Badge>
                Active
              </Badge>
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
      <Badge>
        Active
      </Badge>
    </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Customize colours" id="badge2">
          <:note>
            You coud simstly use color and background_color props
          </:note>
          <:example>
            <LeftToRight>
              <Badge color="gohan-100" background_color="piccolo-100">
                Active
              </Badge>
              <Badge color="krillin-100" background_color="trunks-100">
                Active
              </Badge>
              <Badge color="bulma-100" background_color="dodoria-100">
                Active
              </Badge>
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
        <Badge color="gohan-100" background_color="piccolo-100">
          Active
        </Badge>
        <Badge color="krillin-100" background_color="trunks-100">
          Active
        </Badge>
        <Badge color="bulma-100" background_color="dodoria-100">
          Active
        </Badge>
    </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Customize size" id="badge3">
          <:note>
            You coud simply use size prop. By default size is xSmall. You can change it to Small.
          </:note>
          <:example>
            <LeftToRight>
              <Badge>Default</Badge>
              <Badge size="small">
                small size
              </Badge>
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
        <Badge>Default</Badge>
        <Badge size="small">
          small size
        </Badge>
      </LeftToRight>
    </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
