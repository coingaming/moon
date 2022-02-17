defmodule MoonWeb.Pages.Components.DateTimePickerPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.DateTimePicker
  alias Moon.Components.Heading
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/avatar",
        name: "Avatar"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Test Page</Heading>
        <DateTimePicker id="datetimepicker" />
        <DateTimePicker id="datetimepicker2" is_sidebar={false} />
        <DateTimePicker id="datetimepicker3" is_range={false} is_two_panels={false} />

      </TopToDown>
    </Page>
    """
  end
end
