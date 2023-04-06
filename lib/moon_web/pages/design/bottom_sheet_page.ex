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
        to: "#",
        name: "Components v2"
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
        BottomSheetExample.CustomHeight
      ]} />

      <PropsTable
        title="BottomSheet props"
        data={[
          %{
            :name => 'is_open',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the BottomSheet is open or not.'
          },
          %{
            :name => 'on_close',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Called when the BottomSheet is dismissed.'
          },
          %{
            :name => 'has_shadow',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the BottomSheet has a shadow or not.'
          },
          %{
            :name => 'size',
            :type => 'sm | md | lg',
            :required => 'No',
            :default => 'md',
            :description =>
              'The size of the BottomSheet, sm, md, lg or custom pixel/percentage/rem value.'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          },
          %{
            :name => 'panel',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Panel of BottomSheet, see BottomSheet.Panel'
          },
          %{
            :name => 'backdrop',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Backdrop of BottomSheet, see BottomSheet.Backdrop'
          }
        ]}
      />

      <PropsTable
        title="BottomSheet.Panel props"
        data={[
          %{
            :name => 'draghandle',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Draghandle of BottomSheet, see BottomSheet.Draghandle'
          },
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Content of BottomSheet'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          }
        ]}
      />

      <PropsTable
        title="BottomSheet.Draghandle props"
        data={[
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          }
        ]}
      />

      <PropsTable
        title="BottomSheet.Backdrop props"
        data={[
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          }
        ]}
      />
    </Page>
    """
  end

  def component_anatomy do
    """
    <BottomSheet>
      <BottomSheet.Backdrop />
      <BottomSheet.Panel>
        <BottomSheet.Draghandle />
      </BottomSheet.Panel>
    </BottomSheet>
    """
  end
end
