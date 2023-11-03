defmodule MoonWeb.Pages.ManifestPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.LargeLogo
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ManifestCard
  alias MoonWeb.Components.Facing.SameDifferentSignature

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/manifest",
        name: "Manifest"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <div class="relative text-bulma">
        <div class="absolute z-10 ltr:left-0 rtl:right-0 top-0">
          <LargeLogo class="h-6 w-[6.5rem]" />
        </div>
        <div class="relative z-10 max-w-md">
          <SameDifferentSignature />
        </div>
      </div>
      <div class="relative z-10 grow flex flex-col xl:flex-row gap-12">
        <h2 class="xl:self-end text-moon-72 font-medium text-bulma">Why?</h2>
        <div class="grid 2xl:grid-cols-3 xl:grid-cols-2 gap-6 relative">
          <div class="flex flex-col justify-start gap-6">
            <ManifestCard
              title="Consistent among different brands"
              content_items={[
                ~c"Same interaction and UI among different modules and sections (e.g. Cashier, Sidebar, Reg, Inputs etc)",
                ~c"Theming"
              ]}
              is_highlighted
            />
            <ManifestCard
              title="Validating ideas/hypotheses for stakeholders"
              content_items={[
                ~c"You can build your own UI app (Rapid Proto) faster and not from scratch",
                ~c"Benefit for hackathons",
                ~c"Quality"
              ]}
            />
          </div>
          <div class="flex flex-col justify-start gap-6">
            <ManifestCard
              title="Reducing development costs"
              content_items={[
                "Devs from different teams don't need to implement the elements provided by Moon DS",
                ~c"There will be less time spent on discussions/alignment between devs and design",
                "Designers don't need to create new elements for every project/task",
                ~c"Well-documented components library",
                ~c"Avoiding mistakes and bugs"
              ]}
            />
            <ManifestCard
              title="Performance"
              content_items={[
                ~c"Best practices across different brands",
                ~c"Lightweight (Less code = more performance)"
              ]}
            />
          </div>
          <div class="flex flex-col justify-start">
            <ManifestCard
              title="Faster UI development"
              content_items={[
                ~c"One place for all UI components (Source of truth)",
                ~c"Consistent icons",
                ~c"Non-frontend developers could build nice UI using Moon DS"
              ]}
            />
          </div>
        </div>
      </div>
      <img
        class="hidden xl:block fixed -top-56 -end-56 w-[650px] 2xl:-top-72 2xl:-end-72 2xl:w-[892px]"
        src="/moon/assets/images/facing/moon.webp"
        alt="Moon"
      />
    </Page>
    """
  end
end
