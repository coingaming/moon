defmodule MoonWeb.Examples.Design.SwitchExample.Test do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.TestSwitch
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  prop(user_changeset, :any)

  def render(assigns) do
    ~F"""
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <TestSwitch id="switch_3_1" icons size="small" />
      </Field>
    </Form>
    """
  end

  def mount(_params, _session, socket) do
    user = %User{}

    user_changeset =
      User.changeset(%User{}, %{
        agrees_to_terms_of_service: true,
        agrees_to_marketing_emails: false
      })

    socket =
      assign(socket,
        user_changeset: user_changeset,
        small_switch_checked: false,
        medium_switch_checked: false,
        large_switch_checked: false,
        icons_switch_checked: false,
        captions_switch_checked: false,
        user: user
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event(
        "register_form_update",
        %{
          "user" => params
        },
        socket
      ) do
    user_changeset = User.changeset(socket.assigns.user, params)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("register_form_submit", params, socket) do
    user_changeset =
      User.changeset(socket.assigns.user, params["user"]) |> Map.merge(%{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def switch_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...


    """
  end
end
