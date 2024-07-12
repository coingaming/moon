defmodule MoonWeb.Pages.Components.Dialog.PopoverPage.PopoverExample do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Components.Button
  alias Moon.Components.Popover

  prop(placement, :string, required: true)

  data(show, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div>
      <Popover id="popover_id_1" show={@show} placement={@placement} on_close="toggle_show">
        <Button on_click="toggle_show" variant="primary">Click Me</Button>

        <:content>
          <div class="w-64 h-24 flex items-center justify-around bg-goku border-2 border-goku z-50">
            <div class="capitalize">{"#{@placement}"}</div>
          </div>
        </:content>
      </Popover>
    </div>
    """
  end

  def handle_event("toggle_show", _, socket = %{assigns: %{show: show}}) do
    {:noreply, socket |> assign(show: !show)}
  end
end

defmodule MoonWeb.Pages.Components.Dialog.PopoverPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Facing.DeprecationWarning
  alias Moon.Autolayouts.LeftToRight
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Components.Dialog.PopoverPage.PopoverExample
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.Facing.DeprecationWarning

  data(breadcrumbs, :any,
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
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"content",
        :type => ~c"slot",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Content of popover"
      },
      %{
        :name => ~c"default",
        :type => ~c"slot",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Content of popover toggle element"
      },
      %{
        :name => ~c"default_state",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Open/Closed popover by default"
      },
      %{
        :name => ~c"close_on_click_outside",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Close popover if clicked outside"
      },
      %{
        :name => ~c"placement",
        :type =>
          ~c"top-start | top | top-end | right-start | right | right-end | bottom-start | bottom | bottom-end | left-start | left | left-end",
        :required => ~c"No",
        :default => ~c"bottom-start",
        :description => ~c"TODO - Placement of popover"
      },
      %{
        :name => ~c"min_width",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - min-width value of popover (px)min-width value of popover (px)"
      },
      %{
        :name => ~c"max_width",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - max-width value of popover (px)"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Popover">
        <DeprecationWarning
          name="Popover"
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.PopoverPage)}
        />
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
