defmodule MoonWeb.Pages.Design.ModalPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/modal",
        name: "Modal"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
    <ComponentPageDescription is_in_progress title="Modal">
        <p>
        A modal is an interface element that appears over other content. It requires an interaction from the user before they can return to whatever is underneath.
        </p>
      </ComponentPageDescription>
    </Page>
    """
  end
end
