defmodule Moon.Components.Context do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      alias Surface.Components.Context
    end
  end
end
