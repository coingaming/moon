defmodule MoonWeb.Pages.Components.AvatarPage do
  use MoonWeb, :live_view
  alias Moon.Components.Avatar
  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <h1>Avatar</h1>
    Component for displaying user profile image or placeholder if no image

    <a href="https://design.sportsbet.io/components/avatar">https://design.sportsbet.io/components/avatar</a>

    <h2>With user image</h2>

    <Inline>
      <Avatar image_url="//www.fillmurray.com/200/200" size="xsmall" />
      <Avatar image_url="//www.fillmurray.com/200/200" size="small" />
      <Avatar image_url="//www.fillmurray.com/200/200" size="medium" />
      <Avatar image_url="//www.fillmurray.com/200/200" size="large" />
    </Inline>

    <#CodePreview>
      <Inline>
        <Avatar image_url="//www.fillmurray.com/200/200" size="xsmall" />
        <Avatar image_url="//www.fillmurray.com/200/200" size="small" />
        <Avatar image_url="//www.fillmurray.com/200/200" size="medium" />
        <Avatar image_url="//www.fillmurray.com/200/200" size="large" />
      </Inline>
    </#CodePreview>

    <h2>With user name</h2>

    Use name prop. No more than 2 / 3 characters

    <Inline>
      <Avatar name="JS" color="gohan-100" background_color="piccolo-100" size="xsmall" />
      <Avatar name="JS" color="gohan-100" background_color="piccolo-100" size="small" />
      <Avatar name="JS" color="gohan-100" background_color="piccolo-100" size="medium" />
      <Avatar name="JS" color="gohan-100" background_color="piccolo-100" size="large" />
    </Inline>

    <#CodePreview>
      <Inline>
        <Avatar
          name="JS"
          color="gohan-100"
          background_color="piccolo-100"
          size="xsmall"
        />
        <Avatar
          name="JS"
          color="gohan-100"
          background_color="piccolo-100"
          size="small"
        />
        <Avatar
          name="JS"
          color="gohan-100"
          background_color="piccolo-100"
          size="medium"
        />
        <Avatar
          name="JS"
          color="gohan-100"
          background_color="piccolo-100"
          size="large"
        />
      </Inline>
    </#CodePreview>

    <h2>Without image and name</h2>

    <Inline>
      <Avatar color="gohan-100" background_color="piccolo-100" size="xsmall" />
      <Avatar color="gohan-100" background_color="piccolo-100" size="small" />
      <Avatar color="gohan-100" background_color="piccolo-100" size="medium" />
      <Avatar color="gohan-100" background_color="piccolo-100" size="large" />
    </Inline>

    <#CodePreview>
      <Inline>
        <Avatar color="gohan-100" background_color="piccolo-100" size="xsmall" />
        <Avatar color="gohan-100" background_color="piccolo-100" size="small" />
        <Avatar color="gohan-100" background_color="piccolo-100" size="medium" />
        <Avatar color="gohan-100" background_color="piccolo-100" size="large" />
      </Inline>
    </#CodePreview>
    """
  end
end
