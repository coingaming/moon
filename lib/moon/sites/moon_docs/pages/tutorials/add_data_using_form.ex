defmodule Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed

  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.Button
  alias Moon.Components.Select
  alias Moon.Components.CodePreview

  alias Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm.User

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())
  data(user, :any)
  data(gender_options, :any)

  def mount(_params, _session, socket) do
    user_map = %{
      name: "",
      email: "",
      gender: ""
    }

    user_changeset = User.changeset(%User{}, user_map)

    gender_options = [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]

    {:ok,
     assign(socket,
       user_map: user_map,
       user_changeset: user_changeset,
       gender_options: gender_options
     )}
  end

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <h1>Add data using form</h1>

        Todo

        <ul>
          <li>Validation errors on form (end user API will remain same, validation errors will come automatically)</li>
          <li>Check Network -> Websockets (on char update - 4kb of CSS is re-sent). this needs to be optimised. (end user api will remain?)</li>
        </ul>

        <a href="https://github.com/coingaming/moon/blob/master/lib/moon/sites/moon_docs/pages/tutorials/add_data_using_form.ex">https://github.com/coingaming/moon/blob/master/lib/moon/sites/moon_docs/pages/tutorials/add_data_using_form.ex</a>


        <h2>With changeset (recommended approach)</h2>

        <Form for={{ @user_changeset }} change="update_user_changeset" submit="save_user_changeset" autocomplete="off">
          <TextInput label="Name" field="name" />
          <TextInput label="Email" field="email" />

          <Select
            label="Gender"
            field={{ :gender }}
            options={{ @gender_options }}
            prompt="Please select gender"
          />

          <pre>{{ inspect(@user_changeset) }}</pre>

          <Button variant="primary">Save</Button>
          <Button variant="secondary" on_click="go_other_page">Cancel</Button>
        </Form>

        <#CodePreview>
          <Form for={{ @user_changeset }} change="update_user_changeset" submit="save_user_changeset" autocomplete="off">
            <TextInput label="Name" field={{ :name }} />
            <TextInput label="Email" field={{ :email }} />

            <Select
              label="Gender"
              field={{ :gender }}
              options={{ @gender_options }}
              prompt="Please select gender"
            />

            <pre>{{ inspect(@user_changeset) }}</pre>

            <Button variant="primary">Save</Button>
            <Button variant="secondary" on_click="go_other_page">Cancel</Button>
          </Form>
        </#CodePreview>

        <h2>Without changeset (not recommended, only for edge cases - 99% cases DO NOT USE THIS)</h2>

        <Form for={{ :user_map }} change="update_user_map" submit="save_user_map" autocomplete="off">
          <TextInput label="Name" field={{ :name }} value={{ @user_map.name }} />
          <TextInput label="Email" field={{ :email }} value={{ @user_map.email }} />

          <Select
            label="Gender"
            field={{ :gender }}
            options={{ @gender_options }}
            value={{ @user_map.gender }}
            prompt="Please select gender"
          />

          <pre>{{ inspect(@user_map) }}</pre>

          <Button variant="primary">Save</Button>
          <Button variant="secondary" on_click="go_other_page">Cancel</Button>
        </Form>

        <#CodePreview>
          <Form for={{ :user_map }} change="update_user_map" submit="save_user_map" autocomplete="off">
            <TextInput label="Name" field={{ :name }} value={{ @user_map.name }} />
            <TextInput label="Email" field={{ :email }} value={{ @user_map.email }} />

            <Select
              label="Gender"
              field={{ :gender }}
              options={{ @gender_options }}
              value={{ @user_map.gender }}
              prompt="Please select gender"
            />

            <Button variant="primary">Save</Button>
            <Button variant="secondary" on_click="go_other_page">Cancel</Button>
          </Form>
        </#CodePreview>

      </DefaultLayout>
    </Themed>
    """
  end

  def handle_event(
        "update_user_changeset",
        %{"user" => %{"name" => name, "email" => email, "gender" => gender}},
        socket
      ) do

    user_changeset = User.changeset(%User{}, %{name: name, email: email, gender: gender})
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event(
        "update_user_map",
        %{"user_map" => %{"name" => name, "email" => email, "gender" => gender}},
        socket
      ) do
    {:noreply, assign(socket, user_map: %{name: name, email: email, gender: gender})}
  end

  def handle_event(
    "go_other_page",
    _,
    socket
  ) do
    {:noreply, push_redirect(socket, to: "/")}
  end

end
