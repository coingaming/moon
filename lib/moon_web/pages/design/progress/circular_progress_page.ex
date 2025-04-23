defmodule MoonWeb.Pages.Design.Progress.CircularProgressPage do
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
        to: "/components",
        name: "Components"
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
      <ComponentPageDescription
        is_aria_support
        is_rtl_support
        title="CircularProgress"
        image="facing/components/circular_progress.png"
      >
        <p>
          A progress indicator (Circular and Linear) is a visual representation of a user's progress through a set of steps, guiding toward the completion of a specified process.</p>
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
            :name => ~c"bg_color",
            :type => ~c"string",
            :required => ~c"No",
            :default => ~c"stroke-trunks/[.24]",
            :description => ~c"Background colour"
          },
          %{
            :name => ~c"progress_color",
            :type => ~c"string",
            :required => ~c"No",
            :default => ~c"stroke-piccolo",
            :description => ~c"Progress bar colour"
          },
          %{
            :name => ~c"size",
            :type => ~c"2xs | xs | sm | md | lg",
            :required => ~c"No",
            :default => ~c"md",
            :description => ~c"Size of Progress"
          },
          %{
            :name => ~c"value",
            :type => ~c"number",
            :required => ~c"No",
            :default => ~c"0",
            :description => ~c"Value of Progress in %"
          }
        ]}
      />
    </Page>
    """
  end
end
