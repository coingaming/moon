defmodule MoonWeb.Examples.Form.RadioExample.ShortSyntax do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Form
  alias Moon.Design.Form.Radio
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Design.Button

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def handle_event("submit", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def render(assigns) do
    ~F"""
    <Form id="short_form" for={@user_changeset} change="changed" submit="submit">
      <Radio field={:gender} options={[male: "Male", female: "Female", invalid: "Invalid"]} />
      <Button type="submit">Submit</Button>
    </Form>
    """
  end

  def code() do
    """
    alias Moon.Design.Form
    alias Moon.Design.Form.Radio
    alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
    alias Moon.Design.Button

    prop(user_changeset, :any, default: User.changeset(%User{}))

    def handle_event("changed", %{"user" => params}, socket) do
      {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
    end

    def handle_event("submit", _, socket) do
      user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})
      {:noreply, assign(socket, user_changeset: user_changeset)}
    end

    def render(assigns) do
      ~F\"""
      <Form for={@user_changeset} change="changed" submit="submit">
        <Radio field={:gender} options={[male: "Male", female: "Female", invalid: "Invalid"]} />
        <Button type="submit">Submit</Button>
      </Form>
      \"""
    end
    """
  end
end
