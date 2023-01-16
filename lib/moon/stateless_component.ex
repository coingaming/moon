defmodule Moon.StatelessComponent do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      use Surface.Component
      import Moon.Helpers.Styled
      import Moon.Helpers.MergeClass
    end
  end
end
