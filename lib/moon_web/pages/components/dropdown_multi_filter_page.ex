defmodule MoonWeb.Pages.Components.DropdownMultiFilterPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Heading
  alias Moon.Components.CodePreview
  alias Moon.Components.Link
  alias Moon.Autolayouts.TopToDown

  alias MoonWeb.Pages.ExamplePages.Shared.Filters.CountryFilter
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.SiteFilter

  data country_filter, :list, default: []
  data site_filter, :list, default: []

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

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

      <ExampleAndCode show_state={true}>
        <:example>
          <CountryFilter id="country_filter" active_items={@country_filter} />
        </:example>
        <:code>
          <#CodePreview>
            <DropdownMultiFilter
              {=@show_filter}
              {=@search_text}
              {=@all_items}
              {=@selected_items}
              {=@active_items}
              on_apply="apply_filter"
              on_discard="discard_filter"
              on_clear="clear_filter"
              on_search="handle_filter_search"
              on_select="handle_filter_select"
              on_close="toggle_filter"
            >
              <Chip on_click="toggle_filter" value="country" right_icon="icon_chevron_down_rounded">
                {"Country #{length(@active_items) |> Helpers.format_filter_count()}"}
              </Chip>
            </DropdownMultiFilter>
          </#CodePreview>
        </:code>
        <:state>@country_filters = {inspect(@country_filter)}</:state>
      </ExampleAndCode>

      <ExampleAndCode show_state={true}>
        <:example>
          <SiteFilter id="site_filter" active_items={@site_filter} />
        </:example>
        <:code>
          <#CodePreview>
            <DropdownMultiFilter
              {=@show_filter}
              {=@all_items}
              {=@selected_items}
              {=@active_items}
              on_apply="apply_filter"
              on_discard="discard_filter"
              on_clear="clear_filter"
              on_select="handle_filter_select"
              on_close="toggle_filter"
            >
              <Chip on_click="toggle_filter" value="country" right_icon="icon_chevron_down_rounded">
                {"Brands #{length(@active_items) |> Helpers.format_filter_count()}"}
              </Chip>
            </DropdownMultiFilter>
          </#CodePreview>
        </:code>
        <:state>@site_filters = {inspect(@site_filter)}</:state>
      </ExampleAndCode>
    </TopToDown>
    """
  end

  def handle_info({:apply_filter, filter}, socket) do
    socket = case filter do
      {:country, items}  -> socket |> assign(country_filter: items)
      {:site, items}     -> socket |> assign(site_filter: items)
      _                  -> socket
    end

    {:noreply, socket}
  end
end
