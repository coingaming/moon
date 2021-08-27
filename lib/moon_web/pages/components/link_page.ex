defmodule MoonWeb.Pages.Components.LinkPage do
  use MoonWeb, :live_view
  alias Moon.Components.Link
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Breadcrumbs

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/link",
        name: "Link"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={32}>Link</Heading>
      <p>
        <Link to="#">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/link_page.ex">Sourcecode of this page</Link>
        <Link to="#">React implementation</Link>
      </p>

      <ExampleAndCode>
        <:example>
          <Link to="#">I'm a link</Link>

          <Link to="#" secondary>
            I'm a Secondary link
          </Link>

          <Link to="#" optional>
            I'm an Optional link
          </Link>

          <Link to="#" disabled>
            I'm a disabled link
          </Link>
        </:example>

        <:code>
          <#CodePreview>
      <Link to="#">I'm a link</Link>

      <Link to="#" secondary>
        I'm a Secondary link
      </Link>

      <Link to="#" optional>
        I'm an Optional link
      </Link>

      <Link to="#" disabled>
        I'm a disabled link
      </Link>
    </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
