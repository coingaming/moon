defmodule Moon.StatelessComponent do
  @moduledoc false

  defmacro __using__(opts \\ []) do
    quote do
      use Surface.Component, unquote(opts)
      import Moon.Helpers.Styled
      import Moon.Helpers.MergeClass
    end
  end
end
