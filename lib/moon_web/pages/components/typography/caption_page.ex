# This component is deprecated, use /components/typography/ css classes
defmodule MoonWeb.Pages.Components.Typography.CaptionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Caption
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
        to: "/components/caption",
        name: "Caption"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"color_class",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Component or element which Tooltip wraps around"
      },
      %{
        :name => ~c"default",
        :type => ~c"slot",
        :required => ~c"true",
        :default => ~c"-",
        :description => ~c"Content for caption"
      },
      %{
        :name => ~c"text_align_class",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"TODO - Text alignment (this should be an enum set of values)"
      },
      %{
        :name => ~c"is_regular",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Is regular font weight"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Caption">
        <p>
          Component for presenting short info.
        </p>
        <p class="font-medium">
          NB! The component is depricated. Please use our
          <a
            href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Components.TypographyPage,
              theme_name: @theme_name,
              direction: @direction
            )}
            class="text-piccolo transition-colors duration-200 hover:text-hit visited:text-hit"
          >
            new Typography
          </a>
          built with Tailwind.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Colors" id="example_1">
        <:example>
          <Caption>Defaul color is Bulma</Caption>
          <Caption color_class="text-piccolo">Piccolo</Caption>
          <Caption color_class="text-trunks">Trunks</Caption>
          <Caption color_class="text-krillin">Krillin</Caption>
        </:example>

        <:code>{example_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Text Align" id="example_2">
        <:example>
          <Caption>Text-align is not specified</Caption>
          <Caption text_align_class="text-center">Centered text</Caption>
          <Caption text_align_class="text-right">Right alignment</Caption>
        </:example>

        <:code>{example_2_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def example_1_code do
    """
    <Caption>Defaul color is Bulma</Caption>
    <Caption color_class="text-piccolo">Piccolo</Caption>
    <Caption color_class="text-trunks">Trunks</Caption>
    <Caption color_class="text-krillin">Krillin</Caption>
    """
  end

  def example_2_code do
    """
    <Caption>Text-align is not specified</Caption>
    <Caption text_align_class="text-center">Centered text</Caption>
    <Caption text_align_class="text-right">Right alignment</Caption>
    """
  end
end
