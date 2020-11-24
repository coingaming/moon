defmodule Moon.StatelessComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.Component
      import Moon.StatelessComponent
      use MoonWeb.Assets
      import Moon.Helpers.Styled
    end
  end
end
