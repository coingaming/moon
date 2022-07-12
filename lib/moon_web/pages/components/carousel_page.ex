defmodule MoonWeb.Pages.Components.CarouselPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Carousel
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/carousel",
        name: "Carousel"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'space',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO'
      },
      %{
        :name => 'items',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Items to display inside carousel'
      },
      %{
        :name => 'scroll_to_left_button',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Scroll to left button'
      },
      %{
        :name => 'scroll_to_right_button',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Scroll to right button'
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
      <ComponentPageDescription title="Carousel">
        <p>
          An interactive extension of the Reel component to cycle through content.
        </p>
      </ComponentPageDescription>

      <Context put={theme_class: @theme_name}>
        <ExampleAndCode title="Default" id="carousel_1">
          <:example>
            <Carousel>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
              <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
            </Carousel>
          </:example>

          <:code>{carousel_1_code()}</:code>
        </ExampleAndCode>
      </Context>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def carousel_1_code do
    """
      <Carousel>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-gohan-100 p-72 mr-5 scroll-snap-align-start">Item</div>
      </Carousel>
    """
  end
end
