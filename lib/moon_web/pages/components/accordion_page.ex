defmodule MoonWeb.Pages.Components.AccordionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Accordion
  alias Moon.Components.Accordion.Item
  alias Moon.Components.CodePreview
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

        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=12083%3A426">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/accordion_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/accordion">React implementation</Link>
        </p>

        <ExampleAndCode title="Accordion" id="accordion_1">
          <:example>
            <Accordion>
              <Item click="open" item_id="1" is_open={@item_id == "1"} title="Welcome bonus">
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
              </Item>
              <Item click="open" item_id="2" is_open={@item_id == "2"} title="Customer support">
                Content
              </Item>
              <Item click="open" item_id="3" is_open={@item_id == "3"} title="Deposit & Withdrawals">
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
                Content <br>
              </Item>
            </Accordion>
          </:example>
          <:code>
            <#CodePreview>
          <Accordion>
            <Item click="open" item_id="1" is_open={ @item_id == "1" } title="Welcome bonus">
              Content <br />
              Content <br />
            </Item>
            <Item click="open" item_id="2" is_open={ @item_id == "2" } title="Customer support">
              Content
            </Item>
            <Item click="open" item_id="3" is_open={ @item_id == "3" } title="Deposit & Withdrawals">
              Content <br />
              Content <br />
              Content <br />
              Content <br />
            </Item>
          </Accordion>
        </#CodePreview>
          </:code>
          <:state>
            <pre>@item_id = {@item_id}</pre>
          </:state>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def handle_event("open", %{"item_id" => item_id}, socket) do
    {:noreply, assign(socket, item_id: item_id)}
  end
end
