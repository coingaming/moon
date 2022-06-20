defmodule MoonWeb.Pages.MainPage do
  @moduledoc false

  use MoonWeb, :live_view
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Facing.FacingReel
  alias MoonWeb.Components.Facing.CardArticle
  alias MoonWeb.Components.Facing.SectionTitle
  alias MoonWeb.Components.Facing.ForDesigners
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

        <div class="flex flex-col lg:flex-row gap-4 3xl:fixed 3xl:top-12 3xl:right-12 3xl:z-50">
          <ForDesigners />
        </div>

        <!-- UPDATES -->
        <div class="flex flex-col gap-12">
          <SectionTitle title="Updates." description="Explore our community features." />
          <FacingReel>
            <CardArticle
              variant="wide"
              href="https://moonds.medium.com/introduction-to-the-world-of-dialogs-and-notifications-ad74d55fff0d"
            >
              <:title>Introduction to the world of dialogs and notifications.</:title>
              <:section>blog</:section>
              <:author>Natalja Saks</:author>
            </CardArticle>
            <CardArticle
              variant="tall"
              href="https://moonds.medium.com/10-guidelines-to-efficiently-display-data-tables-76c8f71af3c3"
            >
              <:title>10 Guidelines to efficiently display data tables.</:title>
              <:section>blog</:section>
              <:author>Ksenia Pavlov</:author>
            </CardArticle>
            <CardArticle href="https://moonds.medium.com/ux-aspect-of-design-system-d51bffd3734c">
              <:title>UX aspect of design system.</:title>
              <:section>blog</:section>
              <:author>Dmytro Nikolaienko</:author>
            </CardArticle>
            <CardArticle variant="wide" href="/gettingStarted">
              <:title>Learn how to get Moon Design System up and running in your project.</:title>
              <:section>tools</:section>
            </CardArticle>
            <CardArticle variant="tall" href="/colours">
              <:title>Customizing color palette for your project.</:title>
              <:section>tools</:section>
            </CardArticle>
          </FacingReel>
        </div>

      </TopToDown>
    </Page>
    """
  end
end
