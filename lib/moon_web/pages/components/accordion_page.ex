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

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={[
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
          ]}>
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
    """
  end
end
