defmodule Moon.StatefulComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.LiveComponent
      use MoonWeb.Assets
      import Moon.Helpers.Styled
    end
  end
end
