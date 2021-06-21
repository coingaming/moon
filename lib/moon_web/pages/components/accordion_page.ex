defmodule MoonWeb.Pages.Components.AccordionPage do
  use MoonWeb, :live_view
  alias Moon.Components.Heading
  alias Moon.Components.Accordion
  alias Moon.Components.Accordion.Item
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  data(item_id, :string, default: "1")

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <Heading size={32} class="mb-8">Accordion</Heading>

    <ExampleAndCode show_state={true}>
      <#template slot="example">
        <Accordion>
          <Item click="open" item_id="1" is_open={@item_id == "1"} title="Welcome bonus">
            Content <br />
            Content <br />
            Content <br />
            Content <br />
            Content <br />
            Content <br />
            Content <br />
            Content <br />
          </Item>
          <Item click="open" item_id="2" is_open={@item_id == "2"} title="Customer support">
            Content
          </Item>
          <Item click="open" item_id="3" is_open={@item_id == "3"} title="Deposit & Withdrawals">
            Content <br />
            Content <br />
            Content <br />
            Content <br />
            Content <br />
            Content <br />
            Content <br />
            Content <br />
          </Item>
        </Accordion>
      </#template>
      <#template slot="code">
        <#CodePreview>
          <Accordion>
            <Item click="open" item_id="1" is_open={{ @item_id == "1" }} title="Welcome bonus">
              Content <br />
              Content <br />
            </Item>
            <Item click="open" item_id="2" is_open={{ @item_id == "2" }} title="Customer support">
              Content
            </Item>
            <Item click="open" item_id="3" is_open={{ @item_id == "3" }} title="Deposit & Withdrawals">
              Content <br />
              Content <br />
              Content <br />
              Content <br />
            </Item>
          </Accordion>
        </#CodePreview>
      </#template>
      <#template slot="state">
        <pre>@item_id = {@item_id}</pre>
      </#template>
    </ExampleAndCode>
    """
  end

  def handle_event("open", %{"item_id" => item_id}, socket) do
    {:noreply, assign(socket, item_id: item_id)}
  end
end
