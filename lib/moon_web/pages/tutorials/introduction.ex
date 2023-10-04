defmodule MoonWeb.Pages.Tutorials.Introduction do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Carousel
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Tutorials"
      },
      %{
        to: "/tutorials/process-description-and-team-interactions",
        name: "Introduction"
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
        <Heading size={32}>Design team and design rules</Heading>

        <Carousel class="mt-4 mb-8">
          <Link
            class="w-10/12 overflow-hidden carousel-item mr-4 bg-goku"
            to="https://www.figma.com/file/WbVNWP2v4SKxuPvdTDUXCkD3/Assets?node-id=362%3A251"
          >
            <Heading size={24}>Icons</Heading>
            <img
              class="max-w-full border-radius-default"
              src={static_path(@socket, "/images/tutorials/invision_moon_icons.png")}
            />
          </Link>
          <Link
            class="w-10/12 overflow-hidden carousel-item"
            to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Components?node-id=15965%3A14977"
          >
            <Heading size={24}>Components</Heading>
            <img
              class="max-w-full border-radius-default"
              src={static_path(@socket, "/images/tutorials/invision_moon_dropdown.png")}
            />
          </Link>
        </Carousel>

        <Heading size={32}>Component libary implementations</Heading>

        <Carousel class="mt-4 mb-8">
          <Link
            class="w-10/12 overflow-hidden carousel-item mr-4 bg-goku"
            to="https://moon-surface.coingaming.io/sportsbet-dark/assets/icons"
          >
            <Heading size={24}>Elixir (Phoenix & Surface)</Heading>
            <img
              class="max-w-full border-radius-default"
              src={static_path(@socket, "/images/tutorials/moon_surface_icons.png")}
            />
          </Link>
          <Link class="w-10/12 overflow-hidden carousel-item" to="https://moon.io/assets/icons">
            <Heading size={24}>Typescript (React)</Heading>
            <img
              class="max-w-full border-radius-default"
              src={static_path(@socket, "/images/tutorials/moon_react_icons.png")}
            />
          </Link>
        </Carousel>
      </TopToDown>
    </Page>
    """
  end
end
