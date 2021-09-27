defmodule MoonWeb.Pages.Components.PaginationPage do
  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Pagination
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/pagination",
        name: "Pagination"
      }
    ]

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
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
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Pagination</Heading>

        <p>
          Pagination component.
        </p>

        <p class="m-8">
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=20306%3A0">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/pagination_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/pagination">React implementation</Link>
        </p>

        <ExampleAndCode layout="column" id="pagination_1">
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

          <:code>
            <#CodePreview>
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
      </#CodePreview>
          </:code>

          <:state>@current_page_number = {@current_page_number}</:state>
        </ExampleAndCode>

        <ExampleAndCode title="Size" layout="column" id="pagination_2">
          <:state>
            Use <code class="bg-goku-40">size</code> prop. Default size is xsmall.
          </:state>
          <:example>
            <TopToDown>
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
            </TopToDown>
          </:example>

          <:code>
            <#CodePreview>
        <Pagination size="xsmall" />

        <Pagination size="small" />

        <Pagination size="medium" />

        <Pagination size="large" />
      </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Example with a side section" layout="column" id="pagination_3">
          <:example>
            <TopToDown>
              <div class="flex flex-wrap items-center">
                <div class="w-1/4 mb-4 text-xs">{side_text(@section_page_number, @section_per_page, @section_total_entries)}</div>

                <div class="w-3/4">
                  <Pagination
                    current_page_number={@section_page_number}
                    total_pages={@total_pages}
                    size="small"
                    on_change="change_section_page"
                  />
                </div>
              </div>
            </TopToDown>
          </:example>

          <:code>
            <#CodePreview>
        <div class="flex flex-wrap items-center">
          <div class="w-1/4 mb-4 text-xxs">
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

          "Showing #{min_entry} – #{max_entry} of #{total_entries}"
        end
      </#CodePreview>
          </:code>

          <:state>@page_number = {@section_page_number}<br>@per_page = {@section_per_page}<br>@total_entries = {@section_total_entries}</:state>
        </ExampleAndCode>
      </TopToDown>
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
end
