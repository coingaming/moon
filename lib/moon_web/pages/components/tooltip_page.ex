defmodule MoonWeb.Pages.Components.TooltipPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.{Button, CodePreview, Heading, Link, Tooltip}
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

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
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Tooltip Component</Heading>

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
end
