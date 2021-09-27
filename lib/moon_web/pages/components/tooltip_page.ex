defmodule MoonWeb.Pages.Components.TooltipPage do
  use MoonWeb, :live_view

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.{Button, CodePreview, Heading, Link, Tooltip}
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/tooltip",
        name: "Tooltip"
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
        <Heading size={56} class="mb-4">Popover Component</Heading>
        <Link
          class="mb-4"
          to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/popover_v2.ex"
        >
          Sourcecode of this page
        </Link>
        {#for placement <- ["top", "right", "bottom", "left"]}
          <ExampleAndCode class="my-12" id={"tooltip_#{placement}"}>
            <:example>
              <LeftToRight>
                <Tooltip placement={placement} text={placement}>
                  <Button variant="primary">Hover Me</Button>
                </Tooltip>
              </LeftToRight>
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
    </Page>
    """
  end
end
