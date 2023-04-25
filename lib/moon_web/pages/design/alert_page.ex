defmodule MoonWeb.Pages.Design.AlertPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.AlertExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/v2/alert",
        name: "Alert"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        is_aria_support
        is_rtl_support
        title="Alert"
        image="facing/components/alert.png"
      >
        <p>
          A way of informing the user of important changes in a prominent way.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        AlertExample.Default,
        AlertExample.WithTitle,
        AlertExample.WithIcon,
        AlertExample.WithClose,
        AlertExample.WithIconAndClose,
        AlertExample.HandleClose,
        AlertExample.Customization
      ]} />

      <PropsTable
        title="Alert props"
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
        title="Alert.Title props"
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
        title="Alert.Message props"
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
        title="Alert.Close props"
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
    <Alert>
      <Alert.Title>...</Alert.Title>
      <Alert.Message>...</Alert.Message>
      <Alert.Close />
    </Alert>
    """
  end
end
