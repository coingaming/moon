defmodule MoonWeb.Pages.Design.Form.TextAreaPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Form.TextAreaExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
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
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Additional classes for textarea tag'
          },
          %{
            :name => 'attrs',
            :type => 'map',
            :required => 'No',
            :default => '%{}',
            :description => 'Additional attributes for textarea tag'
          },
          %{
            :name => 'disabled',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Disabling textarea'
          },
          %{
            :name => 'placeholder',
            :type => 'string',
            :required => 'No',
            :default => '',
            :description => 'Placeholder for the textarea'
          }
        ]}
      />
    </Page>
    """
  end
end
