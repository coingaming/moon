defmodule MoonWeb.Pages.Design.Form.SelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Examples.Design.Form.SelectExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "#",
        name: "Form"
      },
      %{
        to: "/components/v2/form/select",
        name: "Select"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Select"
        is_in_progress
        is_rtl_support
        is_aria_support
        image="facing/components/select.png"
      >
        <p>
          A form input used for selecting a value: when collapsed it shows the currently selected option and when expanded,
          it shows a scrollable list of predefined options for the user to choose from. Options are not styled here. For list with styled
          options please use Dropdown component.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        SelectExample.Default,
        SelectExample.Sizes,
        SelectExample.WithLabel,
        SelectExample.DisabledAndError,
        SelectExample.WithHint,
        SelectExample.MultipleChoices
      ]} />

      <PropsTable title="Select props" module={Moon.Design.Form.Select} />
    </Page>
    """
  end
end
