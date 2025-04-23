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
        to: "/components",
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
        ProgressExample.CustomColours,
        ProgressExample.ProgressWithPin
      ]} />

      <PropsTable module={Moon.Design.Progress} />
      <PropsTable module={Moon.Design.Progress.Pin} />
    </Page>
    """
  end
end
