defmodule MoonWeb.Pages.Design.SnackbarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.SnackbarExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
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
      <ComponentPageDescription
        is_aria_support
        is_rtl_support
        title="Snackbar"
        image="facing/components/snackbar.png"
      >
        <p>
          The snackbar component is a non-disruptive message that appears on the interface to provide quick, at-a-glance feedback on the outcome of an action.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

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
            :name => ~c"trigger",
            :type => ~c"slot",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Clickable trigger element, see Snackbar.Trigger"
          },
          %{
            :name => ~c"content",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Content of Snackbar item, see Snackbar.Content"
          },
          %{
            :name => ~c"icon",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Icon slot of Snackbar item, see Snackbar.Icon"
          },
          %{
            :name => ~c"close",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Close button slot of Snackbar item, see Snackbar.Close"
          },
          %{
            :name => ~c"position",
            :type => ~c"top-left | top-center | top-right | bottom-left | bottom-center | bottom-right",
            :required => ~c"No",
            :default => ~c"top-right",
            :description => ~c"Close button slot of Snackbar item, see Snackbar.Close"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for custom styles"
          },
          %{
            :name => ~c"is_open",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"false",
            :description => ~c"Whether or not the snackbar is open"
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Content props"
        data={[
          %{
            :name => ~c"header",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Header slot of Snackbar item, see Snackbar.Header"
          },
          %{
            :name => ~c"message",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Message slot of Snackbar item, see Snackbar.Message"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for custom styles"
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Header props"
        data={[
          %{
            :name => ~c"default",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Header of Snackbar item"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for custom styles"
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Message props"
        data={[
          %{
            :name => ~c"default",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Message of Snackbar item"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for custom styles"
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Icon props"
        data={[
          %{
            :name => ~c"default",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Icon slot of Snackbar item"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for custom styles"
          }
        ]}
      />
    </Page>
    """
  end

  def component_anatomy do
    """
    <Snackbar>
      <Snackbar.Trigger>...</Snackbar.Trigger>
      <Snackbar.Icon>...</Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Header>...</Snackbar.Header>
        <Snackbar.Message>...</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>
    """
  end
end
