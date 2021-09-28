defmodule MoonWeb.Pages.Components.AvatarPage do
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
          <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/avatar_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/avatar">React implementation</Link>
        </p>
        Component for displaying user profile image or placeholder if no image

        <ExampleAndCode title="Image avatars" id="avatar_1">
          <:example>
            <LeftToRight>
              <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="xsmall" />
              <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="small" />
              <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="medium" />
              <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="large" />
            </LeftToRight>
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

        <ExampleAndCode title="Letter avatars" id="avatar_2">
          <:note>
            Use name prop. No more than 2 / 3 characters
          </:note>
          <:example>
            <LeftToRight>
              <Avatar class="mx-10" name="JS" color="gohan-100" background_color="piccolo-100" size="xsmall" />
              <Avatar class="mx-10" name="JS" color="gohan-100" background_color="piccolo-100" size="small" />
              <Avatar class="mx-10" name="JS" color="gohan-100" background_color="piccolo-100" size="medium" />
              <Avatar class="mx-10" name="JS" color="gohan-100" background_color="piccolo-100" size="large" />
            </LeftToRight>
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
        <ExampleAndCode title="Without image and name (Fallback)" id="avatar_3">
          <:example>
            <LeftToRight>
              <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="xsmall" />
              <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="small" />
              <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="medium" />
              <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="large" />
            </LeftToRight>
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
        <ExampleAndCode title="Different colors" id="avatar_4">
          <:example>
            <LeftToRight>
              <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="medium" />
              <Avatar class="mx-10" color="piccolo-100" background_color="gohan-100" size="medium" />
            </LeftToRight>
          </:example>
          <:code>
            <#CodePreview>
        <Avatar color="gohan-100" background_color="piccolo-100" size="medium" />
        <Avatar color="piccolo-100" background_color="gohan-100" size="medium" />
        </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
