defmodule MoonWeb.Pages.Design.Form.InsetInputPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.Form.InsetInputExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "#",
        name: "Form"
      },
      %{
        to: "/components/v2/form/inset_input",
        name: "InsetInput"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="InsetInput" image="facing/components/inset_input.png">
        <p>
          Text input fields allow users to enter text and can be used
          to collect user feedback or enter information in data entry forms.
        </p>
        <p>
          These types of input fields are used on their own, or in combination
          with other inputs such as number entry, date picker, etc.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        InsetInputExample.Default,
        InsetInputExample.States,
        InsetInputExample.CustomStyles,
        InsetInputExample.Types
      ]} />

      <PropsTable module={Moon.Design.Form.Input} />
      <PropsTable module={Moon.Design.Form.InsetField} />
    </Page>
    """
  end
end
