defmodule MoonWeb.Pages.Components.Progress.LinearPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.ProgressLinear
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/progress/linear",
        name: "Linear Progress"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Linear Progress">
        <p>
          Linear Progress
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Progress Linear" id="progress_linear">
        <:example>
          <ProgressLinear value={30} />
        </:example>

        <:code>{example_code()}</:code>
      </ExampleAndCode>
    </Page>
    """
  end

  def example_code do
    """
    <Progress value={30} />
    """
  end
end
