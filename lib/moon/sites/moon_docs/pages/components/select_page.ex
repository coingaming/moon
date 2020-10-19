defmodule Moon.Sites.MoonDocs.Pages.Components.SelectPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Select
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def mount(_params, _session, socket) do
    gender_options = [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]

    {:ok,
    assign(socket,
      gender_options: gender_options
    )}
  end

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <p>
          <h1>Select</h1>
          A user-controlled menu of options for forms, navigation and more.

          <a href="https://design.sportsbet.io/components/select">https://design.sportsbet.io/components/select</a>

        </p>

        <Select
          label="Gender"
          field={{ :gender }}
          options={{ @gender_options }}
          prompt="Please select gender"
        />

        <#CodePreview>
          <Select
            label="Gender"
            field={{ :gender }}
            options={{ @gender_options }}
            prompt="Please select gender"
          />
        </#CodePreview>

      </DefaultLayout>
    </Themed>
    """
  end
end
