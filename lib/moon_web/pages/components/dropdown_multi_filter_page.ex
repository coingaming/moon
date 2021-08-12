defmodule MoonWeb.Pages.Components.DropdownMultiFilterPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Heading
  alias Moon.Components.CodePreview
  alias Moon.Components.Link
  alias Moon.Autolayouts.TopToDown

  alias MoonWeb.Pages.ExamplePages.Shared.Filters.CountryFilter
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.SiteFilter

  data country_filter_values, :list, default: []
  data site_filter_values, :list, default: []

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}

    <TopToDown>
      <Heading size={32} class="mb-8">Dropdown multifilter</Heading>
      <Link to="https://www.figma.com/file/Ai0SGAAfoL0bXI88Zn0Eo3/MDS-UI-specs?node-id=1375%3A9769">
        Figma design
      </Link>
      <Link
        class="mb-4"
        to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/dropdown_multi_filter.ex"
      >
        Sourcecode of this page
      </Link>

      <ExampleAndCode show_state>
        <:example>
          <CountryFilter active_values={@country_filter_values} />
        </:example>
        <:code>
          <#CodePreview>
            <DropdownMultiFilter
              id={@name}
              all_items={all_items()}
              active_values={@active_values}
              :let={toggle_filter: toggle_filter, is_open: is_open}
            >
              <Chip
                on_click={toggle_filter}
                value="country"
                right_icon="icon_chevron_down_rounded"
                active={is_open or length(@active_values) > 0}
              >
                {"Country #{length(@active_values) |> Helpers.format_filter_count()}"}
              </Chip>
            </DropdownMultiFilter>
          </#CodePreview>
        </:code>
        <:state>@country_filter_valuess = {inspect(@country_filter_values)}</:state>
      </ExampleAndCode>

      <ExampleAndCode show_state>
        <:example>
          <SiteFilter active_values={@site_filter_values} />
        </:example>
        <:code>
          <#CodePreview>
            <DropdownMultiFilter
              id={@name}
              all_items={all_items()}
              active_values={@active_values}
              disable_search={true}
              :let={toggle_filter: toggle_filter, is_open: is_open}
            >
              <Chip
                on_click={toggle_filter}
                value="site"
                right_icon="icon_chevron_down_rounded"
                active={is_open or length(@active_values) > 0}
              >
                {"Brands #{length(@active_values) |> Helpers.format_filter_count()}"}
              </Chip>
            </DropdownMultiFilter>
          </#CodePreview>
        </:code>
        <:state>@site_filter_valuess = {inspect(@site_filter_values)}</:state>
      </ExampleAndCode>
    </TopToDown>
    """
  end

  def handle_info({:filters, filter_event}, socket) do
    socket =
      case filter_event do
        {:apply_country_filter, values} -> socket |> assign(country_filter_values: values)
        {:apply_site_filter, values} -> socket |> assign(site_filter_values: values)
        _ -> socket
      end

    {:noreply, socket}
  end
end
