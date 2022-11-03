defmodule MoonWeb.Pages.Components.Dialog.ContentPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/dialog/content",
        name: "Dialog Content"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Dialog Content">
        <p>
          Coming soon...
        </p>
      </ComponentPageDescription>
    </Page>
    """
  end
end
