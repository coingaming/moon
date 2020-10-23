defmodule Moon.LiveView do
  defmacro __using__(opts) do
    quote do
      use Surface.LiveView, unquote(opts)
      import Moon.Helpers.GetClassNameSupport
      import Moon.Helpers.ScreenSizeSupport
      import Moon.Helpers.GetCssForMapsSupport

      def handle_event("toggle_theme", %{"new_value" => new_value}, socket) do
        themes_map = %{
          "aposta10-dark" => Moon.Themes.Aposta10Dark.get_config(),
          "aposta10-light" => Moon.Themes.Aposta10Light.get_config(),
          "moondocs-dark" => Moon.Themes.SportsbetDark.get_config(),
          "moondocs-light" => Moon.Themes.SportsbetLight.get_config()
        }

        new_theme = themes_map[new_value] || new_value

        {:noreply, assign(socket, theme: new_theme)}
      end
    end
  end
end
