defmodule MoonWeb.Pages.Components.CountryFlagsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Helpers.CountryFlags
  alias Moon.CountryFlag
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PageSection

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/country_flags",
        name: "CountryFlags"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Country Flags">
        <p>
          Country Flags
        </p>
      </ComponentPageDescription>

      <PageSection>
        <div class="flex flex-wrap gap-8 items-start bg-gohan p-4 rounded-moon-s-sm">
          {#for country_flag_name <- CountryFlags.list_all()}
            <div class="flex flex-col gap-2 items-center">
              <CountryFlag name={country_flag_name} class="h-8 w-8" />
              <p class="text-moon-10-caption uppercase text-trunks" title={country_flag_name}>{country_flag_name}</p>
            </div>
          {/for}
        </div>
      </PageSection>
    </Page>
    """
  end
end
