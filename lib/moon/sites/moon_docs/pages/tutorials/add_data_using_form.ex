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

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())
  data(user, :any)

  def mount(assigns, socket) do
    {:ok, assign(socket, user: %{name: "", email: ""})}
  end

  def render(assigns) do
    code_as_string = """
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <Form for={{ :user }} change="updated_user" opts={{ autocomplete: "off" }}>
          <TextInput name={{ :name }} value={{ @user.name }}/>
          <TextInput name={{ :email }} value={{ @user.email }}/>
        </Form>

        <pre>@user = {{ Jason.encode!(@user, pretty: true) }}</pre>

        <pre>{{ inspect(@user) }}</pre>

        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end

  def handle_event("updated_user", %{"user" => %{"name" => name, "email" => email}}, socket) do
    {:noreply, assign(socket, user: %{name: name, email: email})}
  end
end
