defmodule MoonWeb.Pages.Components.TypographyPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Typography"
      },
      %{
        to: "/typography",
        name: "Typography"
      }
    ]

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Typography">
        <p>Typography includes text, headings, and captions.</p>
      </ComponentPageDescription>

      <ExampleAndCode id="text_1" title="Default">
        <:example>
          <div class="flex flex-col gap-2 w-full">
          </div>
        </:example>
      <:code>{get_example_1_code()}</:code>
      </ExampleAndCode>
    </Page>
    """
  end

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       direction: params["direction"] || "ltr",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def get_example_1_code() do
    """

    """
  end
end
