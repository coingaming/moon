defmodule MoonWeb.Pages.Components.SwitchPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Switch
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

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
      <ComponentPageDescription title="Switch">
        <p>
          Switch
        </p>
      </ComponentPageDescription>

      <Context put={theme_class: @theme_name}>
        <ExampleAndCode title="Default" class="mt-3" id="switch_1">
          <:example>
            <Switch checked={@first_switch_checked} on_change="handle_first_switch" />
          </:example>

          <:code>{switch_1_code()}</:code>

          <:state>@checked = {@first_switch_checked}</:state>
        </ExampleAndCode>

        <ExampleAndCode title="Size" class="mt-3" id="switch_2">
          <:example>
            <Switch size="small" checked={@small_switch_checked} on_change="handle_small_switch" />
            <Switch size="medium" checked={@medium_switch_checked} on_change="handle_medium_switch" />
            <Switch size="large" checked={@large_switch_checked} on_change="handle_large_switch" />
          </:example>

          <:code>{switch_2_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Icons" class="mt-3" id="switch_3">
          <:example>
            <Switch checked={@icons_switch_checked} icons size="small" on_change="handle_icons_switch" />
            <Switch checked={@icons_switch_checked} icons size="medium" on_change="handle_icons_switch" />
            <Switch checked={@icons_switch_checked} icons size="large" on_change="handle_icons_switch" />
          </:example>

          <:code>{switch_3_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Captions" class="mt-3" id="switch_4">
          <:example>
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
          </:example>

          <:code>{switch_4_code()}</:code>
        </ExampleAndCode>
      </Context>

      <PropsTable data={@props_info_array} />
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

  def switch_1_code do
    """
      <Switch checked={@first_switch_checked} on_change="handle_first_switch" />
    """
  end

  def switch_2_code do
    """
      <Switch size="small" checked={@small_switch_checked} on_change="handle_small_switch" />
      <Switch size="medium" checked={@medium_switch_checked} on_change="handle_medium_switch" />
      <Switch size="large" checked={@large_switch_checked} on_change="handle_large_switch" />
    """
  end

  def switch_3_code do
    """
      <Switch checked={@icons_switch_checked} icons size="small" on_change="handle_icons_switch" />
      <Switch checked={@icons_switch_checked} icons size="medium" on_change="handle_icons_switch" />
      <Switch checked={@icons_switch_checked} icons size="large" on_change="handle_icons_switch" />
    """
  end

  def switch_4_code do
    """
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
    """
  end
end
