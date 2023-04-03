defmodule MoonWeb.Pages.Design.Form.CheckboxPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Examples.Form.CheckboxExample
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
        to: "/components/v2/form/checkbox",
        name: "Checkbox"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Checkbox" is_in_progress image="facing/components/input.png">
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
      <PropsTable
        title="Checkbox props"
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
