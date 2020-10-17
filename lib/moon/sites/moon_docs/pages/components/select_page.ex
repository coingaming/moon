defmodule Moon.Sites.MoonDocs.Pages.Components.SelectPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Select
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <p>
          <h1>Select</h1>
          A user-controlled menu of options for forms, navigation and more.

          <a href="https://design.sportsbet.io/components/select">https://design.sportsbet.io/components/select</a>

        </p>

        <Select>
          <option value="">Select an option</option>
          <option value="never-gonna">Never gonna</option>
          <option value="give-you-up">give you up</option>
          <option value="let-you-down">let you down</option>
        </Select>

        <#CodePreview>
          <Select>
            <option value="">Select an option</option>
            <option value="never-gonna">Never gonna</option>
            <option value="give-you-up">give you up</option>
            <option value="let-you-down">let you down</option>
          </Select>
        </#CodePreview>

      </DefaultLayout>
    </Themed>
    """
  end
end
