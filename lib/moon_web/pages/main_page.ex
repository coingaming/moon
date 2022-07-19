defmodule MoonWeb.Pages.MainPage do
  @moduledoc false

  use MoonWeb, :live_view
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Facing.ForDesigners
  alias MoonWeb.Components.Facing.ForDevelopers
  alias MoonWeb.Components.Facing.Updates
  alias MoonWeb.Components.Facing.Future
  alias MoonWeb.Components.Facing.Contributors
  alias MoonWeb.Components.Facing.MoonEarth
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
      <div class="relative z-5 flex flex-col gap-12">
        <div class="self-start"><Label size="twoxsmall">Open Source</Label></div>
        <div class="flex flex-col gap-16">
          <div class="relative z-50 flex flex-col items-start gap-6">
            <h1 class="text-moon-64 font-semibold">Moon design system.</h1>
            <p class="text-moon-24 max-w-screen-sm">
              Moon is Yolo Group product design system that helps us maintain the
              integrity of their user experience and optimize design and development
              resources.
            </p>
          </div>
          <div class="flex flex-col lg:flex-row gap-4 3xl:fixed 3xl:top-12 3xl:right-12 z-50">
            <ForDevelopers />
            <ForDesigners />
          </div>
          <Updates />
          <Future />
          <Contributors />
        </div>
      </div>
      <MoonEarth />
    </Page>
    """
  end
end
