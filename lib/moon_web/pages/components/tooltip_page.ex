defmodule MoonWeb.Pages.Components.TooltipPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.{Button, Tooltip}
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.Facing.DeprecationWarning

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/tooltip",
        name: "Tooltip"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"children",
        :type => ~c"slot",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Component or element which Tooltip wraps around"
      },
      %{
        :name => ~c"text",
        :type => ~c"string",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Textual content for Tooltip"
      },
      %{
        :name => ~c"icon",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"Icon shown in the Tooltip"
      },
      %{
        :name => ~c"content",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Custom component shown in the Tooltip"
      },
      %{
        :name => ~c"placement",
        :type => ~c"top | bottom | left | right",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Where Tooltip will be shown"
      },
      %{
        :name => ~c"show",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Should Tooltip be shown persistently"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Tooltip">
        <DeprecationWarning
          name="Tooltip"
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.TooltipPage)}
        />
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
