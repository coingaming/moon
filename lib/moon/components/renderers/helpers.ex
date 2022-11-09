defmodule Moon.Components.Renderers.Helpers do
  Moon.Components.Renderers.Datetime

  def datetime(value) do
    value && Timex.format!(value, "%b %d, %Y, %H:%M:%S", :strftime)
  end
end
