defmodule Moon.Components.ProgressLinear do
  @moduledoc false

  use Moon.StatelessComponent

  prop(value, :decimal)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="w-full bg-gray-200 rounded bg-hover dark:bg-gray-700">
      <div class="bg-piccolo-100 h-2 rounded" style={"width: #{trunc(@value)}%"} />
    </div>
    """
  end
end
