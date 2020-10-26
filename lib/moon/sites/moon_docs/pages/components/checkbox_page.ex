defmodule Moon.Sites.MoonDocs.Pages.Components.CheckboxPage do
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

        <Stack>
          <Checkbox>
            I confirm that I am at least 18 years of age, and accept the <Link href="#">Terms and Conditions</Link>.
          </Checkbox>

          <Checkbox>
            I agree to receive bonus & marketing emails.
          </Checkbox>
        </Stack>



      </DefaultLayout>
    </Themed>
    """
  end
end
