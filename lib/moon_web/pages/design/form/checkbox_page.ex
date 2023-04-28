defmodule MoonWeb.Pages.Design.Form.CheckboxPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Examples.Design.Form.CheckboxExample
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

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
        to: "/components/v2/form/checkbox",
        name: "Checkbox"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Checkbox"
        is_aria_support
        is_rtl_support
        image="facing/components/checkbox.png"
      >
        <p>The checkbox is shown as a square box that is ticked (checked) when activated.</p>
        <p>Checkboxes are used to let a user select one or more options of a limited number of choices.</p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        CheckboxExample.Default,
        CheckboxExample.WithForm,
        CheckboxExample.Disabled,
        CheckboxExample.Readonly,
        CheckboxExample.Customizations
      ]} />
      <PropsTable module={Moon.Design.Form.Checkbox} />
      <PropsTable module={Moon.Lego.Checkbox} />
    </Page>
    """
  end
end
