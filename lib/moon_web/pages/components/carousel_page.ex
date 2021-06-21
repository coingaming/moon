defmodule MoonWeb.Pages.Components.CarouselPage do
  use MoonWeb, :live_view
  alias Moon.Components.Carousel
  alias Moon.Components.CodePreview

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <h1>Carousel</h1>

    <p>
      An interactive extension of the Reel component to cycle through content.
    </p>

    <div>
      <style>
        .item {
          display: inline-block;
          background-color: var(--color--gohan-100);
          padding: 300px;
          margin-right: 20px;
          scroll-snap-align: start;
        }
      </style>
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
    </div>

    <#CodePreview>
    </#CodePreview>
    """
  end
end
