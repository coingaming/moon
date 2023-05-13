defmodule MoonWeb.Pages.Design.BottomSheetPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.BottomSheetExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/bottomsheet",
        name: "BottomSheet"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        title="BottomSheet"
        image="facing/components/bottom_sheet.png"
      >
        <p>The bottom sheet component is a modified dialog that slides from the bottom of the screen, common pattern in mobile apps.</p>
        <p>Bottom sheets can contain any anything so let your imagination fly.</p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        BottomSheetExample.Default,
        BottomSheetExample.LargeWithAllOptionalExtras,
        BottomSheetExample.CustomHeight,
        BottomSheetExample.Responsive
      ]} />

      <PropsTable title="Bottomsheet props" module={Moon.Design.BottomSheet} />
      <PropsTable title="Bottomsheet.Panel props" module={Moon.Design.BottomSheet.Panel} />
      <PropsTable title="Bottomsheet.Header props" module={Moon.Design.BottomSheet.Header} />
      <PropsTable title="Bottomsheet.DragHandle props" module={Moon.Design.BottomSheet.DragHandle} />
      <PropsTable title="Bottomsheet.Backdrop props" module={Moon.Design.BottomSheet.Backdrop} />
    </Page>
    """
  end

  def component_anatomy do
    """
    <BottomSheet>
      <BottomSheet.Backdrop />
      <BottomSheet.Panel>
        <BottomSheet.Header>
          <BottomSheet.Draghandle />
        </BottomSheet.Header>
      </BottomSheet.Panel>
    </BottomSheet>
    """
  end
end
