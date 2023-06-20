defmodule MoonWeb.Pages.Design.Form.DropdownPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.Form.DropdownExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/form/dropdown",
        name: "Dropdown"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        is_rtl_support
        is_aria_support
        title="Dropdown"
        image="facing/components/dropdown.png"
      >
        <p>A form component - list of options to be selected. Acts pretty close to select.</p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        DropdownExample.Default,
        DropdownExample.States,
        DropdownExample.Multiple,
        DropdownExample.Custom
      ]} />

      <PropsTable module={Moon.Design.Form.Dropdown} />
      <PropsTable module={Moon.Design.Dropdown.Select} />
    </Page>
    """
  end

  defp component_anatomy do
    """
    <Form>
      <Form.Field>
        <Form.Dropdown options={...} />
      </Form.Field>
    </Form>
    """
  end
end
