defmodule MoonWeb.Pages.Components.ChipPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Chip
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
        to: "/components/chip",
        name: "Chip"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"size",
        :type => ~c"xs | sm | md | lg | xl",
        :required => ~c"No",
        :default => ~c"md",
        :description => ~c"Size for chip"
      },
      %{
        :name => ~c"left_icon",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Asset name for the left icon"
      },
      %{
        :name => ~c"right_icon",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Asset name for the right icon"
      },
      %{
        :name => ~c"icon_only",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Asset name for the icon. Icon only and no text shown"
      },
      %{
        :name => ~c"active",
        :type => ~c"boolean",
        :required => ~c"No",
        :default => ~c"false",
        :description => ~c"Active state"
      },
      %{
        :name => ~c"is_stroke",
        :type => ~c"boolean",
        :required => ~c"No",
        :default => ~c"false",
        :description => ~c"Show stroke on hover/active"
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
        <DeprecationWarning
          name="Chip"
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.ChipPage)}
        />
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
