defmodule MoonWeb.Pages.Components.PaginationPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Pagination
  alias Moon.Autolayouts.TopToDown

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

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Heading size={32}>Pagination</Heading>

      <p>
        Pagination component.
      </p>

      <ExampleAndCode show_state layout="column">
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

      <Heading size={24} class="mt-4" is_regular>Size</Heading>

      <p>
        Use <code class="bg-goku-40">size</code> prop. Default size is xsmall.
      </p>

      <ExampleAndCode layout="column">
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

      <Heading size={24} class="mt-4" is_regular>Example with a side section</Heading>

      <ExampleAndCode show_state layout="column">
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
