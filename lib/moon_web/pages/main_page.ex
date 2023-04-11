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

  alias Moon.Design.Tag
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@direction}>
      <div class="relative z-5 flex flex-col gap-12">
        <div class="self-start"><Tag size="2xs">Open Source</Tag></div>
        <div class="flex flex-col gap-16">
          <div class="relative z-30 flex flex-col items-start gap-6">
            <h1 class="text-moon-64 font-semibold">Moon design system.</h1>
            <p class="text-moon-24 max-w-screen-sm">
              Moon is Yolo Group product design system that helps us maintain the
              integrity of their user experience and optimize design and development
              resources.
            </p>
            <p class="flex items-center gap-2 text-moon-16 max-w-screen-sm font-semibold">
              <span>Try out Moon DS for
              </span>
              <a href="https://moon.io/" target="_blank" rel="noreferrer">
                <Button size="sm">React</Button>
              </a>
            </p>
          </div>
          <div class="flex flex-col lg:flex-row gap-4 3xl:fixed 3xl:top-12 ltr:3xl:right-12 rtl:3xl:left-12 z-30">
            <ForDevelopers {=@theme_name} {=@direction} />
            <ForDesigners {=@theme_name} {=@direction} />
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
