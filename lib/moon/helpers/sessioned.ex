defmodule Moon.Helpers.Sessioned do
  @moduledoc """
    helper functions for operations with session & context stored values
  """

  defmacro __using__(_opts \\ []) do
    quote do
      import PhoenixLiveSession, only: [put_session: 3, maybe_subscribe: 2]

      def mount(params, session, socket) do
        socket =
          socket
          |> assign(active_page: __MODULE__)
          |> maybe_subscribe_own(session)
          |> put_session_assigns(session)

        case Kernel.function_exported?(__MODULE__, :postmount, 3) do
          true ->
            apply(__MODULE__, :postmount, [params, session, socket])

          false ->
            {:ok, socket}
        end
      end

      def handle_info({:live_session_updated, session}, socket) do
        {:noreply, put_session_assigns(socket, session)}
      end

      defp put_session_assigns(socket, session) do
        socket
        |> assign(
          theme_name: session["theme_name"] || "moon-design-light",
          direction: session["direction"] || "ltr"
        )
      end

      defp maybe_subscribe_own(socket, session) do
        (Map.has_key?(session, :__sid__) && maybe_subscribe(socket, session)) || socket
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
         |> redirect(to: live_path(socket, socket.assigns.active_page))
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
         |> redirect(to: live_path(socket, socket.assigns.active_page))
         |> put_session(:theme_name, theme_name)}
      end

      def handle_event("update_selected_theme", %{"value" => theme}, socket) do
        theme_name =
          theme <>
            ((String.ends_with?(socket.assigns.theme_name, "-dark") && "-dark") || "-light")

        {:noreply,
         socket
         |> redirect(to: live_path(socket, socket.assigns.active_page))
         |> put_session(:theme_name, theme_name)}
      end
    end
  end
end
