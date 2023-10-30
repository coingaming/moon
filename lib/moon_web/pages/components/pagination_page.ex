defmodule MoonWeb.Pages.Components.PaginationPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Facing.DeprecationWarning
  alias Moon.Components.Pagination
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/pagination",
        name: "Pagination"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"total_pages",
        :type => ~c"number",
        :required => ~c"true",
        :default => ~c"-",
        :description => ~c"The total number of pages."
      },
      %{
        :name => ~c"range_before",
        :type => ~c"number",
        :required => ~c"No",
        :default => ~c"1",
        :description => ~c"Beginning of displayed range"
      },
      %{
        :name => ~c"range_after",
        :type => ~c"number",
        :required => ~c"No",
        :default => ~c"1",
        :description => ~c"End of displayed range"
      },
      %{
        :name => ~c"previous_button_label",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"Previous",
        :description => ~c"Label for \"previous\" button"
      },
      %{
        :name => ~c"next_button_label",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"Next",
        :description => ~c"Label for \"next\" button"
      },
      %{
        :name => ~c"on_change",
        :type => ~c"event",
        :required => ~c"No",
        :default => ~c"-",
        :description =>
          ~c"The method to call when a page is clicked. Exposes the current page object as an argument."
      },
      %{
        :name => ~c"current_page_number",
        :type => ~c"number",
        :required => ~c"true",
        :default => ~c"-",
        :description => ~c"Current selected page"
      },
      %{
        :name => ~c"page_size_section",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Placeholder for \"page size\" component"
      },
      %{
        :name => ~c"page_size_section",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Placeholder for \"page size\" component"
      },
      %{
        :name => ~c"go_to_page_section",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Placeholder for \"go to page\" component"
      }
    ]
  )

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        total_pages: 10,
        current_page_number: 6,
        size_page_number: 6,
        section_page_number: 6,
        section_per_page: 5,
        section_total_entries: 48
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Pagination">
        <DeprecationWarning
          name="Pagination"
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.PaginationPage,
            theme_name: @theme_name,
            direction: @direction
          )}
        />
      </ComponentPageDescription>

      <ExampleAndCode title="Default" layout="column" id="pagination_1">
        <:example>
          <Pagination
            current_page_number={@current_page_number}
            total_pages={@total_pages}
            range_before={1}
            range_after={2}
            size="xsmall"
            previous_button_label="Previous"
            next_button_label="Next"
            on_change="change_current_page"
          />
        </:example>

        <:code>{get_pagination_1_code()}</:code>

        <:state>@current_page_number = {@current_page_number}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Size" layout="column" id="pagination_2">
        <:state>
          Use <code class="bg-gohan-40">size</code> prop. Default size is xsmall.
        </:state>
        <:example>
          <Pagination
            size="xsmall"
            current_page_number={@size_page_number}
            total_pages={@total_pages}
            on_change="change_size_page"
          />

          <Pagination
            size="small"
            current_page_number={@size_page_number}
            total_pages={@total_pages}
            on_change="change_size_page"
          />

          <Pagination
            size="medium"
            current_page_number={@size_page_number}
            total_pages={@total_pages}
            on_change="change_size_page"
          />

          <Pagination
            size="large"
            current_page_number={@size_page_number}
            total_pages={@total_pages}
            on_change="change_size_page"
          />
        </:example>

        <:code>{get_pagination_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Example with a side section" layout="column" id="pagination_3">
        <:example>
          <div class="flex flex-wrap items-center">
            <div class="w-1/4 mb-4 text-moon-12">{side_text(@section_page_number, @section_per_page, @section_total_entries)}</div>

            <div class="w-3/4">
              <Pagination
                current_page_number={@section_page_number}
                total_pages={@total_pages}
                size="small"
                on_change="change_section_page"
              />
            </div>
          </div>
        </:example>

        <:code>{get_pagination_3_code()}</:code>

        <:state>@page_number = {@section_page_number}<br>@per_page = {@section_per_page}<br>@total_entries = {@section_total_entries}</:state>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def handle_event("change_current_page", %{"page" => page}, socket) do
    socket = assign(socket, current_page_number: String.to_integer(page))
    {:noreply, socket}
  end

  def handle_event("change_size_page", %{"page" => page}, socket) do
    socket = assign(socket, size_page_number: String.to_integer(page))
    {:noreply, socket}
  end

  def handle_event("change_section_page", %{"page" => page}, socket) do
    socket = assign(socket, section_page_number: String.to_integer(page))
    {:noreply, socket}
  end

  def side_text(page_number, per_page, total_entries) do
    min_entry = (page_number - 1) * per_page + 1
    max_entry = min(min_entry + per_page - 1, total_entries)

    "Showing #{min_entry} – #{max_entry} of #{total_entries}"
  end

  def get_pagination_1_code() do
    """
      alias Moon.Components.Pagination

      <Pagination
        current_page_number={ @current_page_number }
        total_pages={ @total_pages }
        range_before={ 1 }
        range_after={ 2 }
        size="xsmall"
        previous_button_label="Previous"
        next_button_label="Next"
        on_change="change_current_page"
      />

      def handle_event("change_current_page", %{"page" => page}, socket) do
        socket = assign(socket, current_page_number: String.to_integer(page))
        {:noreply, socket}
      end
    """
  end

  def get_pagination_2_code() do
    """
      alias Moon.Components.Pagination

      <Pagination size="xsmall" />
      <Pagination size="small" />
      <Pagination size="medium" />
      <Pagination size="large" />
    """
  end

  def get_pagination_3_code() do
    """
      alias Moon.Components.Pagination

      <div class="flex flex-wrap items-center">
        <div class="w-1/4 mb-4 text-moon-10">
          { side_text(@page_number, @per_page, @total_entries) }
        </div>

        <div class="w-3/4">
          <Pagination
            current_page_number={ @page_number }}
          total_pages={ @total_pages }
            size="small"
            on_change="change_current_page"
          />
        </div>
      </div>

      def side_text(page_number, per_page, total_entries) do
        min_entry = (page_number - 1) * per_page + 1
        max_entry = min(min_entry + per_page - 1, total_entries)

        "Showing \#{min_entry} – \#{max_entry} of \#{total_entries}"
      end
    """
  end
end
