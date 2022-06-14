defmodule MoonWeb.Pages.CountryFlagsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Helpers.CountryFlags
  alias Moon.CountryFlag
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "/country_flags",
        name: "CountryFlags"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Country Flags</Heading>

        <div class="p-6 bg-gohan-100 rounded">
          <div
            class="grid gap-4 overflow-hidden"
            style="grid-template-columns: repeat(auto-fill, minmax(10rem, 1fr));"
          >
            {#for country_flag_name <- CountryFlags.list_all()}
              <div class="w-40 h-28 flex flex-col items-center">
                <div class="flex grow justify-center items-center">
                  <CountryFlag name={country_flag_name} class="h-8 w-8" />
                </div>
                <h3 class="text-moon-12 mx-2 mb-2 text-trunks-100" title={country_flag_name}>{country_flag_name}</h3>
              </div>
            {/for}
          </div>
        </div>
      </TopToDown>
    </Page>
    """
  end
end
