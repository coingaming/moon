defmodule Moon.StatelessComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.Component
      import Moon.StatelessComponent
      import Moon.Helpers.GetClassNameSupport
      import Moon.Helpers.ScreenSizeSupport
      import Moon.Helpers.GetColorSupport
      import Moon.Helpers.GetCssForMapsSupport
    end
  end
end
