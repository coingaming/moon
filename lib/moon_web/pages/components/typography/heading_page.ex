# This component is deprecated, use /components/typography/ css classes
defmodule MoonWeb.Pages.Components.Typography.HeadingPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Heading
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
        to: "/components/heading",
        name: "Heading"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'color',
        :type => 'string',
        :required => 'false',
        :default => 'text-bulma',
        :description => 'Heading color'
      },
      %{
        :name => 'size',
        :type => '16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72',
        :required => 'false',
        :default => '16',
        :description => 'Heading size'
      },
      %{
        :name => 'is_regular',
        :type => 'boolean',
        :required => 'false',
        :default => '-',
        :description => 'Whether font weight is normal'
      },
      %{
        :name => 'text_align',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Alignment'
      },
      %{
        :name => 'is_uppercase',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Whether text is uppercase'
      },
      %{
        :name => 'is_underline',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Whether text is underlined'
      },
      %{
        :name => 'line_height',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Custom line height'
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Heading">
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
          We have predefined font sizes: 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72. Line heights are calculated automatically based on font size.
        </p>
        <p>By default font size is 16. You can choose any size.</p>
        <p>
          By default font weight is bold. You can make it thiner.
        </p>
        <p>
          By default Heading color is bulma.100. You can use any color.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Sizes" id="heading_1">
        <:example>
          <div class="flex flex-col gap-2 w-full">
            <Heading>Heading with default font size</Heading>
            <Heading size={16}>Heading with font size 16</Heading>
            <Heading size={18}>Heading with font size 18</Heading>
            <Heading size={20}>Heading with font size 20</Heading>
            <Heading size={24}>Heading with font size 24</Heading>
            <Heading size={32}>Heading with font size 32</Heading>
            <Heading size={48}>font size 48</Heading>
            <Heading size={56}>font size 56</Heading>
            <Heading size={64}>font size 64</Heading>
            <Heading size={72}>font size 72</Heading>
          </div>
        </:example>

        <:code>{heading_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Is regular" id="heading_2">
        <:example>
          <div class="flex flex-col gap-2 w-full">
            <Heading size={24}>Heading with default font weight</Heading>
            <Heading size={24} is_regular>
              Heading with font-weight: regular
            </Heading>
          </div>
        </:example>

        <:code>{heading_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Color" id="heading_3">
        <:example>
          <div class="flex flex-col gap-2 w-full">
            <Heading size={24}>Heading with default color</Heading>
            <Heading size={24} color="trunks">
              Heading with defined color
            </Heading>
            <Heading size={24} color="piccolo">
              Heading with defined color
            </Heading>
            <Heading size={24} color="krillin">
              Heading with defined color
            </Heading>
          </div>
        </:example>

        <:code>{heading_3_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def heading_1_code do
    """
      <Heading>Heading with default font size</Heading>
      <Heading size=16>Heading with font size 16</Heading>
      <Heading size=18>Heading with font size 18</Heading>
      <Heading size=20>Heading with font size 20</Heading>
      <Heading size=24>Heading with font size 24</Heading>
      <Heading size=32>Heading with font size 32</Heading>
      <Heading size=48>font size 48</Heading>
      <Heading size=56>font size 56</Heading>
      <Heading size=64>font size 64</Heading>
      <Heading size=72>font size 72</Heading>
    """
  end

  def heading_2_code do
    """
      <Heading size=24>Heading with default font weight</Heading>
      <Heading size=24 is_regular=true>
        Heading with font-weight: regular
      </Heading>
    """
  end

  def heading_3_code do
    """
      <Heading size=24>Heading with default color</Heading>
      <Heading size=24 color="trunks">
        Heading with defined color
      </Heading>
      <Heading size=24 color="piccolo">
        Heading with defined color
      </Heading>
      <Heading size=24 color="krillin">
        Heading with defined color
      </Heading>
    """
  end
end
