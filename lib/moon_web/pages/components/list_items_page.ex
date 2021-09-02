defmodule MoonWeb.Pages.Components.ListItemsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Assets.Icons.IconChartArea
  alias Moon.Assets.Icons.IconChevronDownRounded
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.ListItems.SingleLineItem
  alias MoonWeb.Components.Breadcrumbs

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

  def render(assigns) do
    ~F"""
    <TopToDown gap={4}>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={32}>List item component</Heading>

      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon-Components?node-id=344%3A306">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/list_items_page.ex">Sourcecode of this page</Link>
      </p>

      Medium size (default)

      <ExampleAndCode id="line_items_1">
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

        <:code>
          <#CodePreview>
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
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      Large size

      <ExampleAndCode id="line_items_2">
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

        <:code>
          <#CodePreview>
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
          </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
