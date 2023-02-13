defmodule MoonWeb.Pages.Design.SnackbarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.SnackbarExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/snackbar",
        name: "Snackbar"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress is_aria_support is_rtl_support title="Snackbar">
        <p>
          A type of alert which appears in a layer above other content, visually similar to a mobile or desktop push notification.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        SnackbarExample.Default,
        SnackbarExample.Positions,
        SnackbarExample.Options,
        SnackbarExample.SemanticTypes,
        SnackbarExample.AutoClose,
        SnackbarExample.Customization
      ]} />

      <PropsTable
        title="Snackbar props"
        data={[
          %{
            :name => 'trigger',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Clickable trigger element, see Snackbar.Trigger'
          },
          %{
            :name => 'content',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Content of Snackbar item, see Snackbar.Content'
          },
          %{
            :name => 'icon',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Icon slot of Snackbar item, see Snackbar.Icon'
          },
          %{
            :name => 'close',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Close button slot of Snackbar item, see Snackbar.Close'
          },
          %{
            :name => 'position',
            :type => 'top-left | top-center | top-right | bottom-left | bottom-center | bottom-right',
            :required => 'No',
            :default => 'top-right',
            :description => 'Close button slot of Snackbar item, see Snackbar.Close'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          },
          %{
            :name => 'is_open',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether or not the snackbar is open'
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Content props"
        data={[
          %{
            :name => 'header',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Header slot of Snackbar item, see Snackbar.Header'
          },
          %{
            :name => 'message',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Message slot of Snackbar item, see Snackbar.Message'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Header props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Header of Snackbar item'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Message props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Message of Snackbar item'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Icon props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Icon slot of Snackbar item'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />
    </Page>
    """
  end
end
