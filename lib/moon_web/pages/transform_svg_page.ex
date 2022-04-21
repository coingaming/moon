defmodule MoonWeb.Pages.TransformSvgPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Carousel
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "/transform-svg",
        name: "Transform SVG"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={32}>Transform SVG</Heading>
      </TopToDown>
      Coming soon
    </Page>
    """
  end
end
