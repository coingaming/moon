defmodule MoonWeb.Pages.Components.TextInputPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias MoonWeb.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.TextInput
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <h1>Text Input</h1>

        The input component is used when you need to let users enter the text of some kind, such as their name or phone number etc.

        <TextInput label="Text Input" placeholder="e.g. username" />
        <#CodePreview><TextInput label="Text Input" placeholder="e.g. username" /></#CodePreview>

      </DefaultLayout>
    </Themed>
    """
  end
end
