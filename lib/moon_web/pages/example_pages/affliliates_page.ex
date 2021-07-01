defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage do
  use MoonWeb, :live_view

  alias Moon.Components.Heading

  alias MoonWeb.Pages.ExamplePages.Shared
  alias MoonWeb.MockDB.Affiliates
  alias Moon.Autolayouts.ButtonsList
  alias Moon.Autolayouts.TopToDown
  alias Shared.TopMenu
  alias Shared.LeftMenu
  alias Shared.Breadcrumbs
  alias __MODULE__.{AffiliatesList, UsernameFilter}

  data list_query, :map
  data affiliates, :list

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu id="left-menu" />
        <div class="p-4 pt-8">
          <Breadcrumbs breadcrumbs={[%{name: "Affiliates", to: "/lab-light/example-pages/affiliates"}]} />
          <Heading size={32} class="pt-4 pb-8">Affiliates</Heading>
          <TopToDown>
            <ButtonsList>
              <UsernameFilter id="username_filter"/>
            </ButtonsList>
            <AffiliatesList {=@affiliates}/>
          </TopToDown>
        </div>
      </div>
    </div>
    """
  end

  def mount(params, _session, socket) do
    list_query = %{
      filter: %{
        user: %{id: [], country: []}
      },
      pagination: %{
        offset: 0,
        limit: 20
      }
    }

    socket = socket
      |> assign(theme_name: params["theme_name"] || "sportsbet-dark")
      |> assign(active_page: __MODULE__)
      |> assign(list_query: list_query)
      |> assign(affiliates: Affiliates.list(list_query))

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def handle_info({:username_filter, user_ids}, socket) do
    list_query = %{ socket.assigns.list_query |
      filter: %{ socket.assigns.list_query.filter |
        user: %{ socket.assigns.list_query.filter.user |
          id: user_ids
        }
      },
      pagination: %{
        offset: 0,
        limit: 20
      }
    }

    socket = socket
      |> assign(list_query: list_query)
      |> assign(affiliates: Affiliates.list(list_query))

    {:noreply, socket}
  end
end
