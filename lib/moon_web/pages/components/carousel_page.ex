defmodule MoonWeb.Pages.Components.CarouselPage do
  use MoonWeb, :live_view
  alias Moon.Components.Carousel
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.Breadcrumbs

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

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={32}>Carousel</Heading>

      <p>
        An interactive extension of the Reel component to cycle through content.
      </p>

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

      <Heading size={16}>Source</Heading>
      <#CodePreview>
    <Carousel>
      <div class="item">Item</div>
      <div class="item">Item</div>
      <div class="item">Item</div>
      <div class="item">Item</div>
      <div class="item">Item</div>
      <div class="item">Item</div>
      <div class="item">Item</div>
      <div class="item">Item</div>
      <div class="item">Item</div>
    </Carousel>
    </#CodePreview>
    </TopToDown>
    """
  end
end
