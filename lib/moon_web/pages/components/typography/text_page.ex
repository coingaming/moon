defmodule MoonWeb.Pages.Components.Typography.TextPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Text
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
        to: "/components/text",
        name: "Text"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'color',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Text color'
      },
      %{
        :name => 'size',
        :type => '9 | 10 | 12 | 14 | 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72',
        :required => 'false',
        :default => '16',
        :description => 'TODO - Text size (support size 9)'
      },
      %{
        :name => 'is_bold',
        :type => 'boolean',
        :required => 'false',
        :default => '-',
        :description => 'Whether font weight is bold'
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

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Text</Heading>
        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=27856%3A9609">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/text_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/typography">React implementation</Link>
        </p>

        <p>We treat semantic and visual/cosmetic decisions as two totally <Link to="https://csswizardry.com/2016/02/managing-typography-on-large-apps/">separate</Link> things.</p>
        <p>Our choice of p and span is a purely semantic decision, and doesn't impact cosmetics configured via the size prop.</p>

        <Heading size={20} class="mt-4">Sizes</Heading>
        <p>We have predefined font sizes: 10 | 12 | 14 | 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72. Line heights are calculated automatically based on font size.</p>
        <p>By default font size is 16. You can choose any size.</p>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode id="text_1">
            <:example>
              <TopToDown>
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
              </TopToDown>
            </:example>

            <:code>{text_1_code()}</:code>
          </ExampleAndCode>

          <Heading size={20} class="mt-4">Bold</Heading>
          <p>By default font weight is regular. You can make it bolder.</p>

          <ExampleAndCode id="text_2">
            <:example>
              <TopToDown>
                <Text size={24}>Text with default font weight</Text>
                <Text size={24} is_bold>
                  Text with font-weight: semibold
                </Text>
              </TopToDown>
            </:example>
            <:code>{text_2_code()}</:code>
          </ExampleAndCode>

          <Heading size={20} class="mt-4">Color</Heading>
          <ExampleAndCode id="text_3">
            <:example>
              <TopToDown>
                <Text size={24}>Text with default color</Text>
                <Text size={24} color="trunks-100">
                  Text with defined color
                </Text>
                <Text size={24} color="piccolo-100">
                  Text with defined color
                </Text>
                <Text size={24} color="krillin-100">
                  Text with defined color
                </Text>
              </TopToDown>
            </:example>

            <:code>{text_3_code()}</:code>
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
