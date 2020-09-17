defmodule Moon.StatefulComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.LiveComponent
      import Plug.Conn
      import Moon.Helpers.ClassNameSupport
      import Moon.Helpers.ResolutionSupport
    end
  end
end
