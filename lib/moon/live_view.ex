defmodule Moon.LiveView do
  defmacro __using__(_opts) do
    quote do
      use Surface.LiveView
      import Moon.Helpers.ClassNameSupport
      import Moon.Helpers.ScreenSizeSupport

      def handle_event("toggle_theme", %{"new_value" => new_value}, socket) do
        themes_map = %{
          "Elixir.Moon.Sites.Aposta10.Themes.Light" => Moon.Sites.Aposta10.Themes.Light,
          "Elixir.Moon.Sites.Aposta10.Themes.Dark" => Moon.Sites.Aposta10.Themes.Dark
        }

        new_theme = themes_map[new_value] || new_value

        {:noreply, assign(socket, theme: new_theme)}
      end
    end
  end
end
