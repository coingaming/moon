defmodule Moon.LiveView do
  defmacro __using__(opts \\ []) do
    quote do
      use Surface.LiveView, unquote(opts)
      import Moon.Helpers.Styled
      import Moon.Helpers.MergeClass
    end
  end
end
