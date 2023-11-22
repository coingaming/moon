defmodule Moon.Light.LiveCompoent do
  @moduledoc false

  defmacro __using__(opts \\ []) do
    quote do
      use Phoenix.LiveComponent, unquote(opts)
      import Moon.Helpers.Styled
      import Moon.Helpers.MergeClass
      import Moon.Helpers.MoonRender

      def __moduledoc__(), do: @moduledoc
      def __env__(), do: __ENV__
      # def __assigns__(), do: @assigns
      # def __propagate_context_to_slots_map__(), do: @propagate_context_to_slots_map
    end
  end
end
