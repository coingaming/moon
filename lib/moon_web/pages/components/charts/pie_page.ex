defmodule MoonWeb.Pages.Components.Charts.PiePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/charts/pie",
        name: "Geo Map"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={32}>Geo Map</Heading>
      </TopToDown>
      Coming soon
    </Page>
    """
  end
end
