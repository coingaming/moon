defmodule Moon.StatelessComponent do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      use Surface.Component
      import Moon.StatelessComponent
      import Moon.Helpers.Styled
    end
  end
end
