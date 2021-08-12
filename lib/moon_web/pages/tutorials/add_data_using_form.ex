defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm do
  use MoonWeb, :live_view
  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias Moon.Components.FileInput
  alias Moon.Components.Form
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Select
  alias Moon.Components.Stack
  alias Moon.Components.Switch
  alias Moon.Components.TextInput
  alias Moon.Components.Toast.Message
  alias Moon.Components.ToastStack
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  @default_user_map %{
    name: "",
    email: "",
    gender: "",
    document_filename: nil
  }

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    user_changeset = User.changeset(%User{}, @default_user_map)

    gender_options = [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Other", value: "other"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]

    socket =
      socket
      |> assign(
        theme_name: theme_name,
        active_page: __MODULE__,
        user_map: @default_user_map,
        user_changeset: user_changeset,
        gender_options: gender_options,
        lock_fields: false,
        uploaded_files: [],
        enable_validations: false
      )
      |> allow_upload(:file, accept: ~w(.jpg .jpeg .png .pdf), max_entries: 1)

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <Stack>
      <Heading size={32}>Mutate data using form</Heading>

      <p>Moon Forms -> Surface Forms -> Phoenix LiveView forms -> HTML forms</p>

      <p>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/dropdown_page.ex">Source code of this page</Link>
      </p>

      <Heading size={24} class="mt-4" is_regular>With changeset</Heading>

      <ExampleAndCode show_state>
        <:example>
          <ToastStack id="toasts" />

          <Form
            for={@user_changeset}
            change="update_user_changeset"
            submit="save_user_changeset"
            autocomplete="off"
          >
            <Stack>
              <div class="flex items-center">
                <Switch checked={@lock_fields} on_change="lock_form_fields" />
                <span class="ml-3">Lock fields</span>
              </div>

              <!-- TODO: Add form validation -->
              <!-- div class="flex items-center">
                <Switch checked={ @enable_validations } />
                <span class="ml-3">Enable validations (not implemented)</span>
              </div -->

              <TextInput label="Name" field={:name} disabled={@lock_fields} />
              <TextInput label="Email" field={:email} disabled={@lock_fields} />

              <Select
                label="Gender"
                disabled={@lock_fields}
                field={:gender}
                options={@gender_options}
                prompt="Please select gender"
              />

              <FileInput conf={@uploads.file} label="Upload your ID" placeholder="Choose a document..." />

              <Button variant="primary" type="submit">Save</Button>
              <Button variant="secondary" on_click="clear_changeset_form">Cancel</Button>
            </Stack>
          </Form>
        </:example>

        <:code>
          <#CodePreview>
        <ToastStack id="toasts" />

        <Form for={ @user_changeset } change="update_user_changeset" submit="save_user_changeset" autocomplete="off">
          <Stack>
            <div class="flex items-center">
              <Switch checked={ @lock_fields }} on_change="lock_form_fields" />
              <span class="ml-3">Lock fields</span>
            </div>

            <TextInput label="Name" field={ :name } />
            <TextInput label="Email" field={ :email } />

            <Select
              label="Gender"
              field={ :gender }
              options={ @gender_options }
              prompt="Please select gender"
            />

            <FileInput
              conf={ @uploads.file }
              label="Upload your ID"
              placeholder="Choose a document..."
            />

            <Button variant="primary" type="submit">Save</Button>
            <Button variant="secondary" on_click="clear_form">Cancel</Button>
          </Stack>
        </Form>

        def handle_event("save_user_changeset", _, socket) do
          ToastStack.show(
            %Toast.Message{message: "Details saved.", variant: "success"},
            "toasts"
          )
          {:noreply, socket}
        end

        def handle_info({:hide_toast, toast_id}, socket) do
          ToastStack.hide_toast(toast_id, "toasts")
          {:noreply, socket}
        end
      </#CodePreview>
        </:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@gender_options = {inspect(@gender_options, pretty: true)}<br><br>@lock_fields = {@lock_fields}<br><br>@uploads.file.entries = {inspect(@uploads.file.entries, pretty: true)}</:state>
      </ExampleAndCode>

      <Heading size={24} class="mt-4" is_regular>Without changeset</Heading>

      <p>Not recommended, only for edge cases - 99% cases DO NOT USE THIS</p>

      <ExampleAndCode show_state>
        <:example>
          <Form for={:user_map} change="update_user_map" submit="save_user_map" autocomplete="off">
            <Stack>
              <TextInput label="Name" field={:name} value={@user_map.name} />
              <TextInput label="Email" field={:email} value={@user_map.email} />

              <Select
                label="Gender"
                field={:gender}
                options={@gender_options}
                value={@user_map.gender}
                prompt="Please select gender"
              />

              <Button variant="primary" type="submit">Save</Button>
              <Button variant="secondary" on_click="clear_simple_form">Cancel</Button>
            </Stack>
          </Form>
        </:example>

        <:code>
          <#CodePreview>
        <Form for={ :user_map } chane="update_user_map" submit="save_user_map" autocomplete="off">
          <TextInput label="Name" field={ :name } value={ @user_map.name } />
          <TextInput label="Email" field={ :email } value={ @user_map.email } />

          <Select
            label="Gender"
            field={ :gender }
            options={ @gender_options }
            value={ @user_map.gender }
            prompt="Please select gender"
          />

          <Button variant="primary" type="submit">Save</Button>
          <Button variant="secondary" on_click="clear_form">Cancel</Button>
        </Form>
      </#CodePreview>
        </:code>

        <:state>@user_map = {inspect(@user_map)}</:state>
      </ExampleAndCode>
    </Stack>
    """
  end

  def handle_event(
        "update_user_changeset",
        %{"user" => %{"name" => name, "email" => email, "gender" => gender}},
        socket
      ) do
    file = List.first(socket.assigns.uploads.file.entries) || %Phoenix.LiveView.UploadEntry{}

    user_changeset =
      User.changeset(%User{}, %{
        name: name,
        email: email,
        gender: gender,
        document_filename: file.client_name
      })

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("save_user_changeset", _, socket) do
    ToastStack.show(
      %Message{message: "Details saved.", variant: "success"},
      "toasts"
    )

    {:noreply, socket}
  end

  def handle_event(
        "update_user_map",
        %{"user_map" => %{"name" => name, "email" => email, "gender" => gender}},
        socket
      ) do
    {:noreply, assign(socket, user_map: %{name: name, email: email, gender: gender})}
  end

  def handle_event("save_user_map", _, socket) do
    {:noreply, socket}
  end

  def handle_event("clear_changeset_form", _, socket) do
    user_changeset = User.changeset(%User{}, @default_user_map)
    {:noreply, assign(socket, user_changeset: user_changeset, lock_fields: false)}
  end

  def handle_event("clear_simple_form", _, socket) do
    {:noreply, assign(socket, user_map: @default_user_map)}
  end

  def handle_event("lock_form_fields", _, socket) do
    {:noreply, assign(socket, lock_fields: !socket.assigns.lock_fields)}
  end

  def handle_info({:hide_toast, toast_id}, socket) do
    ToastStack.hide_toast(toast_id, "toasts")
    {:noreply, socket}
  end
end
