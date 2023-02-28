defmodule MoonWeb.Pages.Design.CircularProgressPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.CircularProgressExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/circularprogress",
        name: "CircularProgress"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress is_aria_support is_rtl_support title="CircularProgress">
        <p>
          A circular progress indicator is a visual representation of a user's progress through a set of steps, guiding toward the completion of a specified process.</p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        CircularProgressExample.Default,
        CircularProgressExample.DifferentSizes,
        CircularProgressExample.DifferentValues,
        CircularProgressExample.CustomColours
      ]} />

      <PropsTable
        title="CircularProgress props"
        data={[
          %{
            :name => 'bg_color',
            :type => 'string',
            :required => 'No',
            :default => 'stroke-trunks/[.24]',
            :description => 'Background colour'
          },
          %{
            :name => 'progress_color',
            :type => 'string',
            :required => 'No',
            :default => 'stroke-piccolo',
            :description => 'Progress bar colour'
          },
          %{
            :name => 'size',
            :type => '2xs | xs | sm | md | lg',
            :required => 'No',
            :default => '2xs',
            :description => 'Size of Progress'
          },
          %{
            :name => 'value',
            :type => 'number',
            :required => 'No',
            :default => '0',
            :description => 'Value of Progress in %'
          }
        ]}
      />
    </Page>
    """
  end
end
