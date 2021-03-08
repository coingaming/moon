defmodule MoonWeb.Pages.Tutorials.Introduction do
  use MoonWeb, :live_view

  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Carousel

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <Heading size=32>Design team and design rules</Heading>

    <Carousel>
      <Link class="w-10/12 overflow-hidden carousel-item mr-4 bg-gohan-100" to="https://www.figma.com/file/WbVNWP2v4SKxuPvdTDUXCkD3/Assets?node-id=362%3A251">
        <Heading size=24>Icons</Heading>
        <img class="max-w-full border-radius-default" src={{ static_path(@socket, "/images/tutorials/invision_moon_icons.png") }} />
      </Link>
      <Link class="w-10/12 overflow-hidden carousel-item" to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Components?node-id=15965%3A14977">
        <Heading size=24>Components</Heading>
        <img class="max-w-full border-radius-default" src={{ static_path(@socket, "/images/tutorials/invision_moon_dropdown.png") }} />
      </Link>
    </Carousel>
    """
  end
end
