defmodule Moon.Helpers.Sessioned do
  @moduledoc """
    helper functions for operations with session & context stored values
  """

  #  import Phoenix.LiveView, only: [assign: 2, assign: 3]

  defmacro __using__(_opts \\ []) do
    quote do
      import PhoenixLiveSession, only: [put_session: 3, maybe_subscribe: 2]

      def mount(params, session, socket) do
        socket =
          socket
          |> assign(
            theme_name: session["theme_name"] || "moon-design-light",
            direction: session["direction"] || "ltr",
            active_page: __MODULE__
          )
          |> maybe_subscribe(session)

        {:ok,
         case Kernel.function_exported?(__MODULE__, :postmount, 3) &&
                apply(__MODULE__, :postmount, [params, session, socket]) do
           {:ok, socket} -> socket
           false -> socket
         end}
      end

      def handle_event(
            "set_context_param",
            %{"selected_direction" => %{"is_rtl" => is_rtl}},
            socket
          )
          when is_rtl in ["true", "false"] do
        direction = (is_rtl == "true" && "rtl") || "ltr"

        {:noreply,
         socket
         |> assign(:direction, direction)
         |> put_session(:direction, direction)}
      end

      def handle_event(
            "set_context_param",
            %{"selected_theme" => %{"is_dark" => is_dark}},
            socket
          )
          when is_dark in ["true", "false"] do
        theme_name =
          (socket.assigns.theme_name
           |> String.replace(["-light", "-dark"], "")) <>
            ((is_dark == "true" && "-dark") || "-light")

        {:noreply,
         socket
         |> assign(:theme_name, theme_name)
         |> put_session(:theme_name, theme_name)}
      end

      def handle_event("update_selected_theme", %{"value" => theme}, socket) do
        theme_name =
          theme <>
            ((String.ends_with?(socket.assigns.theme_name, "-dark") && "-dark") || "-light")

        {:noreply,
         socket
         |> assign(:theme_name, theme_name)
         |> put_session(:theme_name, theme_name)}
      end
    end
  end
end
