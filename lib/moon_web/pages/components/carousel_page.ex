defmodule MoonWeb.Pages.Components.CarouselPage do
  use MoonWeb, :live_view
  alias Moon.Components.Carousel
  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.ThemesSelect

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

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={56} class="mb-4">Carousel</Heading>

      <p>
        An interactive extension of the Reel component to cycle through content.
      </p>

      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=12083%3A426">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/carousel_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/accordion">React implementation</Link>
      </p>

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

        <:code>
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
        </:code>
      </ExampleAndCode>
      <Footer />
      <ThemesSelect id="themes_select" theme_name={@theme_name} active_page={@active_page} />
    </TopToDown>
    """
  end
end
