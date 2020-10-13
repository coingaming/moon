defmodule Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Badge
  alias Moon.Components.Inline

  alias Surface.Components.Form
  alias Surface.Components.Form.Field
  alias Moon.Components.TextInput

  data(theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{})
  data(name, :string)
  data(email, :string)

  def mount(assigns, socket) do
    {:ok, assign(socket, name: "default name", email: "hello@coingaming.io")}
  end

  def render(assigns) do
    code_as_string = """
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <Form change="updated_user" opts={{ autocomplete: "off" }}>
          <TextInput name={{ :name }} value={{ @name }}/>
          <TextInput name={{ :email }} value={{ @email }}/>
        </Form>

        {{ @name }}
        {{ @email }}


        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end

  def handle_event("updated_user", params) do
    IO.puts(inspect(params))
  end
end
