defmodule Moon.LiveView do
  defmacro __using__(_opts) do
    quote do
      use Surface.LiveView
      import Moon.Helpers.ClassNameSupport
      import Moon.Helpers.ScreenSizeSupport
      import Moon.Helpers.GetCssForMapsSupport

      def handle_event("toggle_theme", %{"new_value" => new_value}, socket) do
        themes_map = %{
          "aposta10-dark" => %Moon.Sites.Aposta10.Themes.Dark{},
          "aposta10-light" => %Moon.Sites.Aposta10.Themes.Light{},
          "moondocs-dark" => %Moon.Sites.MoonDocs.Themes.Dark{},
          "moondocs-light" => %Moon.Sites.MoonDocs.Themes.Light{}
        }

        new_theme = themes_map[new_value] || new_value

        {:noreply, assign(socket, theme: new_theme)}
      end
    end
  end
end
