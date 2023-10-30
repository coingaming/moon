defmodule MoonWeb.Pages.Design.Form.TextAreaPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.Form.TextAreaExample

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
        to: "/components/v2/form/textarea",
        name: "TextArea"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="TextArea" image="facing/components/textarea.png">
        <p>
          A form control for editing multi-line text.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        TextAreaExample.Default,
        TextAreaExample.DisabledAndErrorr,
        TextAreaExample.Colours
      ]} />

      <PropsTable
        title="TextArea props"
        data={[
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Additional classes for textarea tag"
          },
          %{
            :name => ~c"attrs",
            :type => ~c"map",
            :required => ~c"No",
            :default => ~c"%{}",
            :description => ~c"Additional attributes for textarea tag"
          },
          %{
            :name => ~c"disabled",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"false",
            :description => ~c"Disabling textarea"
          },
          %{
            :name => ~c"placeholder",
            :type => ~c"string",
            :required => ~c"No",
            :default => ~c"",
            :description => ~c"Placeholder for the textarea"
          }
        ]}
      />
    </Page>
    """
  end
end
