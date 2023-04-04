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
        <p>
          The bottom sheet component is a modified dialog that slides from the bottom of the screen, common pattern in mobile apps.</p>

        <p>Bottom sheets can contain any anything so let your imagination fly.
        </p>
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
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          },
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Defult content of Alert item'
          },
          %{
            :name => 'title',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Title of Alert item, see Alert.Title'
          },
          %{
            :name => 'message',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Message of Alert item, see Alert.Message'
          },
          %{
            :name => 'close',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Close button slot of Alert item, see Alert.Close'
          }
        ]}
      />

      <PropsTable
        title="BottomSheet.Draghandle props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Title of Alert item'
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
        title="BottomSheet.Title props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Message of Alert item'
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
        title="BottomSheet.Panel props"
        data={[
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          },
          %{
            :name => 'on_click',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Event to happen when close button is clicked'
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
          },
          %{
            :name => 'on_click',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Event to happen when close button is clicked'
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
        <BottomSheet.Draghandle>
          <BottomSheet.Title>...</BottomSheet.Title>
        </BottomSheet.Draghandle>
      </BottomSheet.Panel>
    </BottomSheet>
    """
  end
end
