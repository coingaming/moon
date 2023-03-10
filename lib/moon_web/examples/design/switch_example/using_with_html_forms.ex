defmodule MoonWeb.Examples.Design.SwitchExample.UsingWithHtmlForms do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Switch
  alias Moon.Components.Form
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def render(assigns) do
    ~F"""
    <div>
      <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
        <Switch id="switch_11" />
      </Form>
    </div>
    """
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

  def code() do
    """
    alias Moon.Design.Form.Switch

    ...


    """
  end
end
