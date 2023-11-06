defmodule Moon.StatelessComponent do
  @moduledoc false

  defmacro __using__(opts \\ []) do
    quote do
      use Surface.Component, unquote(opts)
      import Moon.Helpers.Styled
      import Moon.Helpers.MergeClass
      import Moon.Helpers.MoonRender

      def __moduledoc__(), do: @moduledoc
      def __env__(), do: __ENV__
    end
  end
end
