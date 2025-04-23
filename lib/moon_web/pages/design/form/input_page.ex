defmodule MoonWeb.Pages.Design.Form.InputPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Examples.Design.Form.InputExample
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
        to: "/components/v2/form/input",
        name: "Input"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Input" is_rtl_support image="facing/components/input.png">
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
        InputExample.Default,
        InputExample.States,
        InputExample.Sizes,
        InputExample.Types,
        InputExample.WithLabel,
        InputExample.WithHorizontalLabel,
        InputExample.WithHint
      ]} />
      <PropsTable module={Moon.Design.Form} />
      <PropsTable module={Moon.Design.Form.Input} />
      <PropsTable module={Moon.Design.Form.Field} />
    </Page>
    """
  end
end
