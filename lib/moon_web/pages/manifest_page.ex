defmodule MoonWeb.Pages.ManifestPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Logos.LogoMoonDesign
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ManifestCard

  data breadcrumbs, :any,
    default: [
      %{
        to: "/manifest",
        name: "Manifest"
      }
    ]

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: "moon-design-dark",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <div class="relative">
        <div class="absolute z-10 left-0 top-0 text-bulma-100">
          <LogoMoonDesign height="1.5rem" width="6.5rem" />
        </div>
        <div class="relative z-10 max-w-md">
          <img src="/moon/assets/images/facing/manifest_signature.svg" alt="">
        </div>
      </div>
      <div class="relative z-10 grow flex flex-row items-center gap-12">
        <div class="hidden md:block">
          <h2 class="text-moon-72 font-semibold text-bulma-100">Why?</h2>
        </div>
        <div class="grid 2xl:grid-cols-3 xl:grid-cols-2 gap-6 relative">
          <div class="flex flex-col justify-start gap-6">
            <ManifestCard
              title="Consistent among different brands"
              content_items={[
                'Same interaction and UI among different modules and sections (e.g. Cashier, Sidebar, Reg, Inputs etc)',
                'Theming'
              ]}
              is_highlighted
            />
            <ManifestCard
              title="Validating ideas/hypothesis for stakeholders"
              content_items={[
                'You can build your own UI app (Rapid Proto) faster and not from scratch',
                'Benefit for hackathons',
                'Quality'
              ]}
            />
          </div>
          <div class="flex flex-col justify-start gap-6">
            <ManifestCard
              title="Reducing development costs"
              content_items={[
                "Devs from different teams don't need to implement the elements provided by Moon DS",
                'There will be less time spent on discussions/alignment between devs and design',
                "Designers don't need to create new elements for every project/task",
                'Well document components library',
                'Avoiding mistakes and bugs'
              ]}
            />
            <ManifestCard
              title="Performance"
              content_items={[
                'Best practices across different brands',
                'Lightweight (Less code = more performance)'
              ]}
            />
          </div>
          <div class="flex flex-col justify-start">
            <ManifestCard
              title="Faster UI development"
              content_items={[
                'One place for all UI components (Source of truth)',
                'Consistent icons',
                'Non-frontend developers could build nice UI with using Moon DS'
              ]}
            />
          </div>
        </div>
      </div>
      <div class="fixed top-0 right-0 w-[650px] 2xl:w-[892px] translate-x-1/3 -translate-y-1/3">
        <img src="/moon/assets/images/facing/moon.webp" alt="Moon">
      </div>
    </Page>
    """
  end
end
