defmodule MoonWeb.Pages.Components.Progress.CircularPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/progress/loader",
        name: "Circular"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       direction: params["direction"] || "ltr",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Circular Progress">
        <p>
          Coming soon...
        </p>
      </ComponentPageDescription>
    </Page>
    """
  end
end
