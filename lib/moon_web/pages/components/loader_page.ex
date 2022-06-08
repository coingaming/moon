defmodule MoonWeb.Pages.Components.LoaderPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Components.Loader
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/loader",
        name: "Loader"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'color',
        :type => 'string',
        :required => 'false',
        :default => 'bulma-100',
        :description => 'Colour of Loader'
      },
      %{
        :name => 'size',
        :type => 'twoxsmall | xsmall | small | medium | large',
        :required => 'false',
        :default => 'medium',
        :description => 'Size of Loader'
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={32}>Loader</Heading>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode title="Default" id="loader_1">
            <:example>
              <div class="flex gap-4 justify-center w-full items-center">
                <Loader />
              </div>
            </:example>

            <:code>{loader_1_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Colors" id="loader_2">
            <:example>
              <div class="flex gap-4 justify-center w-full items-center">
                <Loader color="hit-100" />
                <Loader color="trunks-100" />
                <Loader color="krillin-100" />
              </div>
            </:example>

            <:code>{loader_2_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Sizes" id="loader_3">
            <:example>
              <div class="flex gap-4 justify-center w-full items-center">
                <Loader size="twoxsmall" />
                <Loader size="xsmall" />
                <Loader size="small" />
                <Loader />
                <Loader size="large" />
              </div>
            </:example>

            <:code>{loader_3_code()}</:code>
          </ExampleAndCode>
        </Context>

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

  def loader_1_code do
    """
      <Loader/>
    """
  end

  def loader_2_code do
    """
      <Loader color="hit-100"/>
      <Loader color="trunks-100"/>
      <Loader color="krillin-100"/>
    """
  end

  def loader_3_code do
    """
      <Loader size="twoxsmall"/>
      <Loader size="xsmall"/>
      <Loader size="small"/>
      <Loader />
      <Loader size="large"/>
    """
  end
end
