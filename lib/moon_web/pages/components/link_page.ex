defmodule MoonWeb.Pages.Components.LinkPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/link",
        name: "Link"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <Heading size={56} class="mb-4">Link</Heading>
        <p>
          <Link to="#">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/link_page.ex">Sourcecode of this page</Link>
          <Link to="#">React implementation</Link>
        </p>

        <ExampleAndCode id="link_1">
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

          <:code>{link_1_code()}</:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def link_1_code do
    """
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
    """
  end
end
