defmodule MoonWeb.Pages.Components.Typography.CaptionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Caption
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
        to: "/components/caption",
        name: "Caption"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'color_class',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Component or element which Tooltip wraps around'
      },
      %{
        :name => 'default',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Content for caption'
      },
      %{
        :name => 'text_align_class',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'TODO - Text alignment (this should be an enum set of values)'
      },
      %{
        :name => 'is_regular',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Is regular font weight'
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Caption</Heading>

        <div>
          Component for presenting short info.
        </div>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode title="Colors" id="example_1">
            <:example>
              <div class="flex justify-around w-full items-center">
                <Caption>Defaul color is Bulma</Caption>
                <Caption color_class="text-piccolo-100">Piccolo</Caption>
                <Caption color_class="text-trunks-100">Trunks</Caption>
                <Caption color_class="text-krillin-100">Krillin</Caption>
              </div>
            </:example>

            <:code>{example_1_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Text Align" id="example_2">
            <:example>
              <div class="flex justify-around w-full items-center">
                <Caption>Text-align is not specified</Caption>
                <Caption text_align_class="text-center">Centered text</Caption>
                <Caption text_align_class="text-right">Right alignment</Caption>
              </div>
            </:example>

            <:code>{example_2_code()}</:code>
          </ExampleAndCode>
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">TabLink Props Tabs</div>
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

  def example_1_code do
    """
    <div class="flex justify-around w-full items-center">
      <Caption>Defaul color is Bulma</Caption>
      <Caption color_class="text-piccolo-100">Piccolo</Caption>
      <Caption color_class="text-trunks-100">Trunks</Caption>
      <Caption color_class="text-krillin-100">Krillin</Caption>
    </div>
    """
  end

  def example_2_code do
    """
    <div class="flex justify-around w-full items-center">
      <Caption>Text-align is not specified</Caption>
      <Caption text_align_class="text-center">Centered text</Caption>
      <Caption text_align_class="text-right">Right alignment</Caption>
    </div>
    """
  end
end
