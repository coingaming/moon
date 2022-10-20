defmodule MoonWeb.Pages.Components.Dialog.HeaderPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/dialog/header",
        name: "Dialog Header"
      }
    ]

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Dialog Header">
        <p>
          Coming soon...
        </p>
      </ComponentPageDescription>
    </Page>
    """
  end
end
