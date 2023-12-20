defmodule Moon.Light.Component do
  @moduledoc false

  defmacro __using__(opts \\ []) do
    quote do
      use Phoenix.Component, unquote(opts)
      import Moon.Helpers.Styled
      import Moon.Helpers.MergeClass
      import Moon.Helpers.MoonRender

      alias Moon.Light.Sur.Event

      def __moduledoc__(), do: @moduledoc

      def get_config(name), do: nil
    end
  end
end
