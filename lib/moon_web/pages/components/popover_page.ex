defmodule MoonWeb.Pages.Components.PopoverPage.PopoverExample do
  use MoonWeb, :stateful_component

  alias Moon.Components.PopoverV2
  alias Moon.Components.Button

  prop placement, :string, required: true

  data show, :boolean, default: false

  def render(assigns) do
    ~F"""
    <PopoverV2 show={@show} placement={@placement} on_close="toggle_show">
      <Button on_click="toggle_show" variant="primary">Click Me</Button>

      <:content>
        <div class="w-64 h-24 flex items-center justify-around bg-gohan-100 border-2 border-gohan-100 z-50">
          <div class="capitalize">{"#{@placement}"}</div>
        </div>
      </:content>
    </PopoverV2>
    """
  end

  def handle_event("toggle_show", _, socket = %{assigns: %{show: show}}) do
    {:noreply, socket |> assign(show: !show)}
  end
end

defmodule MoonWeb.Pages.Components.PopoverPage do
  use MoonWeb, :live_view

  alias Moon.Components.Heading
  alias Moon.Components.CodePreview
  alias Moon.Components.Link
  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.Page
  alias Moon.Autolayouts.LeftToRight
  alias MoonWeb.Components.ExampleAndCode

  alias MoonWeb.Pages.Components.PopoverPage.PopoverExample

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/popover",
        name: "Popover"
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
    {asset_import(@socket, "js/tailwind")}
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Popover Component</Heading>

        <p>
          <Link to="https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=1313%3A15085">Figma design</Link>
          <Link
            class="mb-4"
            to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/popover_v2.ex"
          >Sourcecode of this page</Link>
        </p>

        {#for placement <- [
            "top-start",
            "top",
            "top-end",
            "right-start",
            "right",
            "right-end",
            "bottom-start",
            "bottom",
            "bottom-end",
            "left-start",
            "left",
            "left-end"
          ]}
          <ExampleAndCode id={"popover_#{placement}"} class="my-12">
            <:example>
              <LeftToRight>
                <PopoverExample id={placement} placement={placement} />
              </LeftToRight>
            </:example>
            <:code>
              <#CodePreview>
              <PopoverV2 show={@show} placement={placement} on_close="toogle_show">
                <Chip on_click="toogle_show">Click Me</Chip>
                <:content>...</:content>
              </PopoverV2>
            </#CodePreview>
            </:code>
          </ExampleAndCode>
        {/for}
      </TopToDown>
    </Page>
    """
  end
end
