defmodule MoonWeb.Pages.MainPage do
  @moduledoc false

  use MoonWeb, :live_view
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Facing.FacingReel
  alias MoonWeb.Components.Facing.CardArticle
  alias MoonWeb.Components.Facing.SectionTitle
  alias MoonWeb.Components.Facing.ForDesigners
  alias MoonWeb.Components.Facing.ForDevelopers
  alias MoonWeb.Components.Facing.Updates
  alias MoonWeb.Components.Facing.Future
  alias MoonWeb.Components.Facing.Contributors
  alias MoonWeb.Components.Facing.MoonEarth
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Label

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page}>
      <TopToDown class="relative" gap="gap-16">
        <div class="w-fit"><Label size="twoxsmall">Open Source</Label></div>
        <div class="relative z-40 flex flex-col items-start gap-6">
          <h1 class="text-moon-64 font-medium mt-10">Moon design system.</h1>
          <p class="text-moon-24 max-w-screen-sm">
            Moon is Yolo Group product design system that helps us maintain the
            integrity of their user experience and optimize design and development
            resources.
          </p>
        </div>

        <div class="flex flex-col lg:flex-row gap-4 3xl:fixed 3xl:top-12 3xl:right-12 z-50">
          <ForDesigners />
          <ForDevelopers />
        </div>

        <Updates />

        <Future />
        <Contributors />
      </TopToDown>
      <MoonEarth />
    </Page>
    """
  end
end
