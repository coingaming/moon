defmodule Moon.StatefulComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.LiveComponent
      import Moon.Helpers.Styled
    end
  end
end
