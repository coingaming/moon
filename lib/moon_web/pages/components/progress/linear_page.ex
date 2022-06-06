defmodule MoonWeb.Pages.Components.Progress.LinearPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.ProgressLinear
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

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
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Linear Progress</Heading>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode title="Progress Linear" id="progress_linear">
            <:example>
              <ProgressLinear value={30} />
            </:example>

            <:code>{example_code()}</:code>
          </ExampleAndCode>
        </Context>
      </TopToDown>
    </Page>
    """
  end

  def example_code do
    """
    <Progress value={30} />
    """
  end
end
