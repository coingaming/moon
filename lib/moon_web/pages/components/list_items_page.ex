defmodule MoonWeb.Pages.Components.ListItemsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconChartArea
  alias Moon.Assets.Icons.IconChevronDownRounded
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.ListItems.SingleLineItem
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
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
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'default',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'List item subtext'
      },
      %{
        :name => 'size',
        :type => 'md | lg | xl',
        :required => 'false',
        :default => 'md',
        :description => 'List item size'
      },
      %{
        :name => 'background_color',
        :type => 'string',
        :required => 'false',
        :default => 'gohan',
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
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="List Item">
        <p>
          List Item
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Medium size (default)" id="line_items_1">
        <:example>
          <TopToDown class="bg-goku py-6 px-4 w-56 mx-auto">
            <SingleLineItem>Single line item</SingleLineItem>

            <SingleLineItem background_color="goku">Single line item</SingleLineItem>

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
          <TopToDown class="bg-goku py-6 px-4 w-56 mx-auto">
            <SingleLineItem size="lg">Single line item</SingleLineItem>

            <SingleLineItem size="lg" background_color="goku">Single line item</SingleLineItem>

            <SingleLineItem size="lg" current>
              <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
              Single line item
            </SingleLineItem>

            <SingleLineItem size="lg">
              <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
              Single line item
            </SingleLineItem>

            <SingleLineItem size="lg">
              <:right_icon><IconChevronDownRounded font_size="1.25rem" /></:right_icon>
              Single line item
            </SingleLineItem>

            <SingleLineItem size="lg">
              <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
              <:right_icon><IconChevronDownRounded font_size="1.25rem" /></:right_icon>
              Single line item
            </SingleLineItem>
          </TopToDown>
        </:example>

        <:code>{get_list_item_2_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def get_list_item_1_code() do
    """
      alias Moon.Autolayouts.TopToDown
      alias Moon.Components.ListItems.SingleLineItem

      <TopToDown>
        <SingleLineItem>Single line item</SingleLineItem>

        <SingleLineItem background_color="goku">Single line item</SingleLineItem>

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
        <SingleLineItem size="lg">Single line item</SingleLineItem>

        <SingleLineItem size="lg" background_color="goku">Single line item</SingleLineItem>

        <SingleLineItem size="lg" current>
          <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
          Single line item
        </SingleLineItem>

        <SingleLineItem size="lg">
          <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
          Single line item
        </SingleLineItem>

        <SingleLineItem size="lg">
          <:right_icon><IconChevronDownRounded font_size="1.25rem" /></:right_icon>
          Single line item
        </SingleLineItem>

        <SingleLineItem size="lg">
          <:left_icon><IconChartArea font_size="1.25rem" /></:left_icon>
          <:right_icon><IconChevronDownRounded font_size="1.25rem" /></:right_icon>
          Single line item
        </SingleLineItem>
      </TopToDown>
    """
  end
end
