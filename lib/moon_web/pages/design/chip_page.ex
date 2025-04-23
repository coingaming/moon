defmodule MoonWeb.Pages.Design.ChipPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.ChipExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/chip",
        name: "Chip"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_rtl_support title="Chip" image="facing/components/chip.png">
        <p>
          Chips help filter content, or trigger actions.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        ChipExample.Default,
        ChipExample.Sizes,
        ChipExample.Variants,
        ChipExample.Active,
        ChipExample.Disabled,
        ChipExample.WithIcons,
        ChipExample.IsStroke,
        ChipExample.IsStrokeWithIcons,
        ChipExample.WithOnClick
      ]} />

      <PropsTable module={Moon.Design.Chip} />
    </Page>
    """
  end
end
