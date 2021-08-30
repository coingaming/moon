defmodule MoonWeb.Pages.Components.TooltipPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.{Heading, Button, CodePreview, Link, Tooltip}
  alias Moon.Autolayouts.TopToDown

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}
    <TopToDown>
      <Heading size={32} class="mb-8">Popover Component</Heading>
      <Link
        class="mb-4"
        to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/popover_v2.ex"
      >
        Sourcecode of this page
      </Link>
      {#for placement <- ["top", "right", "bottom", "left"]}
        <ExampleAndCode class="my-12" id={"tooltip_#{placement}"}>
          <:example>
            <Tooltip placement={placement} text={placement}>
              <Button variant="primary">Hover Me</Button>
            </Tooltip>
          </:example>
          <:code>
            <#CodePreview>
              <Tooltip placement={placement} text={placement}>
                <Button variant="primary">Hover Me</Button>
              </Tooltip>
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      {/for}
    </TopToDown>
    """
  end
end
