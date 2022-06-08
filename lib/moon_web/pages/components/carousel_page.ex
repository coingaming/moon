defmodule MoonWeb.Pages.Components.CarouselPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Carousel
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

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
      <TopToDown>
        <Heading size={56} class="mb-4">Carousel</Heading>

        <p>
          An interactive extension of the Reel component to cycle through content.
        </p>

        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=12083%3A426">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/carousel_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/accordion">React implementation</Link>
        </p>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode id="carousel_1">
            <:example>
              <div>
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
              </div>
            </:example>

            <:code>{carousel_1_code()}</:code>
          </ExampleAndCode>
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={@props_info_array}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type" :let={item: item}>
              {item.type}
            </Column>
            <Column name="required" label="Required" :let={item: item}>
              {item.required}
            </Column>
            <Column name="default" label="Default" :let={item: item}>
              {item.default}
            </Column>
            <Column name="description" label="Description" :let={item: item}>
              {item.description}
            </Column>
          </Table>
        </div>
      </TopToDown>
    </Page>
    """
  end

  defp carousel_1_code do
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
