defmodule MoonWeb.Pages.Components.AccordionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Accordion
  alias Moon.Icons.{ChatChat, ChatComment, ChatCommentAdd, ChatDoubleBubble}
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
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
       direction: params["direction"] || "ltr",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Accordion">
        <p>
          Like the accordion instrument, our accordion component reveals or
          hides associated sections of content. This is done through the use of
          a vertically stacked list of headers.
        </p>
        <p>
          Users can decide which sections to toggle, read and close as the
          header titles will give them a high-level overview of the content
          that's in the space.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="accordion-1">
        <:example>
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
        </:example>
        <:code>{get_example_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Open by default" id="accordion-2">
        <:example>
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
        </:example>
        <:code>{get_example_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Without button" id="accordion-3">
        <:example>
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
        </:example>
        <:code>{get_example_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Disable open" id="accordion-4">
        <:example>
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
        </:example>
        <:code>{get_example_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Content outside" id="accordion-5">
        <:example>
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
        </:example>
        <:code>{get_example_5_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Additional controls" id="accordion-6">
        <:example>
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
        </:example>
        <:code>{get_example_6_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="accordion-7">
        <:example>
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
        </:example>
        <:code>{get_example_7_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes: content outside" id="accordion-8">
        <:example>
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
        </:example>
        <:code>{get_example_8_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
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
