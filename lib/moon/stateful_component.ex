defmodule Moon.StatefulComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.LiveComponent
      import Moon.Helpers.ClassNameSupport
      import Moon.Helpers.ScreenSizeSupport
      import Moon.Helpers.GetColorSupport
      import Moon.Helpers.GetRemSupport
      import Moon.Helpers.GetCssForMapsSupport
    end
  end
end
