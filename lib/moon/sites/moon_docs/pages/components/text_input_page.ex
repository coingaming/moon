defmodule Moon.Sites.MoonDocs.Pages.Components.TextInputPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Stack
  alias Moon.Components.TextInput

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    example_1 = """
      <Stack style={{ max_width: '25rem' }}>
        <TextInput type="text" label="Text" placeholder="e.g. username" />

        <TextInput type="date" label="Date" />

        <TextInput type="datetime-local" label="Date and time" />

        <TextInput
          type="email"
          label="Email"
          placeholder="e.g. jake.weary@sportsbet.io"
        />

        <TextInput type="number" label="Number" placeholder="e.g. 1234" required />

        <TextInput
          type="password"
          placeholder="Please enter your account password"
          label="Password"
        />

        <TextInput type="search" label="Search" placeholder="e.g. EPL" required />

        <TextInput type="tel" label="Telephone" placeholder="e.g. +372 123 4567" />

        <TextInput type="time" label="Time" />

        <TextInput type="url" label="URL" placeholder="e.g. https://sportsbet.io" />
      </Stack>
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <Stack style={{ "max-width: 25rem;" }}>
          <TextInput type="text" label="Text" placeholder="e.g. username" />

          <TextInput type="date" label="Date" />

          <TextInput type="datetime-local" label="Date and time" />

          <TextInput
            type="email"
            label="Email"
            placeholder="e.g. jake.weary@sportsbet.io"
          />

          <TextInput type="number" label="Number" placeholder="e.g. 1234" required />

          <TextInput
            type="password"
            placeholder="Please enter your account password"
            label="Password"
          />

          <TextInput type="search" label="Search" placeholder="e.g. EPL" required />

          <TextInput type="tel" label="Telephone" placeholder="e.g. +372 123 4567" />

          <TextInput type="time" label="Time" />

          <TextInput type="url" label="URL" placeholder="e.g. https://sportsbet.io" />
        </Stack>

        <pre>{{ example_1 }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end
end
