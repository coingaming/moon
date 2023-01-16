defmodule Moon.StatefulComponent do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      use Surface.LiveComponent
      import Moon.Helpers.Styled
      import Moon.Helpers.MergeClass
    end
  end
end
