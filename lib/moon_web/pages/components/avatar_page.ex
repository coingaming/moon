defmodule MoonWeb.Pages.Components.AvatarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Avatar
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

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

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
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

        <ExampleAndCode title="Variants" id="avatar_1">
          <:example>
            <div class="flex justify-around w-full items-center">
              <Avatar />
              <Avatar name="JS" />
              <Avatar image_url="https://www.fillmurray.com/200/200" />
            </div>
          </:example>

          <:code>{avatar_1_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Different colours" id="avatar_2">
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

        <ExampleAndCode title="Different sizes" id="avatar_3">
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

        <ExampleAndCode title="Active status" id="avatar_4">
          <:example>
            <div class="flex justify-around w-full items-center">
              <Avatar />
              <Avatar isStatusActive />
              <Avatar image_url="https://www.fillmurray.com/200/200" />
              <Avatar image_url="https://www.fillmurray.com/200/200" isStatusActive />
            </div>
          </:example>

          <:code>{avatar_4_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Status origin" id="avatar_5">
          <:example>
            <div class="flex justify-around w-full items-center">

            </div>
          </:example>

          <:code>{avatar_5_code()}</:code>
        </ExampleAndCode>

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
      <Chip size="small">Small</Chip>
      <Chip>Medium (default)</Chip>
    """
  end

  defp avatar_5_code do
    """
      <Chip size="small">Small</Chip>
      <Chip>Medium (default)</Chip>
    """
  end
end
