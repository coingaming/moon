defmodule Moon.Components.Renderers.Helpers do
  @moduledoc false

  def datetime(value) do
    value && Timex.format!(value, "%b %d, %Y, %H:%M:%S", :strftime)
  end
end
