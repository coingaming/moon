defmodule MoonWeb.Pages.Components.SwitchPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Switch
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
        to: "/components/switch",
        name: "Switch"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'checked',
        :type => 'boolean ',
        :required => 'false',
        :default => 'false',
        :description => 'Is switch checked/unchecked'
      },
      %{
        :name => 'on_change',
        :type => 'event',
        :required => 'false',
        :default => '-',
        :description => 'Event that happens when you click on the switch'
      },
      %{
        :name => 'caption_unchecked',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'Displayed text when unchecked'
      },
      %{
        :name => 'caption_checked',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'Displayed text when checked'
      }
    ]

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "moon-design-light",
        active_page: __MODULE__,
        first_switch_checked: false,
        small_switch_checked: false,
        medium_switch_checked: false,
        large_switch_checked: false,
        icons_switch_checked: false,
        captions_switch_checked: false
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Switch</Heading>

        <p>
          An alternate checkbox appearance for simulating on/off state.
        </p>

        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Components?node-id=60%3A31">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/switch_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/switcher">React implementation</Link>
        </p>

        <div id="first_switch">
          <ExampleAndCode title="Default" class="mt-3" id="switch_1" theme_name={@theme_name}>
            <:example>
              <Switch checked={@first_switch_checked} on_change="handle_first_switch" />
            </:example>

            <:code>
              <#CodePreview>
                <Switch
                  checked={ @checked }
                  on_change="handle_switch"
                />
            </#CodePreview>
            </:code>

            <:state>@checked = {@first_switch_checked}</:state>
          </ExampleAndCode>
        </div>

        <ExampleAndCode title="Size" class="mt-3" id="switch_2" theme_name={@theme_name}>
          <:note>
            Use <code class="bg-goku-40">size</code> prop. Default size is medium.
          </:note>
          <:example>
            <TopToDown>
              <Switch size="small" checked={@small_switch_checked} on_change="handle_small_switch" />

              <Switch size="medium" checked={@medium_switch_checked} on_change="handle_medium_switch" />

              <Switch size="large" checked={@large_switch_checked} on_change="handle_large_switch" />
            </TopToDown>
          </:example>

          <:code>
            <#CodePreview>
              <Switch size="small" />
              <Switch size="medium" />
              <Switch size="large" />
          </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Icons" class="mt-3" id="switch_3" theme_name={@theme_name}>
          <:note>
            Use <code class="bg-goku-40">icons</code> prop. Default value is <code class="bg-goku-40">false</code>.
          </:note>
          <:example>
            <TopToDown>
              <Switch checked={@icons_switch_checked} icons size="small" on_change="handle_icons_switch" />
              <Switch checked={@icons_switch_checked} icons size="medium" on_change="handle_icons_switch" />
              <Switch checked={@icons_switch_checked} icons size="large" on_change="handle_icons_switch" />
            </TopToDown>
          </:example>

          <:code>
            <#CodePreview>
              <Switch icons={ true } />
          </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Captions" class="mt-3" id="switch_4" theme_name={@theme_name}>
          <:note>
            Use <code class="bg-goku-40">caption_unchecked</code> and <code class="bg-goku-40">caption_checked</code> props.
          </:note>
          <:example>
            <TopToDown>
              <Switch
                checked={@captions_switch_checked}
                on_change="handle_captions_switch"
                icons={false}
                size="small"
                caption_unchecked="AM"
                caption_checked="PM"
              />

              <Switch
                checked={@captions_switch_checked}
                on_change="handle_captions_switch"
                icons
                size="medium"
                caption_unchecked="OFF"
                caption_checked="ON"
              />

              <Switch
                checked={@captions_switch_checked}
                on_change="handle_captions_switch"
                icons
                size="large"
                caption_unchecked="Moon"
                caption_checked="Sun"
              />
            </TopToDown>
          </:example>

          <:code>
            <#CodePreview>
              <Switch
                caption_unchecked="OFF"
                caption_checked="ON"
              />
          </#CodePreview>
          </:code>
        </ExampleAndCode>

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

  def handle_event("handle_first_switch", _, socket) do
    socket = assign(socket, first_switch_checked: !socket.assigns.first_switch_checked)
    {:noreply, socket}
  end

  def handle_event("handle_small_switch", _, socket) do
    socket = assign(socket, small_switch_checked: !socket.assigns.small_switch_checked)
    {:noreply, socket}
  end

  def handle_event("handle_medium_switch", _, socket) do
    socket = assign(socket, medium_switch_checked: !socket.assigns.medium_switch_checked)
    {:noreply, socket}
  end

  def handle_event("handle_large_switch", _, socket) do
    socket = assign(socket, large_switch_checked: !socket.assigns.large_switch_checked)
    {:noreply, socket}
  end

  def handle_event("handle_icons_switch", _, socket) do
    socket = assign(socket, icons_switch_checked: !socket.assigns.icons_switch_checked)
    {:noreply, socket}
  end

  def handle_event("handle_captions_switch", _, socket) do
    socket = assign(socket, captions_switch_checked: !socket.assigns.captions_switch_checked)
    {:noreply, socket}
  end
end
