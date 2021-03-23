defmodule MoonWeb.Pages.Components.PaginationPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Pagination
  alias Moon.Components.Stack

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        current_page_number: 6,
        size_page_number: 6,
        total_pages: 10
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=32>Pagination</Heading>

      <p>
        Pagination component.
      </p>

      <ExampleAndCode show_state={{ true }} layout="column">
        <template slot="example">
          <Pagination
            current_page_number={{ @current_page_number }}
            total_pages={{ @total_pages }}
            range_before={{ 1 }}
            range_after={{ 2 }}
            size="xsmall"
            previous_button_label="Previous"
            next_button_label="Next"
            on_change="change_current_page"
          />
        </template>

        <template slot="code">
      <#CodePreview>
        alias Moon.Components.Pagination

        <Pagination
          current_page_number={{ @current_page_number }}
          total_pages={{ @total_pages }}
          range_before={{ 1 }}
          range_after={{ 2 }}
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
        </template>

        <template slot="state">@current_page_number = {{ @current_page_number }}</template>
      </ExampleAndCode>

      <Heading size=24 class="mt-4" is_regular>Size</Heading>

      <p>
        Use <code class="bg-goku-40">size</code> prop. Default size is xsmall.
      </p>

      <ExampleAndCode layout="column">
        <template slot="example">
          <Stack>
            <Pagination
              size="xsmall"
              current_page_number={{ @size_page_number }}
              total_pages={{ @total_pages }}
              on_change="change_size_page"
            />

            <Pagination
              size="small"
              current_page_number={{ @size_page_number }}
              total_pages={{ @total_pages }}
              on_change="change_size_page"
            />

            <Pagination
              size="medium"
              current_page_number={{ @size_page_number }}
              total_pages={{ @total_pages }}
              on_change="change_size_page"
            />

            <Pagination
              size="large"
              current_page_number={{ @size_page_number }}
              total_pages={{ @total_pages }}
              on_change="change_size_page"
            />
          </Stack>
        </template>

        <template slot="code">
          <#CodePreview>
            <Pagination size="xsmall" />

            <Pagination size="small" />

            <Pagination size="medium" />

            <Pagination size="large" />
          </#CodePreview>
        </template>
      </ExampleAndCode>

    </Stack>
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
end
