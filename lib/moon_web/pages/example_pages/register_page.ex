defmodule MoonWeb.Pages.ExamplePages.RegisterPage do
  use MoonWeb, :live_view

  alias Moon.Components.{Form, TextInput, Button}

  data flask, :string
  data token, :string
  data user_agent, :string
  data reg_token, :string

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name} min-w-full min-h-screen"}>
      <img
        src={static_path(@socket, "images/img-1.png")}
        class="absolute left-0 top-0 right-0 w-full h-96 object-cover object-top"
        style="background-color: #346CB0"
      />
      <div class="absolute inset-0">
        <div class="mx-auto" style="max-width: 420px">
          <img
            src={static_path(@socket, "images/logo-vertical-white.svg")}
            class="w-full mt-24 mb-4"
          />

          <div id="login-form" class="w-full p-8 bg-goku-100 rounded shadow-sm">
            <Form for={:login_form} submit="login">
              <TextInput placeholder="Username" field={:username}
                class="mb-4"
              />
              <TextInput placeholder="Email" type="email" field={:email}
                class="mb-4"
              />
              <TextInput placeholder="Password" type="password" field={:password}
                class="mb-4"
              />
              <Button type="submit" class="w-full bg-whis-60">
                <span class="text-lg text-goten-100">Register</span>
              </Button>
            </Form>

            <div class="text-center text-sm text-whis-60 mt-8">
              <a class="underline">Forgot Username?</a>
              <span class="mx-2">·</span>
              <a class="underline">Forgot Password?</a>
            </div>
          </div>

          <footer class="text-center mt-4 text-trunks-100">
            © 2019 All Rights Reserved.
          </footer>
        </div>
      </div>
    </div>
    """
  end

  #
  # Lifecycle methods
  #
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(theme_name: "lab-light")
      |> assign(active_page: __MODULE__)

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def handle_params(params, _, socket) do
    {:noreply, socket
      |> assign(:return_path, Map.get(params, "return_path", "/"))}
  end

  #
  # Event Handlers
  #
  def handle_event("login", %{"login_form" => params}, socket) do
    IO.inspect submit: params
    {:noreply, socket}
  end
end
