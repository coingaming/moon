defmodule MoonWeb.Pages.Components.AvatarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Avatar
  alias Moon.Components.Avatar.StatusOrigin
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
        to: "/components/avatar",
        name: "Avatar"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'bg_color',
        :type => 'string',
        :required => 'false',
        :default => 'bg-gohan-100',
        :description => 'Background color'
      },
      %{
        :name => 'color',
        :type => 'string',
        :required => 'false',
        :default => 'text-bulma-100',
        :description => 'Text color'
      },
      %{
        :name => 'image_url',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Path to the image'
      },
      %{
        :name => 'is_rounded',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => ''
      },
      %{
        :name => 'is_status_active',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Active state for status indication'
      },
      %{
        :name => 'name',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Capital letters of name'
      },
      %{
        :name => 'size',
        :type => 'xs | sm | md | lg | xl | 2xl',
        :required => 'false',
        :default => 'md',
        :description => 'Size for avatar'
      },
      %{
        :name => 'status_origin',
        :type => '%StatusOrigin{ vertical: top | bottom, horizontal: left | right }',
        :required => 'false',
        :default => '%StatusOrigin{vertical: "bottom", horizontal: "right"}',
        :description => 'Position for status indication'
      }
    ]

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Avatar">
        <p>
          Avatars are used to represent an individual, a business, or a celestial being when they interact with any Coingaming brand. While they usually consist of an image, avatars are adaptable - letters or object icons may sometimes be used as fallbacks.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="avatar_01">
        <:example>
          <Avatar />
        </:example>

        <:code>{avatar_01_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Variants" id="avatar_1">
        <:example>
          <Avatar />
          <Avatar name="JS" />
          <Avatar image_url="https://www.fillmurray.com/200/200" />
        </:example>

        <:code>{avatar_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Rounded" id="avatar_1_1">
        <:example>
          <Avatar is_rounded />
          <Avatar is_rounded name="JS" />
          <Avatar is_rounded image_url="https://www.fillmurray.com/200/200" />
        </:example>

        <:code>{avatar_1_0_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Different colours" id="avatar_2">
        <:example>
          <Avatar />
          <Avatar color="text-frieza-100" bg_color="bg-chi-chi-100" />
          <Avatar color="text-gohan-100" bg_color="bg-krillin-100" />
          <Avatar color="text-chi-chi-100" bg_color="bg-frieza-100" />
        </:example>

        <:code>{avatar_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="avatar_3">
        <:example>
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
            <Avatar size="xs" />
            <Avatar size="sm" />
            <Avatar />
            <Avatar size="lg" />
            <Avatar size="xl" />
            <Avatar size="2xl" />
          </div>
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
            <Avatar name="JS" size="xs" />
            <Avatar name="JS" size="sm" />
            <Avatar name="JS" />
            <Avatar name="JS" size="lg" />
            <Avatar name="JS" size="xl" />
            <Avatar name="JS" size="2xl" />
          </div>
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
            <Avatar image_url="https://www.fillmurray.com/200/200" size="xs" />
            <Avatar image_url="https://www.fillmurray.com/200/200" size="sm" />
            <Avatar image_url="https://www.fillmurray.com/200/200" />
            <Avatar image_url="https://www.fillmurray.com/200/200" size="lg" />
            <Avatar image_url="https://www.fillmurray.com/200/200" size="xl" />
            <Avatar image_url="https://www.fillmurray.com/200/200" size="2xl" />
          </div>
        </:example>

        <:code>{avatar_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Active status" id="avatar_4">
        <:example>
          <Avatar />
          <Avatar is_status_active />
          <Avatar image_url="https://www.fillmurray.com/200/200" />
          <Avatar image_url="https://www.fillmurray.com/200/200" is_status_active />
        </:example>

        <:code>{avatar_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Status origin" id="avatar_5">
        <:example>
          <Avatar is_status_active status_origin={%StatusOrigin{vertical: "top", horizontal: "right"}} />
          <Avatar is_status_active status_origin={%StatusOrigin{vertical: "top", horizontal: "left"}} />
          <Avatar is_status_active />
          <Avatar is_status_active status_origin={%StatusOrigin{vertical: "bottom", horizontal: "left"}} />
        </:example>

        <:code>{avatar_5_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def avatar_01_code do
    """
    <Avatar />
    """
  end

  def avatar_1_code do
    """
    <Avatar />
    <Avatar name="JS" />
    <Avatar image_url="https://www.fillmurray.com/200/200" />
    """
  end

  def avatar_1_0_code do
    """
    <Avatar is_rounded />
    <Avatar is_rounded name="JS" />
    <Avatar is_rounded image_url="https://www.fillmurray.com/200/200" />
    """
  end

  def avatar_2_code do
    """
    <Avatar />
    <Avatar color="text-frieza-100" bg_color="bg-chi-chi-100" />
    <Avatar color="text-gohan-100" bg_color="bg-krillin-100" />
    <Avatar color="text-chi-chi-100" bg_color="bg-frieza-100" />
    """
  end

  def avatar_3_code do
    """
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Avatar size="xs" />
      <Avatar size="sm" />
      <Avatar />
      <Avatar size="lg" />
      <Avatar size="xl" />
      <Avatar size="2xl" />
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Avatar name="JS" size="xs" />
      <Avatar name="JS" size="sm" />
      <Avatar name="JS" />
      <Avatar name="JS" size="lg" />
      <Avatar name="JS" size="xl" />
      <Avatar name="JS" size="2xl" />
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Avatar image_url="https://www.fillmurray.com/200/200" size="xs" />
      <Avatar image_url="https://www.fillmurray.com/200/200" size="sm" />
      <Avatar image_url="https://www.fillmurray.com/200/200" />
      <Avatar image_url="https://www.fillmurray.com/200/200" size="lg" />
      <Avatar image_url="https://www.fillmurray.com/200/200" size="xl" />
      <Avatar image_url="https://www.fillmurray.com/200/200" size="2xl" />
    </div>
    """
  end

  def avatar_4_code do
    """
    <Avatar />
    <Avatar is_status_active />
    <Avatar image_url="https://www.fillmurray.com/200/200" />
    <Avatar image_url="https://www.fillmurray.com/200/200" is_status_active />
    """
  end

  def avatar_5_code do
    """
    <Avatar
      is_status_active
      status_origin={%StatusOrigin{ vertical: "top", horizontal: "right" }}
    />
    <Avatar
      is_status_active
      status_origin={%StatusOrigin{ vertical: "top", horizontal: "left" }}
    />
    <Avatar is_status_active />
    <Avatar
      is_status_active
      status_origin={%StatusOrigin{ vertical: "bottom", horizontal: "left" }}
    />
    """
  end
end
