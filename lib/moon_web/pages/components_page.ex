defmodule MoonWeb.Pages.ComponentsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponetsPage.ComponentsPageSection
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <h1 class="relative z-10  max-w-2xl text-moon-48 md:text-moon-72 font-medium text-bulma">
        Beautiful UI components, crafted with Tailwind CSS
      </h1>
      <div class="relative z-10 flex flex-col gap-6 max-w-2xl">
        <p class="text-moon-18 text-bulma">
          Components are one of the key building blocks of the design system.
          Their systematic reuse helps to create visual and functional consistency
          across products.
        </p>
      </div>
      <ComponentsPageSection title="Components">
      </ComponentsPageSection>
    </Page>
    """
  end
end
