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
  alias Moon.Components.Label

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())
  data(user, :any)

  def mount(params, assigns, socket) do
    IO.puts("mounted")
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

        <Form for={{ :user }} change="updated_user" opts={{ autocomplete: "off" }}>
          <Field name={{ :name }}>
            <TextInput />
          </Field>
          <Field name={{ :email }}>
            <TextInput />
          </Field>
        </Form>

        {{ @user.name }}
        {{ @user.email }}

        <Form for={{ :user }} change="updated_user" opts={{ autocomplete: "off" }}>
          <Field name="name">
            <TextInput value={{ @user.name }}/>
          </Field>
          <Field name="email" class="field">
            <TextInput value={{ @user.email }}/>
          </Field>
        </Form>

        <pre>@user = {{ Jason.encode!(@user, pretty: true) }}</pre>

        <pre>{{ inspect(@user) }}</pre>

        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end

  def handle_event("updated_user", %{"user" => %{"name" => name, "email" => email}}, socket) do
    IO.puts("#{name} #{email}")
    {:noreply, assign(socket, user: %{name: name, email: email})}
  end
end
