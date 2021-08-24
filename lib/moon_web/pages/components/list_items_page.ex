defmodule MoonWeb.Pages.Components.ListItemsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.ListItems.SingleLineItem

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
      <Heading size={32}>List item component</Heading>

      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon-Components?node-id=344%3A306">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/list_items_page.ex">Sourcecode of this page</Link>
      </p>

      <Heading size={24} is_regular>Usage</Heading>

      <ExampleAndCode>
        <:example>
          <TopToDown class="bg-goku-100 py-6 px-4 w-56 mx-auto">
            <SingleLineItem>Single line item</SingleLineItem>
            <SingleLineItem>Single line item</SingleLineItem>
          </TopToDown>
        </:example>

        <:code>
          <#CodePreview>
        alias Moon.Autolayouts.TopToDown
        alias Moon.Components.ListItems.SingleLineItem

        <TopToDown>
          <SingleLineItem>Single line item</SingleLineItem>
          <SingleLineItem>Single line item</SingleLineItem>
        </TopToDown>
          </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
