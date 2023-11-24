defmodule Moon.Light.LiveCompoent do
  @moduledoc false

  defmacro __using__(opts \\ []) do
    quote do
      use Phoenix.LiveComponent, unquote(opts)
      import Moon.Helpers.Styled
      import Moon.Helpers.MergeClass
      import Moon.Helpers.MoonRender

      def __moduledoc__(), do: @moduledoc
    end
  end
end
