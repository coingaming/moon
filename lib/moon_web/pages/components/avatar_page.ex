defmodule MoonWeb.Pages.Components.AvatarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Avatar
  alias Moon.Components.Avatar.StatusOrigin
  alias Moon.Components.Heading
  alias Moon.Components.Link
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
        to: "/components/avatar",
        name: "Avatar"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'size',
        :type => 'xsmall | small | medium | large | xlarge | twoxlarge',
        :required => 'false',
        :default => 'medium',
        :description => 'Size for avatar'
      },
      %{
        :name => 'name',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Capital letters of name'
      },
      %{
        :name => 'image_url',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Path to the image'
      },
      %{
        :name => 'status_origin',
        :type => '%StatusOrigin{ vertical: top | bottom, horizontal: left | right }',
        :required => 'false',
        :default => '%StatusOrigin{vertical: "bottom", horizontal: "right"}',
        :description => 'Position for status indication'
      },
      %{
        :name => 'is_status_active',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Active state for status indication'
      },
      %{
        :name => 'color',
        :type => 'string',
        :required => 'false',
        :default => 'piccolo-100',
        :description => 'Text color'
      },
      %{
        :name => 'background-color',
        :type => 'string',
        :required => 'false',
        :default => 'gohan-100',
        :description => 'Background color'
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
        <Heading size={56} class="mb-4">Avatar</Heading>

        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon-Components?node-id=60%3A20">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/avatar_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/avatar">React implementation</Link>
        </p>
        Component for displaying user profile image or placeholder if no image

        <ExampleAndCode title="Variants" id="avatar_1" theme_name={@theme_name}>
          <:example>
            <div class="flex justify-around w-full items-center">
              <Avatar />
              <Avatar name="JS" />
              <Avatar image_url="https://www.fillmurray.com/200/200" />
            </div>
          </:example>

          <:code>{avatar_1_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Different colours" id="avatar_2" theme_name={@theme_name}>
          <:example>
            <div class="flex justify-around w-full items-center">
              <Avatar />
              <Avatar color="frieza-100" background_color="chi-chi-100" />
              <Avatar color="gohan-100" background_color="krillin-100" />
              <Avatar color="chi-chi-100" background_color="frieza-100" />
            </div>
          </:example>

          <:code>{avatar_2_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Different sizes" id="avatar_3" theme_name={@theme_name}>
          <:example>
            <TopToDown>
              <div class="flex justify-around items-center w-full mb-4">
                <Avatar size="xsmall" />
                <Avatar size="small" />
                <Avatar />
                <Avatar size="large" />
                <Avatar size="xlarge" />
                <Avatar size="twoxlarge" />
              </div>
              <div class="flex justify-around items-center w-full mb-4">
                <Avatar name="JS" size="xsmall" />
                <Avatar name="JS" size="small" />
                <Avatar name="JS" />
                <Avatar name="JS" size="large" />
                <Avatar name="JS" size="xlarge" />
                <Avatar name="JS" size="twoxlarge" />
              </div>
              <div class="flex justify-around items-center w-full">
                <Avatar image_url="https://www.fillmurray.com/200/200" size="xsmall" />
                <Avatar image_url="https://www.fillmurray.com/200/200" size="small" />
                <Avatar image_url="https://www.fillmurray.com/200/200" />
                <Avatar image_url="https://www.fillmurray.com/200/200" size="large" />
                <Avatar image_url="https://www.fillmurray.com/200/200" size="xlarge" />
                <Avatar image_url="https://www.fillmurray.com/200/200" size="twoxlarge" />
              </div>
            </TopToDown>
          </:example>

          <:code>{avatar_3_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Active status" id="avatar_4" theme_name={@theme_name}>
          <:example>
            <div class="flex justify-around w-full items-center">
              <Avatar />
              <Avatar is_status_active />
              <Avatar image_url="https://www.fillmurray.com/200/200" />
              <Avatar image_url="https://www.fillmurray.com/200/200" is_status_active />
            </div>
          </:example>

          <:code>{avatar_4_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Status origin" id="avatar_5" theme_name={@theme_name}>
          <:example>
            <div class="flex justify-around w-full items-center">
              <Avatar is_status_active status_origin={%StatusOrigin{vertical: "top", horizontal: "right"}} />
              <Avatar is_status_active status_origin={%StatusOrigin{vertical: "top", horizontal: "left"}} />
              <Avatar is_status_active />
              <Avatar is_status_active status_origin={%StatusOrigin{vertical: "bottom", horizontal: "left"}} />
            </div>
          </:example>

          <:code>{avatar_5_code()}</:code>
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

  defp avatar_1_code do
    """
      <Avatar />
      <Avatar name="JS" />
      <Avatar image_url="https://www.fillmurray.com/200/200" />
    """
  end

  defp avatar_2_code do
    """
      <Avatar />
      <Avatar color="frieza-100" background_color="chi-chi-100" />
      <Avatar color="gohan-100" background_color="krillin-100" />
      <Avatar color="chi-chi-100" background_color="frieza-100" />
    """
  end

  defp avatar_3_code do
    """
    <div class="flex justify-around items-center w-full mb-4">
      <Avatar size="xsmall" />
      <Avatar size="small" />
      <Avatar />
      <Avatar size="large" />
      <Avatar size="xlarge" />
      <Avatar size="twoxlarge" />
    </div>
    <div class="flex justify-around items-center w-full mb-4">
      <Avatar name="JS" size="xsmall" />
      <Avatar name="JS" size="small" />
      <Avatar name="JS" />
      <Avatar name="JS" size="large" />
      <Avatar name="JS" size="xlarge" />
      <Avatar name="JS" size="twoxlarge" />
    </div>
    <div class="flex justify-around items-center w-full">
      <Avatar image_url="https://www.fillmurray.com/200/200" size="xsmall" />
      <Avatar image_url="https://www.fillmurray.com/200/200" size="small" />
      <Avatar image_url="https://www.fillmurray.com/200/200" />
      <Avatar image_url="https://www.fillmurray.com/200/200" size="large" />
      <Avatar image_url="https://www.fillmurray.com/200/200" size="xlarge" />
      <Avatar image_url="https://www.fillmurray.com/200/200" size="twoxlarge" />
    </div>
    """
  end

  defp avatar_4_code do
    """
      <Avatar />
      <Avatar is_status_active />
      <Avatar image_url="https://www.fillmurray.com/200/200" />
      <Avatar image_url="https://www.fillmurray.com/200/200" is_status_active />
    """
  end

  defp avatar_5_code do
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
