defmodule MoonWeb.Pages.Design.TooltipPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Tooltip
  alias Moon.Components.Button
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/tooltip",
        name: "Tooltip"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'children',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Component or element which Tooltip wraps around'
      },
      %{
        :name => 'text',
        :type => 'string',
        :required => 'Yes',
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
        :required => 'Yes',
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
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Tooltip">
        <p>
          A means of displaying a description or extra information about an element, usually on hover, but can also be on click or tap.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default tooltip" id="tooltip_default">
        <:example>
          <Tooltip>
            <Tooltip.Trigger>
              <Button variant="primary">Hover Me</Button>
            </Tooltip.Trigger>
            <Tooltip.Content>
              I'm a tooltip content
              <Tooltip.Arrow/>
            </Tooltip.Content>
          </Tooltip>
        </:example>
        <:code>{tooltip_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Placement" id="tooltip_placement">
        <:example>
          {#for placement <- ["top", "left", "right", "bottom"]}
            <Tooltip>
              <Tooltip.Trigger>
                <Button variant="secondary">{placement}</Button>
              </Tooltip.Trigger>
              <Tooltip.Content position={placement}>
                I'm a tooltip content
                <Tooltip.Arrow/>
              </Tooltip.Content>
            </Tooltip>
          {/for}
        </:example>
        <:code>{tooltip_1_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def tooltip_1_code(placement \\ "top") do
    """
      <Tooltip placement="#{placement}" text="#{placement}">
        <Button variant="primary">Hover Me</Button>
      </Tooltip>
    """
  end
end
