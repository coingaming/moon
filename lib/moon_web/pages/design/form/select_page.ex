defmodule MoonWeb.Pages.Design.Form.SelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Examples.Form.SelectExample

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
        to: "/components/v2/form/select",
        name: "Select"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Select" is_in_progress is_rtl_support is_aria_support>
        A browser-controlled menu of options for forms, navigation and more.
      </ComponentPageDescription>

      <ExamplesList examples={[
        SelectExample.Default,
        SelectExample.Sizes,
        SelectExample.WithLabel,
        SelectExample.Disabled,
        SelectExample.WithHint
      ]} />

      <PropsTable
        title="Select props"
        data={[
          %{
            :name => 'field',
            :type => 'atom',
            :required => 'Yes',
            :default => '-',
            :description => 'Field name for underlying surface select component'
          },
          %{
            :name => 'options',
            :type => 'list',
            :required => 'No',
            :default => '[]',
            :description => 'List of items to  be shown, %{:key, :value, :disabled}'
          },
          %{
            :name => 'value',
            :type => 'any',
            :required => 'No',
            :default => '[]',
            :description => 'Selected value'
          },
          %{
            :name => 'disabled',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the component is disabled'
          },
          %{
            :name => 'size',
            :type => 'sm | md | lg',
            :required => '-',
            :default => 'md',
            :description => 'Size of input'
          }
        ]}
      />
    </Page>
    """
  end
end
