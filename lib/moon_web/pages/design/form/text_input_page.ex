defmodule MoonWeb.Pages.Design.Form.TextInputPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Examples.Form.TextInputExample
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
        to: "/components/v2/form/text_input",
        name: "Text Input"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
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
        :type => 'medium | large | xlarge',
        :required => '-',
        :default => 'medium',
        :description => 'Size variant (currently only medium | large, with large as default)'
      },
      %{
        :name => 'label',
        :type => 'string',
        :required => 'Yes',
        :default => '-',
        :description => 'Required for medium size only'
      },
      %{
        :name => 'placeholder',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Placeholder for input'
      },
      %{
        :name => 'field',
        :type => 'atom',
        :required => 'Yes',
        :default => '-',
        :description => 'Field value for underlying pheonix text input component'
      },
      %{
        :name => 'hint_text',
        :type => 'slot',
        :required => 'No',
        :default => '-',
        :description => 'Informative or error message under input'
      },
      %{
        :name => 'error',
        :type => 'boolean',
        :required => 'No',
        :default => '-',
        :description => 'Set error state for input'
      },
      %{
        :name => 'show_password_text',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'Only for input type password. Text for toggle button: show/hide password'
      },
      %{
        :name => 'background_color',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Background color'
      },
      %{
        :name => 'id',
        :type => 'string',
        :required => 'No | required (for password type)',
        :default => '-',
        :description => 'Unique id'
      },
      %{
        :name => 'use_error_tag',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description =>
          'Whether to use ErrorTag in place of the Hint text to show error messages. Requires the component to be inside Form and Field components'
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Text Input" is_in_progress>
        <p>Text input fields allow users to enter text and can be used to collect user feedback or enter information in data entry forms.</p>
        <p>These types of input fields are used on their own, or in combination with other inputs such as number entry, date picker, etc.</p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        TextInputExample.Default,
        TextInputExample.Disabled,
        TextInputExample.Sizes,
        TextInputExample.Types,
        TextInputExample.WithLabel,
        TextInputExample.WithHint
      ]} />
      <PropsTable
        title="TextInput props"
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
            :name => 'test_id',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Attr data-test_id for the DOM element'
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
