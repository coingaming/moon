defmodule MoonWeb.Pages.Design.Form.InputPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Examples.Form.InputExample
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

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
        to: "/components/v2/form/input",
        name: "Input"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Input"
        is_in_progress
        is_rtl_support
        image="facing/components/input.png"
      >
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
        # MoonWeb.Examples.Design.FormExample.Registration,
        InputExample.Default,
        InputExample.States,
        InputExample.Sizes,
        InputExample.Types,
        InputExample.WithLabel,
        InputExample.WithHint
      ]} />
      <PropsTable
        title="Input props"
        data={[
          %{
            :name => 'field',
            :type => 'atom',
            :required => 'Yes',
            :default => '-',
            :description => 'Field name for underlying surface select component'
          },
          %{
            :name => 'value',
            :type => 'any',
            :required => 'No',
            :default => '-',
            :description => 'Selected value'
          },
          %{
            :name => 'id',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Id for the DOM element'
          },
          %{
            :name => 'testid',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Attr data-testid for the DOM element'
          },
          %{
            :name => 'type',
            :type =>
              'date | datetime-local | email | number | password | search | tel | text | url | time | url',
            :required => 'No',
            :default => 'text',
            :description => 'Different types of input'
          },
          %{
            :name => 'size',
            :type => 'sm | md | lg',
            :required => '-',
            :default => 'md',
            :description => 'Size of input'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Additional classes for tag'
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
