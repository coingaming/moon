defmodule MoonWeb.Pages.Iframe.AccordionAccordion do
  use MoonWeb, :clean_view

  alias Moon.Components.Accordion
  alias Moon.Components.Accordion.Item
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  data(item_id, :string, default: "1")

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="accordion" title="Accordion">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Accordion>
            <Item click="open" item_id="1" is_open={@item_id == "1"} title="Welcome bonus">
              lorem ipsum dolor sit amet, consectetur
            </Item>
            <Item click="open" item_id="2" is_open={@item_id == "2"} title="Customer support">
              lorem ipsum dolor sit amet, consectetur
            </Item>
            <Item click="open" item_id="3" is_open={@item_id == "3"} title="Deposit & Withdrawals">
              lorem ipsum dolor sit amet, consectetur
            </Item>
          </Accordion>
        </div>
      </:example>
      <:code>
        <#CodePreview>
          # imports
          alias Moon.Components.Accordion
          alias Moon.Components.Accordion.Item

          # render
          <Accordion>
            <Item click="open" item_id="1" is_open={@item_id == "1"} title="Welcome bonus">
              lorem ipsum dolor sit amet, consectetur
            </Item>
            <Item click="open" item_id="2" is_open={@item_id == "2"} title="Customer support">
              lorem ipsum dolor sit amet, consectetur
            </Item>
            <Item click="open" item_id="3" is_open={@item_id == "3"} title="Deposit & Withdrawals">
              lorem ipsum dolor sit amet, consectetur
            </Item>
          </Accordion>

          # event handle
          def handle_event("open", %{"item_id" => item_id}, socket) do
            {:noreply, assign(socket, item_id: item_id)}
          end
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end

  def handle_event("open", %{"item_id" => item_id}, socket) do
    {:noreply, assign(socket, item_id: item_id)}
  end
end
