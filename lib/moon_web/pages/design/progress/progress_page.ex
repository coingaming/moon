defmodule MoonWeb.Pages.Design.Progress.LinearProgressPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.ProgressExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/v2/progress",
        name: "Progress"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        is_aria_support
        is_rtl_support
        title="Progress"
        image="facing/components/linear_progress.png"
      >
        <p>
          A progress indicator (Circular and Linear) is a visual representation of a user's progress through a set of steps, guiding toward the completion of a specified process.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        ProgressExample.Default,
        ProgressExample.DifferentSizes,
        ProgressExample.DifferentValues,
        ProgressExample.CustomColours
      ]} />

      <PropsTable
        title="Progress props"
        data={[
          %{
            :name => 'bg_color',
            :type => 'string',
            :required => 'No',
            :default => 'bg-trunks/[.24]',
            :description => 'Background colour'
          },
          %{
            :name => 'progress_color',
            :type => 'string',
            :required => 'No',
            :default => 'bg-piccolo',
            :description => 'Progress bar colour'
          },
          %{
            :name => 'size',
            :type => '6xs | 5xs | 4xs | 3xs | 2xs',
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
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization of Progress'
          },
          %{
            :name => 'progress_class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization of progress indicator'
          }
        ]}
      />
    </Page>
    """
  end
end
