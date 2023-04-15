defmodule MoonWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use MoonWeb, :controller
      use MoonWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def static_paths, do: ~w(assets fonts images themes favicon.ico robots.txt)

  def controller do
    quote do
      use Phoenix.Controller, namespace: MoonWeb,
        formats: [:html, :json],
        layouts: [html: MoonWeb.Layouts]

      import Plug.Conn
      import MoonWeb.Gettext
      alias MoonWeb.Router.Helpers, as: Routes

      unquote(verified_routes())
    end
  end

  def html do
    quote do
      use Phoenix.Component

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_csrf_token: 0, view_module: 1, view_template: 1]

      # Include general helpers for rendering HTML
      unquote(html_helpers())
    end
  end

  def live_view do
    quote do
      use Moon.LiveView,
        layout: {MoonWeb.Layouts, :app}

      unquote(html_helpers())
    end
  end

  def stateless_component do
    quote do
      use Moon.StatelessComponent

      unquote(html_helpers())
    end
  end

  def stateful_component do
    quote do
      use Moon.StatefulComponent

      unquote(html_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(html_helpers())
    end
  end

  def router do
    quote do
      use Phoenix.Router, helpers: true

      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import MoonWeb.Gettext
    end
  end

  defp html_helpers do
    quote do
      # Use all HTML functionality (forms, tags, etc)
      # use Phoenix.HTML

      # Import LiveView helpers (live_render, live_component, live_patch, etc)
      import Phoenix.LiveView.Helpers

      # Import basic rendering functionality (render, render_layout, etc)
      import Phoenix.HTML

      import MoonWeb.ErrorHelpers
      import MoonWeb.Gettext
      import MoonWeb.Router.Helpers, only: [live_path: 2, live_path: 3]
      # import Routes, only: [static_path: 2]

      import MoonWeb.Helpers.Html

      # Routes generation with the ~p sigil
      unquote(verified_routes())
    end
  end

  def example do
  end

  defp verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: MoonWeb.Endpoint,
        router: MoonWeb.Router,
        statics: MoonWeb.static_paths()
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
