defmodule MoonWeb.Pages.Components.Dialog.PopoverPage.PopoverExample do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Components.Button
  alias Moon.Components.Popover

  prop placement, :string, required: true

  data show, :boolean, default: false

  def render(assigns) do
    ~F"""
    <Popover show={@show} placement={@placement} on_close="toggle_show">
      <Button on_click="toggle_show" variant="primary">Click Me</Button>

      <:content>
        <div class="w-64 h-24 flex items-center justify-around bg-gohan-100 border-2 border-gohan-100 z-50">
          <div class="capitalize">{"#{@placement}"}</div>
        </div>
      </:content>
    </Popover>
    """
  end

  def handle_event("toggle_show", _, socket = %{assigns: %{show: show}}) do
    {:noreply, socket |> assign(show: !show)}
  end
end

defmodule MoonWeb.Pages.Components.Dialog.PopoverPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Components.Dialog.PopoverPage.PopoverExample
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

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

  data props_info_array, :list,
    default: [
      %{
        :name => 'content',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Content of popover'
      },
      %{
        :name => 'default',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Content of popover toggle element'
      },
      %{
        :name => 'default_state',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Open/Closed popover by default'
      },
      %{
        :name => 'close_on_click_outside',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Close popover if clicked outside'
      },
      %{
        :name => 'placement',
        :type =>
          'top-start | top | top-end | right-start | right | right-end | bottom-start | bottom | bottom-end | left-start | left | left-end',
        :required => 'false',
        :default => 'bottom-start',
        :description => 'TODO - Placement of popover'
      },
      %{
        :name => 'min_width',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - min-width value of popover (px)min-width value of popover (px)'
      },
      %{
        :name => 'max_width',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - max-width value of popover (px)'
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

        <p>
          <Link to="https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=1313%3A15085">Figma design</Link>
          <Link
            class="mb-4"
            to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/popover_v2.ex"
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
              {get_popover_code(placement)}
            </:code>
          </ExampleAndCode>
        {/for}

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
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

  def get_popover_code(placement) do
    """
      <Popover show={@show} placement={#{placement}} on_close="toogle_show">
        <Chip on_click="toogle_show">Click Me</Chip>
        <:content>...</:content>
      </Popover>
    """
  end
end
