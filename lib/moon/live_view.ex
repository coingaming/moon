defmodule Moon.LiveView do
  defmacro __using__(_opts) do
    quote do
      use Surface.LiveView
      use Moon.Assets
      import Moon.Assets.Files
    end
  end
end
