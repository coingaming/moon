defmodule MoonWeb.Pages.Components.AccordionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Accordion
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column
  alias Moon.Icons.{ChatChat, ChatComment, ChatCommentAdd, ChatDoubleBubble}

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

  data props_info_array, :list,
    default: [
      %{
        :name => 'title',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Title of accordion'
      },
      %{
        :name => 'open_by_default',
        :type => 'boolean',
        :required => 'false',
        :default => '-',
        :description => 'Expanded/collapsed accordion by default'
      },
      %{
        :name => 'with_button',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Show expand/collapse chevron'
      },
      %{
        :name => 'disable_open',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Disable expand/collapse accordion'
      },
      %{
        :name => 'content',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Content to show inside of accordion'
      },
      %{
        :name => 'size',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Size variant of accordion'
      },
      %{
        :name => 'is_content_inside',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Whether the content is displayed outside of the accordion header'
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
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

        <Context put={theme_class: @theme_name}>

          <ExampleAndCode title="Default" id="accordion-1" is_gray_bg>
            <:example>
            <div class="flex flex-col gap-4">
                <Accordion id="deposits-and-withdrawals_1">
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
              </div>
            </:example>
            <:code>{get_example_1_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Open by default" id="accordion-2" is_gray_bg>
            <:example>
            <div class="flex flex-col gap-4">
                <Accordion id="deposits-and-withdrawals_2" open_by_default>
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
              </div>
            </:example>
            <:code>{get_example_2_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Without button" id="accordion-3" is_gray_bg>
            <:example>
            <div class="flex flex-col gap-4">
                <Accordion id="deposits-and-withdrawals_3" with_button={false}>
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
              </div>
            </:example>
            <:code>{get_example_3_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Disable open" id="accordion-4" is_gray_bg>
            <:example>
            <div class="flex flex-col gap-4">
                <Accordion id="deposits-and-withdrawals_4" disable_open>
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
              </div>
            </:example>
            <:code>{get_example_4_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Content outside" id="accordion-5" is_gray_bg={true}>
            <:example>
            <div class="flex flex-col gap-4">
                <Accordion id="basket-items" open_by_default is_content_inside={false}>
                  <:title>Basket Items</:title>
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
              </div>
            </:example>
            <:code>{get_example_5_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Additional controls" id="accordion-6" is_gray_bg={true}>
            <:example>
            <div class="flex flex-col gap-4">
                <Accordion id="customer-support">
                  <:title>Customer support</:title>
                  <:header_controls>
                    <ChatChat class="w-6 h-6"/>
                    <ChatComment class="w-6 h-6" />
                    <ChatCommentAdd class="w-6 h-6" />
                    <ChatDoubleBubble class="w-6 h-6" />
                  </:header_controls>
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
              </div>
            </:example>
            <:code>{get_example_6_code()}</:code>
          </ExampleAndCode>
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={@props_info_array}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type" :let={item: item}>
              {item.type}
            </Column>
            <Column name="required" label="Required" :let={item: item}>
              {item.required}
            </Column>
            <Column name="default" label="Default" :let={item: item}>
              {item.default}
            </Column>
            <Column name="description" label="Description" :let={item: item}>
              {item.description}
            </Column>
          </Table>
        </div>
      </TopToDown>
    </Page>
    """
  end

  def get_example_1_code() do
    """
    <Accordion id="deposits-and-withdrawals-1">
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
    """
  end

  def get_example_2_code() do
    """
    <Accordion id="deposits-and-withdrawals-2" open_by_default>
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
    """
  end

  def get_example_3_code() do
    """
      <Accordion id="deposits-and-withdrawals-3" with_button={false}>
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
    """
  end

  def get_example_4_code() do
    """
      <Accordion id="deposits-and-withdrawals-4" disable_open>
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
    """
  end

  def get_example_5_code() do
    """
      <Accordion id="basket-items" open_by_default is_content_inside={false}>
        <:title>Basket Items</:title>
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
    """
  end

  def get_example_6_code() do
    """
      <Accordion id="customer-support">
        <:title>Customer support</:title>
        <:header_controls>
          <ChatChat class="w-6 h-6"/>
          <ChatComment class="w-6 h-6" />
          <ChatCommentAdd class="w-6 h-6" />
          <ChatDoubleBubble class="w-6 h-6" />
        </:header_controls>
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
    """
  end
end
