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
        to: "/components",
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

      <PropsTable module={Moon.Design.Alert} />
      <PropsTable module={Moon.Design.Alert.Title} />
      <PropsTable module={Moon.Design.Alert.Message} />
      <PropsTable module={Moon.Design.Alert.Close} />
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
