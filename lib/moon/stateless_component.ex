defmodule Moon.StatelessComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.Component
      import Moon.StatelessComponent
      use Moon.Assets
      import Moon.Assets.Files
    end
  end
end
