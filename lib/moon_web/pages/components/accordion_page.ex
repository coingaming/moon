defmodule MoonWeb.Pages.Components.AccordionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Accordion
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data(item_id, :string, default: "1")

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/accordion",
        name: "Accordion"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Accordion</Heading>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=12083%3A426">Figma design</Link>
        <ExampleAndCode title="Accordion" id="accordion_1">
          <:example>
            <Accordion id="customer-support">
              <:title>Customer support</:title>
              <:header_controls>Additional controls</:header_controls>
              <:content>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
              </:content>
            </Accordion>
            <Accordion id="deposits-and-withdrawals" open_by_default>
              <:title>Deposit & Withdrawals</:title>
              <:content>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
              </:content>
            </Accordion>
          </:example>
          <:code>{get_example_1_code()}</:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def get_example_1_code() do
    """
    """
  end
end
