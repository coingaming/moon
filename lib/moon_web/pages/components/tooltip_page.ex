defmodule MoonWeb.Pages.Components.TooltipPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.{Button, Tooltip}
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

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

  data props_info_array, :list,
    default: [
      %{
        :name => 'children',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Component or element which Tooltip wraps around'
      },
      %{
        :name => 'text',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'Textual content for Tooltip'
      },
      %{
        :name => 'icon',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'Icon shown in the Tooltip'
      },
      %{
        :name => 'content',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Custom component shown in the Tooltip'
      },
      %{
        :name => 'placement',
        :type => 'top | bottom | left | right',
        :required => 'true',
        :default => '-',
        :description => 'Where Tooltip will be shown'
      },
      %{
        :name => 'show',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Should Tooltip be shown persistently'
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
      <ComponentPageDescription title="Tooltip">
        <p>
          Tooltip
        </p>
      </ComponentPageDescription>

      {#for placement <- ["top", "right", "bottom", "left"]}
        <ExampleAndCode title={placement} id={"tooltip_#{placement}"}>
          <:example>
            <Tooltip placement={placement} text={placement}>
              <Button variant="primary">Hover Me</Button>
            </Tooltip>
          </:example>
          <:code>{tooltip_1_code(placement)}</:code>
        </ExampleAndCode>
      {/for}

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def tooltip_1_code(placement) do
    """
      <Tooltip placement="#{placement}" text="#{placement}">
        <Button variant="primary">Hover Me</Button>
      </Tooltip>
    """
  end
end
