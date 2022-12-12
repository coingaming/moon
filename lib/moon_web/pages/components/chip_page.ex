defmodule MoonWeb.Pages.Components.ChipPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Chip
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
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
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'size',
        :type => 'xs | sm | md | lg | xl',
        :required => 'No',
        :default => 'md',
        :description => 'Size for chip'
      },
      %{
        :name => 'left_icon',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Asset name for the left icon'
      },
      %{
        :name => 'right_icon',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Asset name for the right icon'
      },
      %{
        :name => 'icon_only',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Asset name for the icon. Icon only and no text shown'
      },
      %{
        :name => 'active',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Active state'
      },
      %{
        :name => 'is_stroke',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Show stroke on hover/active'
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Chip">
        <p>Chips are compact little units that represent actions, filters or choices. When shown, they allow users to prompt actions, filter games/content and choose options. We use three types of chips in the Moon:</p>
        <div class="flex flex-col gap-2">
          <p>
            <span class="block font-semibold">Action chip</span>
            Action chips prompt actions related to the game/content.
          </p>
          <p>
            <span class="block font-semibold">Filter chip</span>
            Filter chips let users sieve through large categories.
          </p>
          <p>
            <span class="block font-semibold">Selection chip</span>
            Selection chips allow users to select options that matter to them.
          </p>
        </div>
      </ComponentPageDescription>

      <ExampleAndCode title="Sizes" id="chip_1">
        <:example>
          <Chip size="small">Small</Chip>
          <Chip>Medium (default)</Chip>
        </:example>

        <:code>{chip_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Active State" id="chip_2">
        <:example>
          <Chip size="small" active>Small</Chip>
          <Chip active is_stroke>Medium (default)</Chip>
        </:example>

        <:code>{chip_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="IsStroke" id="chip_3">
        <:example>
          <Chip size="small" is_stroke>Stroke on Hover</Chip>
          <Chip is_stroke>Stroke on Hover</Chip>
        </:example>

        <:code>{chip_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Icons" id="chip_4">
        <:example>
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
            <Chip size="small" left_icon="arrows_left">Left Icon</Chip>
            <Chip size="small" right_icon="arrows_right">Right Icon</Chip>
            <Chip size="small" left_icon="arrows_left" right_icon="arrows_right">Both Icons</Chip>
            <Chip size="small" icon_only="generic_settings" />
          </div>
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
            <Chip left_icon="arrows_left">Left Icon</Chip>
            <Chip right_icon="arrows_right">Right Icon</Chip>
            <Chip left_icon="arrows_left" right_icon="arrows_right">Both Icons</Chip>
            <Chip icon_only="generic_settings" />
          </div>
        </:example>

        <:code>{chip_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Icons with isStroke" id="chip_5">
        <:example>
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
            <Chip size="small" left_icon="arrows_left" is_stroke>Left Icon</Chip>
            <Chip size="small" right_icon="arrows_right" is_stroke>Right Icon</Chip>
            <Chip size="small" left_icon="arrows_left" right_icon="arrows_right" is_stroke>Both Icons</Chip>
            <Chip size="small" icon_only="generic_settings" is_stroke />
          </div>
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
            <Chip left_icon="arrows_left" is_stroke>Left Icon</Chip>
            <Chip right_icon="arrows_right" is_stroke>Right Icon</Chip>
            <Chip left_icon="arrows_left" right_icon="arrows_right" is_stroke>Both Icons</Chip>
            <Chip icon_only="generic_settings" is_stroke />
          </div>
        </:example>

        <:code>{chip_5_code()}</:code>
      </ExampleAndCode>

      <PropsTable title="Chip props" data={@props_info_array} />
    </Page>
    """
  end

  def chip_1_code do
    """
      <Chip size="small">Small</Chip>
      <Chip>Medium (default)</Chip>
    """
  end

  def chip_2_code do
    """
      <Chip size="small" active>Small</Chip>
      <Chip active is_stroke>Medium (default)</Chip>
    """
  end

  def chip_3_code do
    """
      <Chip size="small" is_stroke>Stroke on Hover</Chip>
      <Chip is_stroke>Stroke on Hover</Chip>
    """
  end

  def chip_4_code do
    """
      <div class="flex flex-wrap items-center justify-around gap-2 w-full">
        <Chip size="small" left_icon="arrows_left">Left Icon</Chip>
        <Chip size="small" right_icon="arrows_right">Right Icon</Chip>
        <Chip size="small" left_icon="arrows_left" right_icon="arrows_right">Both Icons</Chip>
        <Chip size="small" icon_only="generic_settings" />
      </div>
      <div class="flex flex-wrap items-center justify-around gap-2 w-full">
        <Chip left_icon="arrows_left">Left Icon</Chip>
        <Chip right_icon="arrows_right">Right Icon</Chip>
        <Chip left_icon="arrows_left" right_icon="arrows_right">Both Icons</Chip>
        <Chip icon_only="generic_settings" />
      </div>
    """
  end

  def chip_5_code do
    """
      <div class="flex flex-wrap items-center justify-around gap-2 w-full">
        <Chip size="small" left_icon="arrows_left" is_stroke>Left Icon</Chip>
        <Chip size="small" right_icon="arrows_right" is_stroke>Right Icon</Chip>
        <Chip size="small" left_icon="arrows_left" right_icon="arrows_right" is_stroke>Both Icons</Chip>
        <Chip size="small" icon_only="generic_settings" is_stroke />
      </div>
      <div class="flex flex-wrap items-center justify-around gap-2 w-full">
        <Chip left_icon="arrows_left" is_stroke>Left Icon</Chip>
        <Chip right_icon="arrows_right" is_stroke>Right Icon</Chip>
        <Chip left_icon="arrows_left" right_icon="arrows_right" is_stroke>Both Icons</Chip>
        <Chip icon_only="generic_settings" is_stroke />
      </div>
    """
  end
end
