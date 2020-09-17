defmodule Moon.StatelessComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.Component
      import Plug.Conn
      import Moon.StatelessComponent
      import Moon.Helpers.ClassNameSupport
      import Moon.Helpers.ResolutionSupport
    end
  end
end
