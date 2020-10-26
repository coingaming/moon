defmodule Moon.Sites.MoonDocs.Pages.Components.CheckboxMultiselectPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Stack
  alias Moon.Components.Checkbox
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <h1>Checkbox</h1>

        <p>
          Checkboxes offer users a 'yes' or 'no' choice. They can be used on their own, or as a multiple choice fieldset.
        </p>



      </DefaultLayout>
    </Themed>
    """
  end
end
