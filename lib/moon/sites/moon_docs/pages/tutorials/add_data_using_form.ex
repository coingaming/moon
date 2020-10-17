defmodule Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed

  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.Button
  alias Moon.Components.Select

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())
  data(user, :any)
  data(gender_options, :any)

  def mount(_params, _session, socket) do
    user = %{
      name: "",
      email: "",
      gender: "f"
    }

    gender_options = [
      [key: "Female", value: "f"],
      [key: "Male", value: "m"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]

    {:ok,
     assign(socket,
       user: user,
       gender_options: gender_options
     )}
  end

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

      <h1>Add data using form</h1>

      <a href="https://github.com/coingaming/moon/blob/master/lib/moon/sites/moon_docs/pages/tutorials/add_data_using_form.ex">https://github.com/coingaming/moon/blob/master/lib/moon/sites/moon_docs/pages/tutorials/add_data_using_form.ex</a>

      TODO: switch this manual to changeset

      <Form for={{ :user }} change="update_user_changeset" submit="save_user_data" autocomplete="off">
        <TextInput label="Name" name={{ :name }} value={{ @user.name }} />
        <TextInput label="Email" name={{ :email }} value={{ @user.email }} />

        <Select
          label="Gender"
          name={{ :gender }}
          options={{ @gender_options }}
          prompt="Please select gender"
        />

        <Button variant="primary">Save</Button>
        <Button variant="secondary">Cancel</Button>
      </Form>

      <pre>{{ inspect(@user) }}</pre>


      </DefaultLayout>
    </Themed>
    """
  end

  def handle_event(
        "update_user_changeset",
        %{"user" => %{"name" => name, "email" => email, "gender" => gender}},
        socket
      ) do
    {:noreply, assign(socket, user: %{name: name, email: email, gender: gender})}
  end
end
