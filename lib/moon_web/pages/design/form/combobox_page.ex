defmodule MoonWeb.Pages.Design.Form.ComboboxPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.Form.ComboboxExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/form/combobox",
        name: "Combobox"
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
        title="Combobox"
        image="facing/components/dropdown.png"
      >
        <p>An input that behaves similarly to a dropdown, with the addition of a free text input to filter options.</p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        ComboboxExample.Default,
        ComboboxExample.Multiple
      ]} />

      <PropsTable module={Moon.Design.Form.Combobox} />
      <PropsTable module={Moon.Design.Dropdown.Input} />
    </Page>
    """
  end

  defp component_anatomy do
    """
    <Form>
      <Form.Field>
        <Form.Combobox options={...} />
      </Form.Field>
    </Form>
    """
  end
end
