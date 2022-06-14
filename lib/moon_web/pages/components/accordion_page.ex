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
        :default => 'false',
        :description => 'Expanded/collapsed accordion by default'
      },
      %{
        :name => 'with_button',
        :type => 'boolean',
        :required => 'false',
        :default => 'true',
        :description => 'Show expand/collapse chevron'
      },
      %{
        :name => 'disable_open',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Disable expand/collapse accordion'
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
        :type => 'small | medium | large | xlarge',
        :required => 'false',
        :default => 'medium',
        :description => 'Size variant of accordion'
      },
      %{
        :name => 'is_content_inside',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Whether the content is displayed outside of the accordion header'
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
          <ExampleAndCode title="Default" id="accordion-1">
            <:example>
              <div class="flex flex-col gap-4">
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
              </div>
            </:example>
            <:code>{get_example_1_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Open by default" id="accordion-2">
            <:example>
              <div class="flex flex-col gap-4">
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
              </div>
            </:example>
            <:code>{get_example_2_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Without button" id="accordion-3">
            <:example>
              <div class="flex flex-col gap-4">
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
              </div>
            </:example>
            <:code>{get_example_3_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Disable open" id="accordion-4">
            <:example>
              <div class="flex flex-col gap-4">
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
              </div>
            </:example>
            <:code>{get_example_4_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Content outside" id="accordion-5">
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

          <ExampleAndCode title="Additional controls" id="accordion-6">
            <:example>
              <div class="flex flex-col gap-4">
                <Accordion id="customer-support">
                  <:title>Customer support</:title>
                  <:header_controls>
                    <ChatChat class="w-6 h-6" />
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

          <ExampleAndCode title="Sizes" id="accordion-7">
            <:example>
              <div class="flex flex-col gap-4">
                <Accordion id="size-4" size="xlarge">
                  <:title>X Large</:title>
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
                <Accordion id="size-3" size="large">
                  <:title>Large</:title>
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
                <Accordion id="size-2">
                  <:title>Medium (Default)</:title>
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
                <Accordion id="size-1" size="small">
                  <:title>Small</:title>
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
            <:code>{get_example_7_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Sizes: content outside" id="accordion-8">
            <:example>
              <div class="flex flex-col gap-4">
                <Accordion id="size-out-4" size="xlarge" is_content_inside={false}>
                  <:title>X Large</:title>
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
                <Accordion id="size-out-3" size="large" is_content_inside={false}>
                  <:title>Large</:title>
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
                <Accordion id="size-out-2" is_content_inside={false}>
                  <:title>Medium (Default)</:title>
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
                <Accordion id="size-out-1" size="small" is_content_inside={false}>
                  <:title>Small</:title>
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
            <:code>{get_example_8_code()}</:code>
          </ExampleAndCode>
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-moon-20 font-normal my-4">Props</div>
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

  def get_example_7_code() do
    """
      <Accordion id="size-3" size="xlarge">
        <:title>X Large</:title>
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
      <Accordion id="size-3" size="large">
        <:title>Large</:title>
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
      <Accordion id="size-2">
        <:title>Medium (Default)</:title>
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
      <Accordion id="size-1" size="small">
        <:title>Small</:title>
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

  def get_example_8_code() do
    """
      <Accordion id="size-out-4" size="xlarge" is_content_inside={false}>
        <:title>X Large</:title>
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
      <Accordion id="size-out-3" size="large" is_content_inside={false}>
        <:title>Large</:title>
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
      <Accordion id="size-out-2" is_content_inside={false}>
        <:title>Medium (Default)</:title>
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
      <Accordion id="size-out-1" size="small" is_content_inside={false}>
        <:title>Small</:title>
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
