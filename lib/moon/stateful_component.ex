defmodule Moon.StatefulComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.LiveComponent
      use Moon.Assets
      import Moon.Assets.Files
    end
  end
end
