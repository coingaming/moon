defmodule MoonWeb.Pages.Components.CaptionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Caption
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/caption",
        name: "Caption"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
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
        <Heading size={56} class="mb-4">Caption</Heading>

        <div>
          Component for presenting short info.
        </div>

        <ExampleAndCode title="Colors" id="example_1">
          <:example>
            <div class="flex justify-around w-full items-center">
              <Caption>Defaul color is Bulma</Caption>
              <Caption color_class="piccolo-100">Piccolo</Caption>
              <Caption color_class="trunks-100">Trunks</Caption>
              <Caption color_class="krillin-100">Krillin</Caption>
            </div>
          </:example>

          <:code>{example_1_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Text Align" id="example_2">
          <:example>
            <div class="flex justify-around w-full items-center">
              <Caption>Text-align is not specified</Caption>
              <Caption text_align_class="text-center">Centered text</Caption>
              <Caption text_align_class="text-right">Right alignment</Caption>
            </div>
          </:example>

          <:code>{example_2_code()}</:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def example_1_code do
    """
    <div class="flex justify-around w-full items-center">
      <Caption>Defaul color is Bulma</Caption>
      <Caption color_class="piccolo-100">Piccolo</Caption>
      <Caption color_class="trunks-100">Trunks</Caption>
      <Caption color_class="krillin-100">Krillin</Caption>
    </div>
    """
  end

  def example_2_code do
    """
    <div class="flex justify-around w-full items-center">
      <Caption>Text-align is not specified</Caption>
      <Caption text_align_class="text-center">Centered text</Caption>
      <Caption text_align_class="text-right">Right alignment</Caption>
    </div>
    """
  end
end
