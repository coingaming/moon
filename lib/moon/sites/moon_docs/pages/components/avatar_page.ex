defmodule Moon.Sites.MoonDocs.Pages.Components.AvatarPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Avatar
  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <h1>Avatar</h1>
        Component for displaying user profile image or placeholder if no image

        <a href="https://design.sportsbet.io/components/avatar">https://design.sportsbet.io/components/avatar</a>

        <h2>With user image</h2>

        <Inline>
          <Avatar image_url="https://www.fillmurray.com/200/200" size="xsmall" />
          <Avatar image_url="https://www.fillmurray.com/200/200" size="small" />
          <Avatar image_url="https://www.fillmurray.com/200/200" size="medium" />
          <Avatar image_url="https://www.fillmurray.com/200/200" size="large" />
        </Inline>

        <#CodePreview>
          <Inline>
            <Avatar image_url="https://www.fillmurray.com/200/200" size="xsmall" />
            <Avatar image_url="https://www.fillmurray.com/200/200" size="small" />
            <Avatar image_url="https://www.fillmurray.com/200/200" size="medium" />
            <Avatar image_url="https://www.fillmurray.com/200/200" size="large" />
          </Inline>
        </#CodePreview>


        <h2>With user name</h2>

        Use name prop. No more than 2 / 3 characters

        <Inline>
          <Avatar
            name="JS"
            color="gohan_100"
            background_color="piccolo_100"
            size="xsmall"
          />
          <Avatar
            name="JS"
            color="gohan_100"
            background_color="piccolo_100"
            size="small"
          />
          <Avatar
            name="JS"
            color="gohan_100"
            background_color="piccolo_100"
            size="medium"
          />
          <Avatar
            name="JS"
            color="gohan_100"
            background_color="piccolo_100"
            size="large"
          />
        </Inline>


        <#CodePreview>
          <Inline>
            <Avatar
              name="JS"
              color="gohan_100"
              background_color="piccolo_100"
              size="xsmall"
            />
            <Avatar
              name="JS"
              color="gohan_100"
              background_color="piccolo_100"
              size="small"
            />
            <Avatar
              name="JS"
              color="gohan_100"
              background_color="piccolo_100"
              size="medium"
            />
            <Avatar
              name="JS"
              color="gohan_100"
              background_color="piccolo_100"
              size="large"
            />
          </Inline>
        </#CodePreview>

        <h2>Without image and name</h2>

        <Inline>
          <Avatar color="gohan_100" background_color="piccolo_100" size="xsmall" />
          <Avatar color="gohan_100" background_color="piccolo_100" size="small" />
          <Avatar color="gohan_100" background_color="piccolo_100" size="medium" />
          <Avatar color="gohan_100" background_color="piccolo_100" size="large" />
        </Inline>

        <#CodePreview>
          <Inline>
            <Avatar color="gohan_100" background_color="piccolo_100" size="xsmall" />
            <Avatar color="gohan_100" background_color="piccolo_100" size="small" />
            <Avatar color="gohan_100" background_color="piccolo_100" size="medium" />
            <Avatar color="gohan_100" background_color="piccolo_100" size="large" />
          </Inline>
        </#CodePreview>


      </DefaultLayout>
    </Themed>
    """
  end
end
