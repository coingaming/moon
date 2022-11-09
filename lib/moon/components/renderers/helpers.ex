defmodule Moon.Components.Renderers.Helpers do
  @moduledoc false

  Moon.Components.Renderers.Datetime

  def datetime(value) do
    value && Timex.format!(value, "%b %d, %Y, %H:%M:%S", :strftime)
  end
end
