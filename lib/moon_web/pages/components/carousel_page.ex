defmodule MoonWeb.Pages.Components.CarouselPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Carousel
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/carousel",
        name: "Carousel"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"space",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO"
      },
      %{
        :name => ~c"items",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Items to display inside carousel"
      },
      %{
        :name => ~c"scroll_to_left_button",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Scroll to left button"
      },
      %{
        :name => ~c"scroll_to_right_button",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Scroll to right button"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Carousel">
        <p>
          An interactive extension of the Reel component to cycle through content.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="carousel_1">
        <:example>
          <Carousel>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
            <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
          </Carousel>
        </:example>

        <:code>{carousel_1_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def carousel_1_code do
    """
      <Carousel>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
        <div class="inline-block bg-goku p-72 mr-5 scroll-snap-align-start">Item</div>
      </Carousel>
    """
  end
end
