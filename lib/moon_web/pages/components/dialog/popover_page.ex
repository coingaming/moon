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
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Components.Dialog.PopoverPage.PopoverExample
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

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
      <ComponentPageDescription title="Popover">
        <p>Popover</p>
      </ComponentPageDescription>

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
        <ExampleAndCode id={"popover_#{placement}"} title={"Placement: #{placement}"}>
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

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def get_popover_code(placement) do
    """
    <Popover show={@show} placement="#{placement}" on_close="toogle_show">
      <Chip on_click="toogle_show">Click Me</Chip>
      <:content>...</:content>
    </Popover>
    """
  end
end
