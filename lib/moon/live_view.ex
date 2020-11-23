defmodule Moon.LiveView do
  defmacro __using__(opts) do
    quote do
      use Surface.LiveView, unquote(opts)
      use MoonWeb.Assets
      import MoonWeb.Assets.Files
      import Moon.Helpers.Styled
    end
  end
end
