# This component is deprecated, use /components/typography/ css classes
defmodule MoonWeb.Pages.Components.Typography.TextPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Text
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
        to: "/components/text",
        name: "Text"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"color",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Text color"
      },
      %{
        :name => ~c"size",
        :type => ~c"9 | 10 | 12 | 14 | 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72",
        :required => ~c"No",
        :default => ~c"16",
        :description => ~c"TODO - Text size (support size 9)"
      },
      %{
        :name => ~c"is_bold",
        :type => ~c"boolean",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Whether font weight is bold"
      },
      %{
        :name => ~c"text_align",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Alignment"
      },
      %{
        :name => ~c"is_uppercase",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Whether text is uppercase"
      },
      %{
        :name => ~c"is_underline",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Whether text is underlined"
      },
      %{
        :name => ~c"line_height",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Custom line height"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Text">
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
        <p>
          We have predefined font sizes: 10 | 12 | 14 | 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72. Line heights are calculated automatically based on font size.
        </p>
        <p>By default font size is 16. You can choose any size.</p>
        <p>
          By default font weight is regular. You can make it bolder.
        </p>
        <p>
          By default Text color is bulma.100. You can use any color.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode id="text_1" title="Default">
        <:example>
          <div class="flex flex-col gap-2 w-full">
            <Text>Text with default font size</Text>
            <Text size={10}>Text with font size 10</Text>
            <Text size={12}>Text with font size 12</Text>
            <Text size={14}>Text with font size 14</Text>
            <Text size={16}>Text with font size 16</Text>
            <Text size={18}>Text with font size 18</Text>
            <Text size={20}>Text with font size 20</Text>
            <Text size={24}>Text with font size 24</Text>
            <Text size={32}>Text with font size 32</Text>
            <Text size={48}>font size 48</Text>
            <Text size={56}>font size 56</Text>
            <Text size={64}>font size 64</Text>
            <Text size={72}>font size 72</Text>
          </div>
        </:example>

        <:code>{text_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode id="text_2" title="Bold">
        <:example>
          <div class="flex flex-col gap-2 w-full">
            <Text size={24}>Text with default font weight</Text>
            <Text size={24} is_bold>
              Text with font-weight: semibold
            </Text>
          </div>
        </:example>
        <:code>{text_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode id="text_3" title="color">
        <:example>
          <div class="flex flex-col gap-2 w-full">
            <Text size={24}>Text with default color</Text>
            <Text size={24} color="trunks">
              Text with defined color
            </Text>
            <Text size={24} color="piccolo">
              Text with defined color
            </Text>
            <Text size={24} color="krillin">
              Text with defined color
            </Text>
          </div>
        </:example>

        <:code>{text_3_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def text_1_code do
    """
      <Text>Text with default font size</Text>
      <Text size={10}>Text with font size 10</Text>
      <Text size={12}>Text with font size 12</Text>
      <Text size={14}>Text with font size 14</Text>
      <Text size={16}>Text with font size 16</Text>
      <Text size={18}>Text with font size 18</Text>
      <Text size={20}>Text with font size 20</Text>
      <Text size={24}>Text with font size 24</Text>
      <Text size={32}>Text with font size 32</Text>
      <Text size={48}>font size 48</Text>
      <Text size={56}>font size 56</Text>
      <Text size={64}>font size 64</Text>
      <Text size={72}>font size 72</Text>
    """
  end

  def text_2_code do
    """
      <Text size=24>Text with default font weight</Text>
      <Text size=24 is_bold=true>
        Text with font-weight: semibold
      </Text>
    """
  end

  def text_3_code do
    """
      <Text size=24>Text with default color</Text>
      <Text size=24 color="trunks_100">
        Text with defined color
      </Text>
      <Text size=24 color="piccolo_100">
        Text with defined color
      </Text>
      <Text size=24 color="krillin_100">
        Text with defined color
      </Text>
    """
  end
end
