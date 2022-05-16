defmodule MoonWeb.Pages.Components.ChipPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Components.Chip
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/chip",
        name: "Chip"
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
        <Heading size={32}>Chip</Heading>

        <ExampleAndCode title="Sizes" id="chip_1">
          <:example>
            <div class="flex justify-around w-full items-center">
              <Chip size="small">Small</Chip>
              <Chip>Medium (default)</Chip>
            </div>
          </:example>

          <:code>{chip_1_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Active State" id="chip_2">
          <:example>
            <div class="flex justify-around w-full items-center">
              <Chip size="small" active>Small</Chip>
              <Chip active>Medium (default)</Chip>
            </div>
          </:example>

          <:code>{chip_2_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="IsStroke" id="chip_3">
          <:example>
            <div class="flex justify-around w-full items-center">
              <Chip size="small" is_stroke>Stroke on Hover</Chip>
              <Chip is_stroke>Stroke on Hover</Chip>
            </div>
          </:example>

          <:code>{chip_3_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Icons" id="chip_4">
          <:example>
            <TopToDown>
              <div class="flex justify-around w-full items-center">
                <Chip size="small" left_icon="arrows_left">Left Icon</Chip>
                <Chip size="small" right_icon="arrows_right">Right Icon</Chip>
                <Chip size="small" left_icon="arrows_left" right_icon="arrows_right">Both Icons</Chip>
                <Chip size="small" icon_only="generic_settings" />
              </div>
              <div class="flex justify-around w-full items-center">
                <Chip left_icon="arrows_left">Left Icon</Chip>
                <Chip right_icon="arrows_right">Right Icon</Chip>
                <Chip left_icon="arrows_left" right_icon="arrows_right">Both Icons</Chip>
                <Chip icon_only="generic_settings" />
              </div>
            </TopToDown>
          </:example>

          <:code>{chip_4_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Icons with isStroke" id="chip_5">
          <:example>
            <TopToDown>
              <div class="flex justify-around w-full items-center">
                <Chip size="small" left_icon="arrows_left" is_stroke>Left Icon</Chip>
                <Chip size="small" right_icon="arrows_right" is_stroke>Right Icon</Chip>
                <Chip size="small" left_icon="arrows_left" right_icon="arrows_right" is_stroke>Both Icons</Chip>
                <Chip size="small" icon_only="generic_settings" is_stroke />
              </div>
              <div class="flex justify-around w-full items-center">
                <Chip left_icon="arrows_left" is_stroke>Left Icon</Chip>
                <Chip right_icon="arrows_right" is_stroke>Right Icon</Chip>
                <Chip left_icon="arrows_left" right_icon="arrows_right" is_stroke>Both Icons</Chip>
                <Chip icon_only="generic_settings" is_stroke />
              </div>
            </TopToDown>
          </:example>

          <:code>{chip_5_code()}</:code>
        </ExampleAndCode>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={[
            %{
              :name => 'size',
              :type => 'xsmall | small | medium | large | xlarge',
              :required => 'false',
              :default => 'medium',
              :description => 'Size for chip'
            },
            %{
              :name => 'left_icon',
              :type => 'string',
              :required => 'false',
              :default => '-',
              :description => 'Asset name for the left icon'
            },
            %{
              :name => 'right_icon',
              :type => 'string',
              :required => 'false',
              :default => '-',
              :description => 'Asset name for the right icon'
            },
            %{
              :name => 'icon_only',
              :type => 'string',
              :required => 'false',
              :default => '-',
              :description => 'Asset name for the icon. Icon only and no text shown'
            },
            %{
              :name => 'active',
              :type => 'boolean',
              :required => 'false',
              :default => 'false',
              :description => 'Active state'
            },
            %{
              :name => 'is_stroke',
              :type => 'boolean',
              :required => 'false',
              :default => 'false',
              :description => 'Show stroke on hover/active'
            }
          ]}>
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

  defp chip_1_code do
    """
      <Chip size="small">Small</Chip>
      <Chip>Medium (default)</Chip>
    """
  end

  defp chip_2_code do
    """
      <Chip size="small" active={true}>Small</Chip>
      <Chip active={true}>Medium (default)</Chip>
    """
  end

  defp chip_3_code do
    """
      <Chip size="small" is_stroke>Stroke on Hover</Chip>
      <Chip is_stroke>Stroke on Hover</Chip>
    """
  end

  defp chip_4_code do
    """
      <div class="flex justify-around w-full items-center">
        <Chip size="small" left_icon="arrows_left">Left Icon</Chip>
        <Chip size="small" right_icon="arrows_right">Right Icon</Chip>
        <Chip size="small" left_icon="arrows_left" right_icon="arrows_right">Both Icons</Chip>
        <Chip size="small" icon_only="generic_settings" />
      </div>
      <div class="flex justify-around w-full items-center">
        <Chip left_icon="arrows_left">Left Icon</Chip>
        <Chip right_icon="arrows_right">Right Icon</Chip>
        <Chip left_icon="arrows_left" right_icon="arrows_right">Both Icons</Chip>
        <Chip icon_only="generic_settings" />
      </div>
    """
  end

  defp chip_5_code do
    """
      <div class="flex justify-around w-full items-center">
        <Chip size="small" left_icon="arrows_left" is_stroke>Left Icon</Chip>
        <Chip size="small" right_icon="arrows_right" is_stroke>Right Icon</Chip>
        <Chip size="small" left_icon="arrows_left" right_icon="arrows_right" is_stroke>Both Icons</Chip>
        <Chip size="small" icon_only="generic_settings" is_stroke />
      </div>
      <div class="flex justify-around w-full items-center">
        <Chip left_icon="arrows_left" is_stroke>Left Icon</Chip>
        <Chip right_icon="arrows_right" is_stroke>Right Icon</Chip>
        <Chip left_icon="arrows_left" right_icon="arrows_right" is_stroke>Both Icons</Chip>
        <Chip icon_only="generic_settings" is_stroke />
      </div>
    """
  end
end
