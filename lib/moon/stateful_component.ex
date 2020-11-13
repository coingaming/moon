defmodule Moon.StatefulComponent do
  defmacro __using__(_opts) do
    quote do
      use Surface.LiveComponent
      import Moon.Helpers.GetClassNameSupport
      import Moon.Helpers.ScreenSizeSupport
      import Moon.Helpers.GetColorSupport
      import Moon.Helpers.GetCssForMapsSupport
      use Moon.Assets
      import Moon.Assets.Files
    end
  end
end
