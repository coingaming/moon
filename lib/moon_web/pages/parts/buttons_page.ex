defmodule MoonWeb.Pages.Parts.ButtonsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Examples.Parts.ButtonExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/#",
        name: "Templates"
      },
      %{
        to: "/templates/button-examples",
        name: "Buttons"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction} hide_left_menu>
      <ComponentPageDescription title="Button examples" />

      <ExamplesList examples={[
        ButtonExample.Default
      ]} />
    </Page>
    """
  end
end
