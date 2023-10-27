defmodule MoonWeb.Pages.Parts.ModalsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Examples.Parts.ModalExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/#",
        name: "Templates"
      },
      %{
        to: "/templates/modal-examples",
        name: "Modals"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction} hide_left_menu>
      <ComponentPageDescription title="Modal examples" />

      <ExamplesList examples={[
        ModalExample.ModalWizard
      ]} />
    </Page>
    """
  end
end
