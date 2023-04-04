defmodule MoonWeb.Pages.Design.Form.RadioPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Examples.Form.RadioExample
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

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
        to: "/components/v2/form/radio",
        name: "Checkbox"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Radio"
        is_aria_support
        is_rtl_support
        image="facing/components/radio_button.png"
      >
        <p>Radio buttons are used to represent a group of choices whereby users can only select one option.</p>
        <p>
          The main difference between the radio button and the checkbox is, users are allowed to select single
          options whereas in the checkbox you can have multiple options.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        RadioExample.Default,
        RadioExample.ShortSyntax
      ]} />
      <PropsTable
        title="Radio props"
        data={[
          %{
            :name => 'field',
            :type => 'atom',
            :required => 'Yes',
            :default => '-',
            :description => 'Field name for underlying surface select component'
          },
          %{
            :name => 'id',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Id for the DOM element'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Additional classes for tag'
          },
          %{
            :name => 'selected_class',
            :type => 'css_class',
            :required => 'No',
            :default => 'bg-piccolo',
            :description => 'Additional classes for tag when selected'
          },
          %{
            :name => 'unselected_class',
            :type => 'css_class',
            :required => 'No',
            :default => 'shadow-truncs',
            :description => 'Additional classes for tag when unselected'
          },
          %{
            :name => 'testid',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Attr data-testid for the DOM element'
          },
          %{
            :name => 'disabled',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the component is disabled'
          },
          %{
            :name => 'readonly',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the component is read-only'
          }
        ]}
      />
    </Page>
    """
  end
end
