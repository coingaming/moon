defmodule MoonWeb.Pages.Components.ListItemsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconChartArea
  alias Moon.Assets.Icons.IconChevronDownRounded
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.ListItems.SingleLineItem
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/list_items",
        name: "List Items"
      }
    ]

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown gap={4}>
        <Heading size={56} class="mb-4">List item component</Heading>

        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon-Components?node-id=344%3A306">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/list_items_page.ex">Sourcecode of this page</Link>
        </p>

        <ExampleAndCode title="Medium size (default)" id="line_items_1">
          <:example>
            <TopToDown class="bg-goku-100 py-6 px-4 w-56 mx-auto">
              <SingleLineItem>Single line item</SingleLineItem>

              <SingleLineItem background_color="goku-100">Single line item</SingleLineItem>

              <SingleLineItem current>
                <:left_icon><IconChartArea /></:left_icon>
                Single line item
              </SingleLineItem>

              <SingleLineItem>
                <:left_icon><IconChartArea /></:left_icon>
                Single line item
              </SingleLineItem>

              <SingleLineItem>
                <:right_icon><IconChevronDownRounded /></:right_icon>
                Single line item
              </SingleLineItem>

              <SingleLineItem>
                <:left_icon><IconChartArea /></:left_icon>
                <:right_icon><IconChevronDownRounded /></:right_icon>
                Single line item
              </SingleLineItem>
            </TopToDown>
          </:example>

          <:code>{get_list_item_1_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Large size" id="line_items_2">
          <:example>
            <TopToDown class="bg-goku-100 py-6 px-4 w-56 mx-auto">
              <SingleLineItem size="large">Single line item</SingleLineItem>

              <SingleLineItem size="large" background_color="goku-100">Single line item</SingleLineItem>

              <SingleLineItem size="large" current>
                <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
                Single line item
              </SingleLineItem>

              <SingleLineItem size="large">
                <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
                Single line item
              </SingleLineItem>

              <SingleLineItem size="large">
                <:right_icon><IconChevronDownRounded font_size="1.25rem" /></:right_icon>
                Single line item
              </SingleLineItem>

              <SingleLineItem size="large">
                <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
                <:right_icon><IconChevronDownRounded font_size="1.25rem" /></:right_icon>
                Single line item
              </SingleLineItem>
            </TopToDown>
          </:example>

          <:code>{get_list_item_2_code()}</:code>
        </ExampleAndCode>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={[
            %{
              :name => 'default',
              :type => 'slot',
              :required => 'true',
              :default => '-',
              :description => 'List item subtext'
            },
            %{
              :name => 'size',
              :type => 'medium | large',
              :required => 'false',
              :default => 'medium',
              :description => 'List item size'
            },
            %{
              :name => 'background_color',
              :type => 'string',
              :required => 'false',
              :default => 'gohan-100',
              :description => 'List item background color'
            },
            %{
              :name => 'color',
              :type => '-',
              :required => '-',
              :default => '-',
              :description => 'TODO - List item color'
            },
            %{
              :name => 'left_icon',
              :type => 'slot',
              :required => 'false',
              :default => '-',
              :description => 'Element on the left'
            },
            %{
              :name => 'right_icon',
              :type => 'slot',
              :required => 'false',
              :default => '-',
              :description => 'Element on the right'
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

  def get_list_item_1_code() do
    """
      alias Moon.Autolayouts.TopToDown
      alias Moon.Components.ListItems.SingleLineItem

      <TopToDown>
        <SingleLineItem>Single line item</SingleLineItem>

        <SingleLineItem background_color="goku-100">Single line item</SingleLineItem>

        <SingleLineItem current>
          <:left_icon><IconChartArea /></:left_icon>
          Single line item
        </SingleLineItem>

        <SingleLineItem>
          <:left_icon><IconChartArea /></:left_icon>
          Single line item
        </SingleLineItem>

        <SingleLineItem>
          <:right_icon><IconChevronDownRounded /></:right_icon>
          Single line item
        </SingleLineItem>

        <SingleLineItem>
          <:left_icon><IconChartArea /></:left_icon>
          <:right_icon><IconChevronDownRounded /></:right_icon>
          Single line item
        </SingleLineItem>
      </TopToDown>
    """
  end

  def get_list_item_2_code() do
    """
      alias Moon.Autolayouts.TopToDown
      alias Moon.Components.ListItems.SingleLineItem

      <TopToDown>
        <SingleLineItem size="large">Single line item</SingleLineItem>

        <SingleLineItem size="large" background_color="goku-100">Single line item</SingleLineItem>

        <SingleLineItem size="large" current>
          <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
          Single line item
        </SingleLineItem>

        <SingleLineItem size="large">
          <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
          Single line item
        </SingleLineItem>

        <SingleLineItem size="large">
          <:right_icon><IconChevronDownRounded font_size="1.25rem" /></:right_icon>
          Single line item
        </SingleLineItem>

        <SingleLineItem size="large">
          <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
          <:right_icon><IconChevronDownRounded font_size="1.25rem" /></:right_icon>
          Single line item
        </SingleLineItem>
      </TopToDown>
    """
  end
end
