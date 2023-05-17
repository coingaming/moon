defmodule MoonWeb.Pages.Design.CarouselPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.CarouselExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/carousel",
        name: "Carousel"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress title="Carousel" image="facing/components/carousel.png">
        <p>Carousel is an effective way of displaying multiple images or content in a single space.</p>
        <p>It not only helps in saving screen space, but also encourages visitors to focus on important website content and improves the overall visual appeal effectively.</p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        CarouselExample.Default,
        CarouselExample.CustomizedArrows,
        CarouselExample.Indicators,
        CarouselExample.Spaces,
        CarouselExample.SelectIndex,
        CarouselExample.Autoslide
      ]} />

      <PropsTable title="Carousel props" module={Moon.Design.Carousel} />
      <PropsTable title="Carousel.Reel props" module={Moon.Design.Carousel.Reel} />
      <PropsTable title="Carousel.Item props" module={Moon.Design.Carousel.Item} />
      <PropsTable title="Carousel.Indicator props" module={Moon.Design.Carousel.Indicator} />
      <PropsTable title="Carousel.LeftArrow props" module={Moon.Design.Carousel.LeftArrow} />
      <PropsTable title="Carousel.RightArrow props" module={Moon.Design.Carousel.RightArrow} />
    </Page>
    """
  end

  defp component_anatomy do
    """
    <Carousel>
      <Carousel.LeftArrow>...</Carousel.LeftArrow>
      <Carousel.Reel>
        <Carousel.Item>...</Carousel.Item>
        <Carousel.Indicators />
      <Carousel.Reel>
      </Carousel.RightArrow>...</Carousel.RightArrow>
    </Carousel>
    """
  end
end
