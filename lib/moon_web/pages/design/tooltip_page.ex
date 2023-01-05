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

  data(tooltip_props, :list,
    default: [
      %{
        :name => 'default',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Message shown in tooltip, see Tooltip.Content'
      },
      %{
        :name => 'trigger',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Hover element, see Tooltip.Trigger'
      }
    ]
  )

  data(content_props, :list,
    default: [
      %{
        :name => 'arrow',
        :type => 'slot',
        :required => 'No',
        :default => '-',
        :description => 'Arrow element, see Tooltip.Arrow'
      },
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'Classes for customization'
      },
      %{
        :name => 'position',
        :type =>
          'top-start | top-center | top-end | bottom-start | bottom-center | bottom-end | right | left',
        :required => 'No',
        :default => 'top-center',
        :description => 'Position of the tooltip'
      }
    ]
  )

  data(arrow_props, :list,
    default: [
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'Classes for customization'
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Tooltip" is_aria_support is_rtl_support is_in_progress>
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
              <Tooltip.Arrow />
            </Tooltip.Content>
          </Tooltip>
        </:example>
        <:code>{tooltip_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Position" id="tooltip_placement">
        <:example>
          {#for placement <- ~w(top-start top-center top-end bottom-start bottom-center bottom-end right left)}
            <Tooltip>
              <Tooltip.Trigger>
                <Button variant="secondary">{placement}</Button>
              </Tooltip.Trigger>
              <Tooltip.Content position={placement}>
                I'm a {placement} tooltip
                <Tooltip.Arrow />
              </Tooltip.Content>
            </Tooltip>
          {/for}
        </:example>
        <:code>{tooltip_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Without arrow" id="tooltip_no_arrow">
        <:example>
          <Tooltip>
            <Tooltip.Trigger>
              <Button variant="primary">Hover Me</Button>
            </Tooltip.Trigger>
            <Tooltip.Content>
              I'm a tooltip without arrow
            </Tooltip.Content>
          </Tooltip>
        </:example>
        <:code>{tooltip_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode class="hidden" title="Without shadow" id="tooltip_no_shadow">
        <:example>
          <Tooltip>
            <Tooltip.Trigger>
              <Button variant="primary">Hover Me</Button>
            </Tooltip.Trigger>
            <Tooltip.Content position="top-center" class="shadow-none drop-shadow-none">
              <Tooltip.Arrow />
              I'm a tooltip without shadow
            </Tooltip.Content>
          </Tooltip>
        </:example>
        <:code>{tooltip_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Customizations" id="tooltip_customizations">
        <:example>
          <Tooltip>
            <Tooltip.Trigger>
              <Button variant="secondary">Hover Me</Button>
            </Tooltip.Trigger>
            <Tooltip.Content class="bg-chi-chi/10">
              <Tooltip.Arrow />
              A bit opacity
            </Tooltip.Content>
          </Tooltip>
          <Tooltip>
            <Tooltip.Trigger>
              <Button variant="secondary">Hover Me</Button>
            </Tooltip.Trigger>
            <Tooltip.Content class="text-moon-18 text-krillin font-medium">
              <Tooltip.Arrow />
              Custom font
            </Tooltip.Content>
          </Tooltip>
          <Tooltip>
            <Tooltip.Trigger>
              <Button variant="secondary">Hover Me</Button>
            </Tooltip.Trigger>
            <Tooltip.Content class="bg-roshi/10 text-piccolo">
              <Tooltip.Arrow />
              Custom font & backgound
            </Tooltip.Content>
          </Tooltip>
        </:example>
        <:code>{tooltip_5_code()}</:code>
      </ExampleAndCode>

      <PropsTable title="Tooltip props" data={@tooltip_props} />
      <PropsTable title="Tooltip.Content props" data={@content_props} />
      <PropsTable title="Tooltip.Arrow props" data={@arrow_props} />
    </Page>
    """
  end

  defp tooltip_1_code() do
    """
    alias Moon.Design.Tooltip
    alias Moon.Components.Button

    ...

    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="primary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content>
        I'm a tooltip content
        <Tooltip.Arrow />
      </Tooltip.Content>
    </Tooltip>
    """
  end

  defp tooltip_2_code() do
    """
    {#for placement <- ~w(top-start top-center top-end bottom-start bottom-center bottom-end right left)}
      <Tooltip>
        <Tooltip.Trigger>
          <Button variant="secondary">{placement}</Button>
        </Tooltip.Trigger>
        <Tooltip.Content position={placement}>
          I'm a {placement} tooltip
          <Tooltip.Arrow />
        </Tooltip.Content>
      </Tooltip>
    {/for}
    """
  end

  defp tooltip_3_code() do
    """
    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="primary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content>
        I'm a tooltip without arrow
      </Tooltip.Content>
    </Tooltip>
    """
  end

  defp tooltip_4_code() do
    """
        <Tooltip>
          <Tooltip.Trigger>
            <Button variant="primary">Hover Me</Button>
          </Tooltip.Trigger>
          <Tooltip.Content position="left" class="shadow-none drop-shadow-none">
            <Tooltip.Arrow />
            I'm a tooltip without shadow
          </Tooltip.Content>
        </Tooltip>
    """
  end

  defp tooltip_5_code() do
    """
    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="secondary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content class="bg-chi-chi/10">
        <Tooltip.Arrow />
        A bit opacity
      </Tooltip.Content>
    </Tooltip>
    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="secondary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content class="text-moon-18 text-krillin font-medium">
        <Tooltip.Arrow />
        Custom font
      </Tooltip.Content>
    </Tooltip>
    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="secondary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content class="bg-roshi/10 text-piccolo">
        <Tooltip.Arrow />
        Custom font & backgound
      </Tooltip.Content>
    </Tooltip>
    """
  end
end
