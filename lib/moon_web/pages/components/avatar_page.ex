defmodule MoonWeb.Pages.Components.AvatarPage do
  use MoonWeb, :live_view

  alias Moon.Components.Avatar
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <TopToDown>
      <Heading size={32}>Avatar</Heading>

      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon-Components?node-id=60%3A20">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/avatar_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/avatar">React implementation</Link>
      </p>
      <Heading size={24} class="mt-4" is_regular>Usage</Heading>
      Component for displaying user profile image or placeholder if no image

      <Heading size={16}>Image avatars</Heading>
      <ExampleAndCode id="avatar_1">
        <:example>
          <div class="inline-flex">
            <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="xsmall" />
            <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="small" />
            <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="medium" />
            <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="large" />
          </div>
        </:example>

        <:code>
          <#CodePreview>
        <Avatar image_url="//www.fillmurray.com/200/200" size="xsmall" />
        <Avatar image_url="//www.fillmurray.com/200/200" size="small" />
        <Avatar image_url="//www.fillmurray.com/200/200" size="medium" />
        <Avatar image_url="//www.fillmurray.com/200/200" size="large" />
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={16}>Letter avatars</Heading>
      Use name prop. No more than 2 / 3 characters

      <ExampleAndCode id="avatar_2">
        <:example>
          <div class="inline-flex">
            <Avatar class="mx-10" name="JS" color="gohan-100" background_color="piccolo-100" size="xsmall" />
            <Avatar class="mx-10" name="JS" color="gohan-100" background_color="piccolo-100" size="small" />
            <Avatar class="mx-10" name="JS" color="gohan-100" background_color="piccolo-100" size="medium" />
            <Avatar class="mx-10" name="JS" color="gohan-100" background_color="piccolo-100" size="large" />
          </div>
        </:example>

        <:code>
          <#CodePreview>
        <Avatar name="JS" color="gohan-100" background_color="piccolo-100" size="xsmall" />
        <Avatar name="JS" color="gohan-100" background_color="piccolo-100" size="small" />
        <Avatar name="JS" color="gohan-100" background_color="piccolo-100" size="medium" />
        <Avatar name="JS" color="gohan-100" background_color="piccolo-100" size="large" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={16}>Without image and name (Fallback)</Heading>
      <ExampleAndCode id="avatar_3">
        <:example>
          <div class="inline-flex">
            <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="xsmall" />
            <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="small" />
            <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="medium" />
            <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="large" />
          </div>
        </:example>

        <:code>
          <#CodePreview>
        <Avatar color="gohan-100" background_color="piccolo-100" size="xsmall" />
        <Avatar color="gohan-100" background_color="piccolo-100" size="small" />
        <Avatar color="gohan-100" background_color="piccolo-100" size="medium" />
        <Avatar color="gohan-100" background_color="piccolo-100" size="large" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={16}>Different colors</Heading>

      <ExampleAndCode id="avatar_4">
        <:example>
          <div class="inline-flex">
            <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="medium" />
            <Avatar class="mx-10" color="piccolo-100" background_color="gohan-100" size="medium" />
          </div>
        </:example>

        <:code>
          <#CodePreview>
        <Avatar color="gohan-100" background_color="piccolo-100" size="medium" />
        <Avatar color="piccolo-100" background_color="gohan-100" size="medium" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
