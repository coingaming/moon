defmodule Moon.Components.MenuItem.MultiTitle do
  @moduledoc false

  use Moon.StatelessComponent

  prop(title, :string)
  prop(text, :string)

  slot(default)

  def render(assigns) do
    ~F"""
    <span class="block grow text-start text-bulma overflow-hidden">
      <span :if={@title} class="block text-bulma text-moon-14">{@title}</span>
      <span :if={@text} class="flex text-trunks-100 text-moon-12">
        <span class="flex-1 truncate"><#slot>{@text}</#slot></span>
      </span>
    </span>
    """
  end
end
